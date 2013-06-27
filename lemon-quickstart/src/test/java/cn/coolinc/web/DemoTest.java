package cn.coolinc.web;

import cn.coolinc.security.SecuritySupport;

public class DemoTest {
    
    public static void main(String[] args) {
        String password="";
        String salt="";
        password= SecuritySupport.MD5(password);
        password= SecuritySupport.MD5(password,salt);
        System.out.println(password);
    }

}
