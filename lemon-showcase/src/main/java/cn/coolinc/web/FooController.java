package cn.coolinc.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.coolinc.support.web.BaseController;
import cn.coolinc.support.web.easyui.Messager;
import cn.coolinc.support.web.exception.BusinessException;


@Controller
public class FooController extends BaseController{

    @ResponseBody
    @RequestMapping("/foo")
    public String foo(HttpServletRequest request, HttpServletResponse response) throws BusinessException{
        throw new BusinessException("E_0001");
    }
    
    @RequestMapping("/err")
    public Object err(HttpServletRequest request, HttpServletResponse response) throws IOException{
        throw new IOException("err invoke,but IOException");
    }
    
    @ResponseBody
    @RequestMapping(value="/bara",produces="application/json")
    public Object adminbar(HttpServletRequest request, HttpServletResponse response){
        return new Messager(true,"test json");
    }
    @ResponseBody
    @RequestMapping("/bar")
    public Object bar(HttpServletRequest request, HttpServletResponse response){
        return new String("test json");
    }
}
