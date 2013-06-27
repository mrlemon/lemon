package cn.coolinc.jms;

import javax.jms.Destination;
import javax.jms.JMSException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.support.test.AbstractTestCase;

@ContextConfiguration(locations={"classpath*:jms/applicationContext-jms.xml"})
public class SpringJmsReceive extends AbstractTestCase{
    @Autowired
    JmsTemplate jmsTemplate;
    
    @Autowired
    private Destination notifyQueue;
    
    @Test
    public void recieveMessage() throws JMSException{
//        MapMessage mapMessage=(MapMessage)jmsTemplate.receive(notifyQueue);
//        String msg=mapMessage.getString("activemq");
//        System.out.println("receive message:"+msg);
    }
    
    
}
