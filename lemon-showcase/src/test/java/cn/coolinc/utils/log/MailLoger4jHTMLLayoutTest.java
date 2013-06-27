package cn.coolinc.utils.log;

import org.apache.log4j.Logger;
import org.junit.Test;

public class MailLoger4jHTMLLayoutTest {
    Logger log=Logger.getLogger(getClass());
    
    @Test
    public void htmlLayoutTest(){
        log.error("test log4j mail appender.");
    }
}
