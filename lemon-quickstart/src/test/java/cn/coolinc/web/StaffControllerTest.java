package cn.coolinc.web;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import cn.coolinc.admin.web.StaffController;
import cn.coolinc.support.test.AbstractControllerTestCase;
public class StaffControllerTest extends AbstractControllerTestCase{
    @Autowired
    StaffController staffController;
    
    @Test
    public void testSave() throws Exception{
        request =new MockHttpServletRequest("POST", "/admin/staff/save");
        response=new MockHttpServletResponse();
        request.setParameter("name","mock");
        request.setParameter("loginName", "login name");
        ModelAndView mv=annotationHandlerAdapter.handle(request, response, staffController);
    }
}
