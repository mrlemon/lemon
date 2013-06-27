package cn.coolinc.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController{
    
    @RequestMapping(value="/admin/login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        return "admin/login";
    }
    
    @RequestMapping(value="/admin/login/error/{code}")
    public String error(HttpServletRequest request, HttpServletResponse response,@PathVariable("code") String code) {
        final int USERNAME_NOT_FOUND=1;
        final int BADCREDENTIALS=2;
        final int AUTHENTICATION=3;
        final int CREDENTIALSEXPIRED=4;
        final int LOCKED=5;
        final int DISABLED=6;
        final int SESSION_EXCEEDED=7;
        int c=0;
        String text="";
        try{
            c=Integer.parseInt(code);
            switch(c){
            case USERNAME_NOT_FOUND:
                text="用户名不存在，请检查后重新登陆！";
                break;
            case BADCREDENTIALS:
                text="密码错误，请注意区分大小写！";
                break;
            case CREDENTIALSEXPIRED:
                text="登录超时，请重新登陆！";
                break;
            case AUTHENTICATION:
                text="授权错误，请重尝试重新登陆！";
                break;
            case LOCKED:
                text="您的账号被锁定，若有疑问请咨询管理员!";
                break;
            case DISABLED:
                text="您的账号未启用，若有疑问请咨询管理员!";
                break;
            case SESSION_EXCEEDED:
                text="您的账号已在别处登陆，为了您账号的安全，建议您修改密码！";
                break;
            default:
                text="未知错误";
            }
        }catch(Exception e){
            text="未知错误";
        }
        request.setAttribute("text", text);
        return "admin/error";
    }
}
