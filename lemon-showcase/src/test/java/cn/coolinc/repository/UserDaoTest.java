//package cn.coolinc.repository;
//
//import static org.junit.Assert.assertEquals;
//
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import cn.coolinc.dao.UserDao;
//import cn.coolinc.entity.User;
//import cn.coolinc.test.support.AbstractTransactionalTestCase;
//
//public class UserDaoTest extends AbstractTransactionalTestCase{
//    
//    @Autowired
//    private UserDao userDao;
//    
//    @Test
//    public void findOneTest() {
//        User user=userDao.findOne("1");
//        assertEquals("xiao lin",user.getLoginName());
//    }
//    
//    @Test
//    public void saveTest() {
//        User user=new User();
//        user.setName("testuser");
//        user.setPassword("123456");
//        user.setId("000002");
//        userDao.save(user);
//        
//        User tempUser=userDao.findOne("000002");
//        assertEquals("testuser",tempUser.getName());
//        
//    }
//
//}
