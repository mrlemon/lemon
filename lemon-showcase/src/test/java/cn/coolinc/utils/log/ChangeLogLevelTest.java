package cn.coolinc.utils.log;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;

public class ChangeLogLevelTest{
    Log log=LogFactory.getLog(getClass());
    
    @Test
    public void change(){
        Logger logger=LogManager.getLogger("cn.coolinc");
        logger.setLevel(Level.DEBUG);
        log.debug("log DEBUG 1.");
        log.info("log INFO 1.");
        
        logger=LogManager.getLogger("cn.coolinc");
        logger.setLevel(Level.INFO);
        log.debug("log DEBUG 2.");
        log.info("log INFO 2.");
    }

}
