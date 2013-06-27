//package cn.coolinc.utils.json;
//
//import junit.framework.Assert;
//
//import org.codehaus.jackson.map.ObjectMapper;
//import org.junit.Test;
//
//import cn.coolinc.entity.User;
//import cn.coolinc.test.support.AbstractTestCase;
//
//public class JsonTest extends AbstractTestCase{
//    ObjectMapper objectMapper=new ObjectMapper();
//    
//    @Test
//    public void testJson() throws Exception{
//        User user=new User();
//        user.setId("1");
//        user.setName("Li Lei");
//        String us=objectMapper.writeValueAsString(user);
//        User user_read = objectMapper.readValue(us, User.class);
//        Assert.assertEquals("1",user_read.getId());
//    }
//}
