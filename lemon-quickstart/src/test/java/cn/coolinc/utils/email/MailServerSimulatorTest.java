package cn.coolinc.utils.email;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.support.test.AbstractTestCase;

import com.icegreen.greenmail.util.GreenMail;

@ActiveProfiles("test")
//@ContextConfiguration(locations={"classpath*:email/applicationContext-email.xml"})
public class MailServerSimulatorTest extends AbstractTestCase {

//	@Autowired
//	private GreenMail greenMail;

	@Test
	public void greenMail() {
//		assertEquals(3025, greenMail.getSmtp().getPort());
	}
}
