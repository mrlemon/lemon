package cn.coolinc.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.coolinc.entity.Staff;
import cn.coolinc.service.MenuService;
import cn.coolinc.service.RoleResService;
import cn.coolinc.service.StaffService;
import cn.coolinc.support.security.SecuritySupport;
import cn.coolinc.support.web.easyui.EasyUISupport;
import cn.coolinc.support.web.easyui.Menu;
@Controller
public class IndexController{

    @Autowired
    MenuService menuService;
    
    @Autowired
    StaffService staffService;
    
    @Autowired
    RoleResService roleResService;

    @RequestMapping("/admin/index")
    public ModelAndView init(HttpServletRequest request, HttpServletResponse response) {
        String contentPath=request.getContextPath();
        String staffId=SecuritySupport.getCurrentUserId();
        Staff staff=staffService.findOne(staffId);
        List<Menu> srcList=menuService.findAll();
        List<Menu> menuList=menuService.findAllByStaffId(Integer.valueOf(staffId));
        String menu=EasyUISupport.getEasyUIMenu(srcList,menuList,contentPath);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("menu",menu);
        model.put("staff",staff);
        return new ModelAndView("/admin/index",model);
    }
}
