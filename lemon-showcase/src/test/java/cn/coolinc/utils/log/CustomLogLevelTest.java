package cn.coolinc.utils.log;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;

import cn.coolinc.util.log.CustomLogLevel;

public class CustomLogLevelTest{
    static Logger log = Logger.getLogger(CustomLogLevelTest.class);  
    
    @Test
    public void change(){
        Logger logger=LogManager.getLogger("cn.coolinc");
        logger.setLevel(CustomLogLevel.SALES);
        log.log(CustomLogLevel.SALES, "test custome log level sales.");
    }

}
