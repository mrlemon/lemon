package cn.coolinc.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ScheduleService {
    
    Log log=LogFactory.getLog(getClass());
    
    public void doJob(){
        log.debug("quartz scheduling.");
    }

}
