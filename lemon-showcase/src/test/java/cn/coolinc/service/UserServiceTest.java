//package cn.coolinc.service;
//
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.annotation.DirtiesContext;
//import org.springframework.test.context.ContextConfiguration;
//
//import cn.coolinc.entity.User;
//import cn.coolinc.test.support.AbstractTransactionalTestCase;
//
//@DirtiesContext
//@ContextConfiguration(locations={"classpath*:applicationContext-compass.xml"})
//public class UserServiceTest extends AbstractTransactionalTestCase{
//    @Autowired  
//    UserService userService;  
////
////    @Test
////    public void findOneTest() throws Exception  {
////        User user=userService.findOne("1");
////        assertEquals("admin",user.getLoginName());
////    }
//    
//    @Test
//    public void findAllTest() throws Exception  {
//        User user=new User();
//        user.setId("10000");
//        user.setName("admin");
//        user.setLoginName("changhuang lin");
//        userService.save(user);
//        
////        String q="lin";
////        Page page=new Page(1, 10);
////        List<User> result=userService.findAll(q, page);
////        Assert.assertTrue(result.size()==0);
//    }
//}
