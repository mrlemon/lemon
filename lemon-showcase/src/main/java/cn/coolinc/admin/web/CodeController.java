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

import cn.coolinc.entity.Code;
import cn.coolinc.service.CodeService;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.ControllerUtils;
import cn.coolinc.support.web.easyui.DataGrid;
import cn.coolinc.support.web.easyui.Messager;
@Controller
public class CodeController {
    @Autowired
    CodeService codeService;
    
    @ResponseBody
    @RequestMapping("/admin/code")
    public Object init(HttpServletRequest request,HttpServletResponse response){
        Map<String, Object> params = new HashMap<String, Object>();
        String name=ControllerUtils.getString(request, "name");
        String type=ControllerUtils.getString(request, "type");
        int index=ControllerUtils.getInt(request, "page",1);
        Page page=new Page(index,Page.DAFAULT_SIZE);
        params.put("name", name);
        params.put("type", type);
        List<Code> codeList=codeService.findAll(params,page);
        DataGrid<Code> datagrid=new DataGrid<Code>(codeList,page.getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/code/all")
    public Object all(HttpServletRequest request,HttpServletResponse response){
        List<Code> codeList=codeService.findAll();
        DataGrid<Code> datagrid=new DataGrid<Code>(codeList,new Page(1,100).getTotal());
        return datagrid;
    }
    
    @ResponseBody
    @RequestMapping("/admin/code/delete")
    public Object delete(HttpServletRequest request, HttpServletResponse response){
            String id=request.getParameter("id");
            codeService.delete(Integer.valueOf(id));
            return Messager.SUCCESS;
    }

    @ResponseBody
    @RequestMapping("/admin/code/save")
    public Object save(Code code){
        if(null==code.getId()){
            codeService.save(code);
            return Messager.SUCCESS;
        }else{
            codeService.update(code);
            return Messager.SUCCESS;
        }
    }

}
