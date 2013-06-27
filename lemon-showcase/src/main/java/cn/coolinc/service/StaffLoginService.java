package cn.coolinc.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.StaffLoginDao;
import cn.coolinc.entity.StaffLogin;
import cn.coolinc.support.dao.Page;
@Service
public class StaffLoginService {
    @Autowired
    StaffLoginDao staffLoginDao;
    
    public void save(StaffLogin staffLogin){
        staffLoginDao.save(staffLogin);  
    }
    
    public void update(StaffLogin staffLogin){
        staffLoginDao.update(staffLogin); 
    }
    
    public StaffLogin findOne(String id){
        return staffLoginDao.findOne(id);   
    }
    
    public List<StaffLogin> findAll(Map<String, Object> params,Page page){
        if(params!=null){
            params.put("page",page);
            return staffLoginDao.findAll(params);
        }
        return Collections.emptyList();
    }
}
