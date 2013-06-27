package cn.coolinc.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RESTController {
    Log log=LogFactory.getLog(this.getClass());
    
    @RequestMapping(value = "/test/{name}")
    public String var(@PathVariable("name") String name,Model model){
        model.addAttribute("name",name);
        return "test";
    }
    
    @RequestMapping(value = "/test")
    @ResponseBody
    public String get(){
        return "REST GET";
    }
    
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    @ResponseBody
    public String post(){
        return "REST POST";
    }
    
    @RequestMapping(value = "/test", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(){
        return "REST DELETE";
    }
    
    @RequestMapping(value = "/out")
    @ResponseBody
    public String out(){
        return "response msg.";
    }
    
    @RequestMapping(value = "/security")
    @ResponseBody
    public String security(HttpServletRequest request){
        return "security";
    }
   
}
