package cn.coolinc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.StaffDao;
import cn.coolinc.entity.Staff;
import cn.coolinc.support.dao.Page;
@Service
public class StaffService {
    @Autowired
    private StaffDao staffDao;
    
    public void save(Staff staff){
        staffDao.save(staff);  
    }
    
    public void delete(int id){
        staffDao.delete(id);
    }
    
    public void update(Staff staff){
        staffDao.update(staff); 
    }
    
    public Staff findOne(String id){
        return staffDao.findOne(id);   
    }
    
    public List<Staff> findAll(){
        return staffDao.findAll(null);
    }
    
    public List<Staff> findAll(Map<String, Object> params){
        return staffDao.findAll(params);
    }
    public List<Staff> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return staffDao.findAll(params);
    }
    
    public void changePassword(String id,String password){
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        params.put("password", password);
        staffDao.changePassword(params);
    }
    
    public void changeEanbled(String id,Integer enabled){
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        params.put("enabled", enabled);
        staffDao.changeEanbled(params);
    }
    
    public Staff findOneByLoginName(String loginName){
        return staffDao.findOneByLoginName(loginName);
    }
}
