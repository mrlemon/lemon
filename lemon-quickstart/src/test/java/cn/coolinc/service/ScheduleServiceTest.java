package cn.coolinc.service;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.support.test.AbstractTestCase;

@ContextConfiguration("classpath*:/schedule/applicationContext-quartz.xml")
public class ScheduleServiceTest extends AbstractTestCase{
    
    @Test
    public void doJobTest() throws InterruptedException{
//        Thread.sleep(20000);
    }

}
