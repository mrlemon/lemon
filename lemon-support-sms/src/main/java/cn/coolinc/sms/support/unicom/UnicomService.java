package cn.coolinc.sms.support.unicom;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;

import cn.com.flaginfo.ws.SmsPortType;
import cn.com.flaginfo.ws.Sms_Service;
import cn.coolinc.sms.Result;
import cn.coolinc.sms.SmsService;
/**
 * 联通一信通短信服务
 * @author coolinc
 */
public class UnicomService implements SmsService, InitializingBean {
    private String eid;
    private String username;
    private String password;
    private SmsPortType smsHttpPort;
    private static Map<String,String> responseMap;
    static{
        responseMap.put("0","发送短信成功");
        responseMap.put("1","提交参数不能为空");
        responseMap.put("2","账号无效或未开户");
        responseMap.put("3","账号密码错误,");
        responseMap.put("4","预约发送时间无效");
        responseMap.put("5","IP不合法,");
        responseMap.put("6","号码中含有无效号码或不在规定的号段,");
        responseMap.put("7","内容中含有非法关键字,");
        responseMap.put("8","内容长度超过上限，最大402字符");
        responseMap.put("9","接受号码过多，最大1000");
        responseMap.put("10","黑名单用户");
        responseMap.put("11","提交速度太快");
        responseMap.put("12","您尚未订购[普通短信业务]，暂不能发送该类信息");
        responseMap.put("13","您的[普通短信业务]剩余数量发送不足，暂不能发送该类信息");
        responseMap.put("14","流水号格式不正确");
        responseMap.put("15","流水号重复");
        responseMap.put("16","超出发送上限（操作员帐户当日发送上限）");
        responseMap.put("17","余额不足");
        responseMap.put("18","扣费不成功");
        responseMap.put("20","系统错误");
        responseMap.put("21","您只能发送联通的手机号码，本次发送的手机号码中包含了非联通的手机号码");
    }
    
    public UnicomService(){
        
    }
    /**
     * 作为测试用的方法
     * @param username
     * @param password
     * @throws Exception
     */
    public UnicomService(String username,String password) throws Exception{
        this.username=username;
        this.password=password;
        afterPropertiesSet();
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setEid(String eid) {
        this.eid = eid;
    }
    public void afterPropertiesSet() throws Exception {
        if (empty(eid)) {
            throw new IllegalArgumentException("enterprise id could not be null");
        }else if (empty(username)) {
            throw new IllegalArgumentException("username could not be null");
        } else if (empty(password)) {
            throw new IllegalArgumentException("password could not be null");
        }
        Sms_Service service=new Sms_Service();
        smsHttpPort = service.getSmsHttpPort();
    }

    public Result send(String mobile, String content) throws RuntimeException {
        try{
            if(mobile.length()!=11){
                throw new IllegalArgumentException("Illegal argument 'mobile'");
            }
            boolean success=false;
            String response=smsHttpPort.sms(eid,username,password,content,mobile,null,null,"1",null,null,null);
            String res = responseMap.get(response);
            if("0".equals(res)){
                success=true;
            }
            String description=responseMap.get(res);
            if(description==null){
                description="短信服务无法正常使用";
            }
            return new Result(mobile, success, description);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean empty(String s) {
        if (s == null || "".equals(s)) {
            return true;
        }
        return false;
    }
}
