package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.RoleResDao;
import cn.coolinc.entity.RoleRes;
import cn.coolinc.support.dao.Page;

@Service
public class RoleResService {
    @Autowired
    RoleResDao roleResDao;
    
    public void save(RoleRes roleRes){
        roleResDao.save(roleRes);  
    }
    
    public void saveBatch(List<RoleRes> roleReses){
        for(RoleRes r:roleReses){
            save(r);
        }
    }
    
    public void delete(int id){
        roleResDao.delete(id);
    }
    
    public void deleteByClause(Map<String, Object> params){
        roleResDao.deleteByClause(params);
    }
    
    public void update(RoleRes roleRes){
        roleResDao.update(roleRes); 
    }
    
    public RoleRes findOne(String id){
        return roleResDao.findOne(id);   
    }
    
    public List<RoleRes> findAll(){
        return roleResDao.findAll(null);
    }
    
    public List<RoleRes> findAll(Map<String, Object> params){
        return roleResDao.findAll(params);
    }
    public List<RoleRes> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return roleResDao.findAll(params);
    }
    
    
}
