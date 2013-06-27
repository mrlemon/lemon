package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.FunctionDao;
import cn.coolinc.entity.Function;
import cn.coolinc.support.dao.Page;

@Service
public class FunctionService {
    @Autowired
    FunctionDao functionDao;
    
    public void save(Function function){
        functionDao.save(function);  
    }
    
    public void delete(int id){
        functionDao.delete(id);
    }
    
    public void update(Function function){
        functionDao.update(function); 
    }
    
    public Function findOne(String id){
        return functionDao.findOne(id);   
    }
    
    public List<Function> findAll(){
        return functionDao.findAll(null);
    }
    
    public List<Function> findAll(Map<String, Object> params){
        return functionDao.findAll(params);
    }
    public List<Function> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return functionDao.findAll(params);
    }
}
