package cn.coolinc.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;

import cn.coolinc.entity.Staff;
import cn.coolinc.support.test.AbstractTransactionalTestCase;
@DirtiesContext
public class StaffServiceTest extends AbstractTransactionalTestCase{
    @Autowired  
    StaffService staffService;
    
    @Test
    public void saveTest(){
        Staff staff=new Staff();
        staff.setName("test");
        staff.setLoginName("coolinc");
        staffService.save(staff);
    }
}
