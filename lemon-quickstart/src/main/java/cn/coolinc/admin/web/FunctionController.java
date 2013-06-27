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

import cn.coolinc.entity.Function;
import cn.coolinc.service.FunctionService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class FunctionController {
    @Autowired
    FunctionService functionService;
    
    @ResponseBody
    @RequestMapping("/admin/function")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("name", name);
        List<Function> functionList=functionService.findAll(params,page);
        DataGrid<Function> datagrid=new DataGrid<Function>(functionList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/function/all")
    public Object all(HttpServletRequest request,HttpServletResponse response){
        List<Function> functionList=functionService.findAll();
        DataGrid<Function> datagrid=new DataGrid<Function>(functionList,new Page(1,100).getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/function/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            functionService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/function/save")
    public Object save(Function function){
        if(null==function.getId()){
            functionService.save(function);
            return Messager.SUCCESS;
        }else{
            functionService.update(function);
            return Messager.SUCCESS;
        }
    }

}
