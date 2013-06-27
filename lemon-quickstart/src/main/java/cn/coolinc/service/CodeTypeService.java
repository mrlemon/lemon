package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.CodeTypeDao;
import cn.coolinc.entity.CodeType;
import cn.coolinc.support.dao.Page;

@Service
public class CodeTypeService {
    @Autowired
    CodeTypeDao codeTypeDao;
    
    public void save(CodeType codeType){
        codeTypeDao.save(codeType);  
    }
    
    public void delete(int id){
        codeTypeDao.delete(id);
    }
    
    public void update(CodeType codeType){
        codeTypeDao.update(codeType); 
    }
    
    public CodeType findOne(String id){
        return codeTypeDao.findOne(id);   
    }
    
    public List<CodeType> findAll(){
        return codeTypeDao.findAll(null);
    }
    
    public List<CodeType> findAll(Map<String, Object> params){
        return codeTypeDao.findAll(params);
    }
    public List<CodeType> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return codeTypeDao.findAll(params);
    }
}
