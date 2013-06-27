package cn.coolinc.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.entity.Role;
import cn.coolinc.service.RoleService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class RoleController {
    @Autowired
    RoleService roleService;
    
    @ResponseBody
    @RequestMapping("/admin/role")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("name", name);
        List<Role> roleList=roleService.findAll(params,page);
        DataGrid<Role> datagrid=new DataGrid<Role>(roleList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/role/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            roleService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/role/save")
    public Object save(Role role){
        if(null==role.getId()){
            roleService.save(role);
            return Messager.SUCCESS;
        }else{
            roleService.update(role);
            return Messager.SUCCESS;
        }
    }
}
