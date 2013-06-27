package cn.coolinc.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.entity.Staff;
import cn.coolinc.service.StaffService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.security.SecuritySupport;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class StaffController {
    @Autowired
    StaffService staffService;
    
    @ResponseBody
    @RequestMapping("/admin/staff")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("name", name);
        List<Staff> staffList=staffService.findAll(params,page);
        DataGrid<Staff> datagrid=new DataGrid<Staff>(staffList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/staff/{id}")
    public Object load(@PathVariable String id){
        if(StringUtils.isEmpty(id))
            return "";
        Staff staff=staffService.findOne(id);
        return staff;
    }
    
    @ResponseBody
    @RequestMapping("/admin/staff/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            staffService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/staff/save")
    public Object save(Staff staff){
        if(null==staff.getId()){
            staffService.save(staff);
            return Messager.SUCCESS;
        }else{
            staffService.update(staff);
            return Messager.SUCCESS;
        }
    }
    
    @ResponseBody
    @RequestMapping("/admin/staff/load")
    public Object load(HttpServletRequest request, HttpServletResponse response){
          String d=ControllerUtils.getString(request,"d");
          Map<String, Object> params = new HashMap<String, Object>();
          if(!StringUtils.isEmpty(d)){
              params.put("deptId", d);
          }
          List<Staff> staffList=new ArrayList<Staff>();
          List<Staff> staffList2=staffService.findAll(params);
          Staff first=new Staff();
          first.setName("-- 请选择 --");
          staffList.add(first);
          if(staffList2!=null){
              staffList.addAll(staffList2);
          }
          return staffList;
      }
      
      
    @ResponseBody
    @RequestMapping("/admin/staff/suggest")
      public Object suggest(HttpServletRequest request, HttpServletResponse response){
          //pagination
          int pageSize=ControllerUtils.getInt(request, "limit",Page.DAFAULT_SIZE);
          int pageIndex=ControllerUtils.getInt(request, "page",1);
          Page page=new Page(pageIndex,pageSize);
          
          //conditions
          Map<String,Object> params=new HashMap<String, Object>();
          String name=ControllerUtils.getStringDecode(request,"q");
          params.put("name",name);
          List<Staff> voList =staffService.findAll(params, page);
          
          //render view
          return voList;
      }
      
    @ResponseBody
    @RequestMapping("/admin/staff/password")
      public Object password(HttpServletRequest request, HttpServletResponse response){
          String id=ControllerUtils.getString(request,"id");
          String password=ControllerUtils.getString(request,"password_new");
          String password_new_ec=SecuritySupport.MD5(password);
          staffService.changePassword(id,password_new_ec);
          return Messager.SUCCESS;
      }
    @ResponseBody
    @RequestMapping("/admin/staff/enabled/{id}/{enabled}")
    public Object enabled(HttpServletRequest request, HttpServletResponse response,@PathVariable String id,@PathVariable Integer enabled){
        staffService.changeEanbled(id,enabled);
        return Messager.SUCCESS;
    }
}
