package cn.coolinc.utils.log;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;

public class CustomAppenderTest {
    
    @Test
    public void appenderTest(){
        Logger log=LogManager.getLogger(this.getClass());
        log.info("hello world!");
    }
    

}
