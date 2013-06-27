package cn.coolinc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.RoleDao;
import cn.coolinc.dao.RoleResDao;
import cn.coolinc.entity.Role;
import cn.coolinc.support.dao.Page;

@Service
public class RoleService {
    @Autowired
    RoleDao roleDao;
    
    @Autowired
    RoleResDao roleResDao;
    
    public void save(Role role){
        roleDao.save(role);  
    }
    
    public void delete(int id){
        roleDao.delete(id);
        //sync delete from role_res
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleId",id);
        roleResDao.deleteByClause(params);
    }
    
    public void update(Role role){
        roleDao.update(role); 
    }
    
    public Role findOne(String id){
        return roleDao.findOne(id);   
    }
    
    public List<Role> findAll(){
        return roleDao.findAll(null);
    }
    
    public List<Role> findAll(Map<String, Object> params){
        return roleDao.findAll(params);
    }
    public List<Role> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return roleDao.findAll(params);
    }
}
