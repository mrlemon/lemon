package cn.coolinc.admin.web;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.entity.StaffLogin;
import cn.coolinc.service.StaffLoginService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
@Controller
public class StaffLoginController {
    @Autowired
    StaffLoginService staffLoginService;
    
    @ResponseBody
    @RequestMapping("/admin/staff-login")
    public Object init(HttpServletRequest request,HttpServletResponse response) throws ParseException{
        Map<String, Object> params = new HashMap<String, Object>();
        String staffId=ControllerUtils.getString(request, "staffId");
        String loginDateFrom=ControllerUtils.getString(request, "loginDateFrom");
        String loginDateTo=ControllerUtils.getString(request, "loginDateTo");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("staffId",staffId);
        params.put("loginDateFrom",loginDateFrom);
        params.put("loginDateTo",loginDateTo);
        List<StaffLogin> staffList=staffLoginService.findAll(params,page);
        DataGrid<StaffLogin> datagrid=new DataGrid<StaffLogin>(staffList,page.getTotal());
        return datagrid;
    }

}
