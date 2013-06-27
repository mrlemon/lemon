package cn.coolinc.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.entity.Department;
import cn.coolinc.service.DepartmentService;
import cn.coolinc.support.web.easyui.Messager;
import cn.coolinc.support.web.easyui.EasyUISupport;
import cn.coolinc.support.web.easyui.TreeNode;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    
    @ResponseBody
    @RequestMapping("/admin/department")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        List<Department> departmentList=departmentService.findAll();
        List<TreeNode> tree=EasyUISupport.getEasyUITree(departmentList); 
        return tree;
    }
    
    @ResponseBody
    @RequestMapping("/admin/department/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            departmentService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/department/save")
    public Object save(Department department){
        if(null==department.getId()){
            departmentService.save(department);
            return Messager.SUCCESS;
        }else{
            departmentService.update(department);
            return Messager.SUCCESS;
        }
    }

}
