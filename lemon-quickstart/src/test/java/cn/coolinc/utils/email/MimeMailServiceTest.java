package cn.coolinc.utils.email;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.service.email.MimeMailService;
import cn.coolinc.support.test.AbstractTestCase;

//@ContextConfiguration(locations={"classpath*:email/applicationContext-email.xml"})
public class MimeMailServiceTest  extends AbstractTestCase{
    
//    @Autowired
//    MimeMailService mimeMailService;

    @Test
    public void testSendNotificationMail() {
//        mimeMailService.sendNotificationMail("coolinc");
    }

}
