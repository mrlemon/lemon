package cn.coolinc.utils.email;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.service.email.SimpleMailService;
import cn.coolinc.support.test.AbstractTestCase;

//@ContextConfiguration(locations={"classpath*:email/applicationContext-email.xml"})
public class SimpleMailServiceTest extends AbstractTestCase{
    
//    @Autowired
//    SimpleMailService simpleMailService;

    @Test
    public void testSendNotificationMail() {
        //simpleMailService.sendNotificationMail("hello mail");
    }

}
