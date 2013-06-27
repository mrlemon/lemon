package cn.coolinc.dao;

import java.util.Map;

import cn.coolinc.entity.Staff;
import cn.coolinc.support.dao.MyBatisRepository;
import cn.coolinc.support.dao.MybatisDao;

@MyBatisRepository
public interface StaffDao extends MybatisDao<Staff>{
    /**
     *  修改密码
     * @param id 员工Id
     * @param password 新密码
     */
    void changePassword(Map<String,Object> params);
    
    /**
     *  修改密码
     * @param id 员工Id
     * @param password 新密码
     */
    void changeEanbled(Map<String,Object> params);
    
    Staff findOneByLoginName(String loginName);
}
