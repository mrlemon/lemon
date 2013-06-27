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
import cn.coolinc.entity.RoleStaff;
import cn.coolinc.service.RoleService;
import cn.coolinc.service.RoleStaffService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
import cn.coolinc.support.web.easyui.EasyUISupport;
import cn.coolinc.support.web.easyui.TreeNode;
@Controller
public class RoleStaffController {
    @Autowired
    RoleService roleService;
    @Autowired
    RoleStaffService roleStaffService;
    
    @ResponseBody
    @RequestMapping("/admin/role-staff")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("name", name);
        List<RoleStaff> roleStaffList=roleStaffService.findAll(params,page);
        DataGrid<RoleStaff> datagrid=new DataGrid<RoleStaff>(roleStaffList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/role-staff/all")
    public Object all(HttpServletRequest request,HttpServletResponse response){
        List<RoleStaff> roleStaffList=roleStaffService.findAll();
        DataGrid<RoleStaff> datagrid=new DataGrid<RoleStaff>(roleStaffList,new Page(1,100).getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/role-staff/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            roleStaffService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/role-staff/save")
    public Object save(HttpServletRequest request, HttpServletResponse response){
        String staffId=request.getParameter("id");
        String[] roleIds=request.getParameterValues("roleId");
        
        //clear history authorization
        Map<String,Object> params=new HashMap<String, Object>();
        params.put("staffId",staffId);
        if(staffId==null)
            return null;
        roleStaffService.deleteByClause(params);
    
        //add new authorization
        if(roleIds!=null){
            for(String roleId:roleIds){
                if(Integer.parseInt(roleId)==TreeNode.TREE_ROOT){
                    continue;
                }else{
                    RoleStaff vo=new RoleStaff();
                    vo.setRoleId(Integer.parseInt(roleId));
                    vo.setStaffId(Integer.parseInt(staffId));
                    roleStaffService.save(vo);
                }
            }   
        }
        return Messager.SUCCESS;
    }
    
    @ResponseBody
    @RequestMapping("/admin/role-staff/load-role")
    public Object load_role(HttpServletRequest request, HttpServletResponse response){
            String staffId=request.getParameter("id");
            //query
            List<Role> voList =roleService.findAll();
            Map<String,Object> params=new HashMap<String, Object>();
            params.put("staffId",staffId);
            List<RoleStaff> roleStaffList=roleStaffService.findAll(params);
            for(RoleStaff v:roleStaffList){
                for(Role role:voList){
                    if(role.getId()==v.getRoleId()){
                        role.setChecked(true);
                    }
                }
            }
            return EasyUISupport.getEasyUITree(voList);
    }

}
