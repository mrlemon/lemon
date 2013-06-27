package cn.coolinc.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.entity.Staff;
import cn.coolinc.service.StaffService;
import cn.coolinc.support.security.SecuritySupport;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class ProfileController {
    
    @Autowired
    StaffService staffService;
    
    @ResponseBody
    @RequestMapping("/admin/profile/password")
    public Object password(HttpServletRequest request,HttpServletResponse response){
        String staffId=SecuritySupport.getCurrentUserId();
        Staff staff = staffService.findOne(staffId);
        String password_cur=staff.getPassword();
        String password_old=ControllerUtils.getString(request,"password_old");
        String password_old_ec=SecuritySupport.MD5(password_old);
        if(!password_cur.equals(password_old_ec)){
            return new Messager(false,"旧密码输入错误!");
        }
        String password_new=ControllerUtils.getString(request,"password_new");
        String password_new_ec=SecuritySupport.MD5(password_new);
        staffService.changePassword(staffId,password_new_ec);
        return Messager.SUCCESS;
    }
}
