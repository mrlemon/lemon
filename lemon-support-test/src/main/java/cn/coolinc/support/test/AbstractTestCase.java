package cn.coolinc.support.test;

import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;


/**
 * Spring上下文测试基类
 * @author coolinc
 */
@ActiveProfiles("test")
@ContextConfiguration(locations ={"classpath:applicationContext.xml"}) 
public abstract class AbstractTestCase extends AbstractJUnit4SpringContextTests{

}
