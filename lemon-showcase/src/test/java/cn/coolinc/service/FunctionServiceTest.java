package cn.coolinc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;

import cn.coolinc.entity.Function;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.test.AbstractTransactionalTestCase;

@DirtiesContext
public class FunctionServiceTest extends AbstractTransactionalTestCase{
    @Autowired  
    FunctionService functionService;
    
    @Test
    public void findAll(){
        Map<String, Object> params = new HashMap<String, Object>();
        Page page=new Page(1,10);
        params.put("name", "新增");
        List<Function> result = functionService.findAll(params, page);
        Assert.assertTrue(result.size()>0);
    }
}
