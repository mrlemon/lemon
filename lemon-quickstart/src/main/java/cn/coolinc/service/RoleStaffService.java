package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.RoleStaffDao;
import cn.coolinc.entity.RoleStaff;
import cn.coolinc.support.dao.Page;

@Service
public class RoleStaffService {
    @Autowired
    private RoleStaffDao roleStaffDao;
    
    public void save(RoleStaff roleStaff){
        roleStaffDao.save(roleStaff);  
    }
    
    public void delete(int id){
        roleStaffDao.delete(id);
    }
    
    public void deleteByClause(Map<String, Object> params){
        roleStaffDao.deleteByClause(params);
    }
    
    public void update(RoleStaff roleStaff){
        roleStaffDao.update(roleStaff); 
    }
    
    public RoleStaff findOne(String id){
        return roleStaffDao.findOne(id);   
    }
    
    public List<RoleStaff> findAll(){
        return roleStaffDao.findAll(null);
    }
    
    public List<RoleStaff> findAll(Map<String, Object> params){
        return roleStaffDao.findAll(params);
    }
    public List<RoleStaff> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return roleStaffDao.findAll(params);
    }
}
