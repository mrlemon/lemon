package cn.coolinc.web;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import cn.coolinc.support.test.AbstractControllerTestCase;

public class FooControllerTest  extends AbstractControllerTestCase{
   
    @Autowired
    FooController fooController;
    
    @Test
    public void testSay() throws Exception{
        request=new MockHttpServletRequest();
        response=new MockHttpServletResponse();
        request.setRequestURI("/foo");
        annotationHandlerAdapter.handle(request, response, fooController);
    }
    
    
}
