package cn.coolinc.support.test;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;

import com.icegreen.greenmail.util.GreenMail;
import com.icegreen.greenmail.util.ServerSetupTest;
/**
 * 测试邮件，邮件服务器模拟
 * @author coolinc
 */
public class MailServerSimulator implements InitializingBean, DisposableBean, FactoryBean<GreenMail> {

	public static final String DEFAULT_MAIL = "greenmail@localhost.com";
	public static final String DEFAULT_PASSWORD = "greenmail";

	private GreenMail greenMail;

	private String mail = DEFAULT_MAIL;

	private String password = DEFAULT_PASSWORD;

	public void afterPropertiesSet() throws Exception {
		greenMail = new GreenMail(ServerSetupTest.SMTP);
		greenMail.setUser(mail, password);
		greenMail.start();
	}

	public void destroy() throws Exception {
		if (greenMail != null) {
			greenMail.stop();
		}

	}

	public GreenMail getObject() throws Exception {
		return greenMail;
	}

	public Class<?> getObjectType() {
		return GreenMail.class;
	}

	public boolean isSingleton() {
		return true;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
