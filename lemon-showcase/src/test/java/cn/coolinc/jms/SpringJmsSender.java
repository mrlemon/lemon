package cn.coolinc.jms;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.support.test.AbstractTestCase;

@ContextConfiguration(locations={"classpath*:jms/applicationContext-jms.xml"})
public class SpringJmsSender extends AbstractTestCase{
    @Autowired
    JmsTemplate jmsTemplate;
    
    @Autowired
    private Destination notifyQueue;
    
    @Autowired
    private Destination notifyTopic;
    
    @Test
    public void sendMessageByQueue() throws InterruptedException{
        jmsTemplate.send(notifyQueue,new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                MapMessage message = session.createMapMessage();  
                message.setString("activemq", "QUEUE:Hello ActiveMQ");  
                return message;  
            }
        });
    }
    @Test
    public void sendMessageByTopic() throws InterruptedException{
        jmsTemplate.send(notifyTopic,new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                MapMessage message = session.createMapMessage();  
                message.setString("activemq", "TOPIC:Hello ActiveMQ");  
                return message;  
            }
        });
    }
}
