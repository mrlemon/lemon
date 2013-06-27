package cn.coolinc.sms.support.nuo;
import java.io.StringReader;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.springframework.beans.factory.InitializingBean;
import org.tempuri.Service;
import org.tempuri.ServiceSoap;

import cn.coolinc.sms.Result;
import cn.coolinc.sms.SmsService;
public class NuoSmsService implements SmsService, InitializingBean {
    private String username;
    private String password;
    private ServiceSoap smsService;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    

    /**
     * 
     */
    public NuoSmsService() {
        super();
    }

    /**
     * @param username
     * @param password
     * @param smsService
     * @throws Exception 
     */
    public NuoSmsService(String username, String password) throws Exception {
        super();
        this.username = username;
        this.password = password;
        afterPropertiesSet();
    }

    public void afterPropertiesSet() throws Exception {
        if (empty(username)) {
            throw new IllegalArgumentException("username could not be null");
        } else if (empty(password)) {
            throw new IllegalArgumentException("password could not be null");
        }
        Service service = new Service();
        smsService = service.getServiceSoap12();
    }

    public Result send(String mobile, String content) throws RuntimeException {
        try{
            if(mobile.length()!=11){
                throw new IllegalArgumentException("Illegal argument 'mobile'");
            }
            String xml = smsService.sendNote(username, password, mobile, content);
            List<Response> responseList = parseResult(xml);
            return responseList.get(0).toResult();
        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

    private boolean empty(String s) {
        if (s == null || "".equals(s)) {
            return true;
        }
        return false;
    }
    
    
    /**
     * 解析返回结果
     * @param xml
     * @return
     * @throws JAXBException
     */
    private static List<Response> parseResult(String xml) throws JAXBException{
        //        <ds>
        //        <dt>
        //                <FPhone>13333333333</FPhone>
        //                <FResult>发送成功</FResult>
        //                <FDescription />
        //        </dt>
        //        <dt>
        //                <FPhone>222222222</FPhone>
        //                <FResult>发送失败</FResult>
        //                <FDescription>号码为无效号码</FDescription>
        //        </dt>
        //       </ds>
        JAXBContext jc = JAXBContext.newInstance(ResponseList.class);  
        Unmarshaller unmar = jc.createUnmarshaller();  
        ResponseList list = (ResponseList) unmar.unmarshal(new StringReader(xml));  
        return list.getResponse();
    }
    
    public static void main(String[] args) throws JAXBException {
        String xml="<ds><dt><FPhone>13333333333</FPhone><FResult>发送成功</FResult></dt></ds>";
        List<Response> parseResult = parseResult(xml);
        System.out.println(parseResult.get(0).getPhone());
    }
}
