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

import cn.coolinc.entity.CodeType;
import cn.coolinc.service.CodeTypeService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class CodeTypeController {
    @Autowired
    CodeTypeService codeTypeService;
    
    @ResponseBody
    @RequestMapping("/admin/code-type")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        String code=ControllerUtils.getString(request, "code");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("code", code);
        params.put("name", name);
        List<CodeType> codeTypeList=codeTypeService.findAll(params,page);
        DataGrid<CodeType> datagrid=new DataGrid<CodeType>(codeTypeList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/code-type/all")
    public Object all(HttpServletRequest request,HttpServletResponse response){
        List<CodeType> codeTypeList=codeTypeService.findAll();
        DataGrid<CodeType> datagrid=new DataGrid<CodeType>(codeTypeList,new Page(1,100).getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/code-type/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            codeTypeService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/code-type/save")
    public Object save(CodeType codeType){
        if(null==codeType.getId()){
            codeTypeService.save(codeType);
            return Messager.SUCCESS;
        }else{
            codeTypeService.update(codeType);
            return Messager.SUCCESS;
        }
    }

}
