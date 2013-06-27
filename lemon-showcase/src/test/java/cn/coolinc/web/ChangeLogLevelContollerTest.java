package cn.coolinc.web;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import cn.coolinc.support.test.AbstractControllerTestCase;

public class ChangeLogLevelContollerTest extends AbstractControllerTestCase{
    Logger log=Logger.getLogger(getClass());
    @Autowired
    ChangeLogLevelContoller changeLogLevelContoller;
    
    @Test
    public void changeLogLevel() throws Exception{
        this.request=new MockHttpServletRequest();
        this.response=new MockHttpServletResponse();
        log.debug("the message is not display.");
        request.setRequestURI("/admin/log/cn.coolinc/DEBUG");
        annotationHandlerAdapter.handle(request, response, changeLogLevelContoller);
        log.debug("the message is display.");
    }
}
