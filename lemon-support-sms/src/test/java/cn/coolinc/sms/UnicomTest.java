package cn.coolinc.sms;

import java.util.Date;

import cn.com.flaginfo.ws.SmsPortType;
import cn.com.flaginfo.ws.Sms_Service;

public class UnicomTest {
    
    public static void main(String[] args) {
        
        Sms_Service service=new Sms_Service();
        SmsPortType smsHttpPort = service.getSmsHttpPort();
        String conent="您在软筑工程信息网注册的手机验证码是：1234 请输入后进行验证，谢谢！[软筑]";
        String sms="";
        
//        out.println("[TEST]"+new Date().toString()+" 电信");
//        sms = smsHttpPort.sms("101587","xm_xx","xx8526",conent,"18065589190",null,null,"1",null,null,null);
//        out.print("result:"+sms);
        
        System.out.println("[TEST]"+new Date().toString()+" 移动");
        sms = smsHttpPort.sms("101587","xm_xx","xx8526",conent,"15985994163",null,null,"1",null,null,null);
        System.out.print("result:"+sms);
        
        //E:/eclipse/workspace/ruanzhu/ruanzhu-sms/src/main/resources/wsdl/sms-unicom.wsdl
        
//        out.println("[TEST]"+new Date().toString()+" 移动");
//        sms = smsHttpPort.sms("101587","xm_xx","xx8526",conent,"18659808867",null,null,"1",null,null,null);
//        out.print("result:"+sms);
    }

}
