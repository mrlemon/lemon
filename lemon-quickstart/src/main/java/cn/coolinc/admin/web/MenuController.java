package cn.coolinc.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.service.MenuService;
import cn.coolinc.support.web.easyui.Menu;
import cn.coolinc.support.web.easyui.Messager;
import cn.coolinc.support.web.easyui.EasyUISupport;
import cn.coolinc.support.web.easyui.TreeNode;

@Controller
public class MenuController {
    @Autowired
    MenuService menuService;
    
    @ResponseBody
    @RequestMapping("/admin/menu")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        List<Menu> menuList=menuService.findAll();
        List<TreeNode> tree=EasyUISupport.getEasyUITree(menuList); 
        return tree;
    }
    
    @ResponseBody
    @RequestMapping("/admin/menu/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            menuService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/menu/save")
    public Object save(Menu menu){
        if(null==menu.getId()){
            menuService.save(menu);
            return Messager.SUCCESS;
        }else{
            menuService.update(menu);
            return Messager.SUCCESS;
        }
    }

}
