package cn.coolinc.memcached;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.Date;

import net.spy.memcached.MemcachedClient;

public class MemCachedTest {
    
    public static void main(String[] args) throws IOException {
        MemcachedClient client = new MemcachedClient(new InetSocketAddress("127.0.0.1",11211));  
        long time=new Date().getTime();
//        for (int i = 1; i < 1000000; i++) {  
//            client.set("T0001" + i, 3600, new User(i + ""));   
//        }  
        client.set("T00011" , 3600, new User("1"));   
//        User myObject = (User) cache.get("T00019");  
//        OperationFuture<Boolean> delete = cache.delete("T00019");
//        System.out.println("Get object from mem :" +    myObject.toString());
        System.out.println(new Date().getTime()-time);   
    }

}
