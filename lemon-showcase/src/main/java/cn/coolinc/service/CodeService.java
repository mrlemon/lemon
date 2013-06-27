package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.CodeDao;
import cn.coolinc.entity.Code;
import cn.coolinc.support.dao.Page;

@Service
public class CodeService {
    @Autowired
    CodeDao codeDao;
    
    public void save(Code code){
        codeDao.save(code);  
    }
    
    public void delete(int id){
        codeDao.delete(id);
    }
    
    public void update(Code code){
        codeDao.update(code); 
    }
    
    public Code findOne(String id){
        return codeDao.findOne(id);   
    }
    
    public List<Code> findAll(){
        return codeDao.findAll(null);
    }
    
    public List<Code> findAll(Map<String, Object> params){
        return codeDao.findAll(params);
    }
    public List<Code> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return codeDao.findAll(params);
    }
}
