package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.DepartmentDao;
import cn.coolinc.entity.Department;
import cn.coolinc.support.dao.Page;

@Service
public class DepartmentService {
    @Autowired
    DepartmentDao departmentDao;
    
    public void save(Department department){
        departmentDao.save(department);  
    }
    
    public void delete(int id){
        departmentDao.delete(id);
    }
    
    public void update(Department department){
        departmentDao.update(department); 
    }
    
    public Department findOne(String id){
        return departmentDao.findOne(id);   
    }
    
    public List<Department> findAll(){
        return departmentDao.findAll(null);
    }
    
    public List<Department> findAll(Map<String, Object> params){
        return departmentDao.findAll(params);
    }
    public List<Department> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return departmentDao.findAll(params);
    }
}
