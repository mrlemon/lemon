package cn.coolinc.sms;

import cn.coolinc.sms.Result;
import cn.coolinc.sms.SmsService;
import cn.coolinc.sms.support.nuo.NuoSmsService;

public class NuoTest {
    public static void main(String[] args) {
        String username="ruanzhu02";
        String password="ee55e764e3f4427d066a2cee893aea62";
        String mobile="15985994163";
        String content="您好！";
        try{
            SmsService smsService=new NuoSmsService(username,password);
            Result result = smsService.send(mobile, content);
            System.out.println(result.toString());
        }catch(Exception e ){
            e.printStackTrace();
        }
    }

}
