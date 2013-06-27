package cn.coolinc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.MenuDao;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.web.easyui.Menu;

@Service
public class MenuService {
    @Autowired
    MenuDao menuDao;
    
    public void save(Menu menu){
        menuDao.save(menu);  
    }
    
    public void delete(int id){
        menuDao.delete(id);
    }
    
    public void update(Menu menu){
        menuDao.update(menu); 
    }
    
    public Menu findOne(String id){
        return menuDao.findOne(id);   
    }
    
    public List<Menu> findAll(){
        return menuDao.findAll(null);
    }
    
    public List<Menu> findAll(Map<String, Object> params){
        return menuDao.findAll(params);
    }
    public List<Menu> findAll(Map<String, Object> params,Page page){
        params.put("page",page);
        return menuDao.findAll(params);
    }
    
    public List<Menu>  findAllByStaffId(int staffId){
        return menuDao.findAllByStaffId(staffId);
    }
}
