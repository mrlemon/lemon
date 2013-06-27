package cn.coolinc.dao;

import java.util.List;

import cn.coolinc.support.dao.MyBatisRepository;
import cn.coolinc.support.dao.MybatisDao;
import cn.coolinc.support.web.easyui.Menu;

@MyBatisRepository
public interface MenuDao extends MybatisDao<Menu>{
    
    List<Menu> findAllByStaffId(int staffId);
}
