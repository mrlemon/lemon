package cn.coolinc.support.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
/**
 * 数据操作基础接口 
 * <p>For example：</p>
 * <code>public interface MyDao extends MybatisDao&lt;MyEntity&gt;{// to do something}</code>
 * @author coolinc
 * @param <T>
 * @see cn.coolinc.support.dao.MyBatisRepository
 */
public interface MybatisDao<T>{
    
    /**
     * 保存
     * @param t
     */
    public void save(T t);
    
    /**
     * 批量保存
     * @param ts
     */
    public void save(List<T> ts);

    /**
     * 根据ID删除
     * @param id
     */
    public void delete(Serializable id);
    
    /**
     * 根据条件删除
     * @param params
     */
    public void deleteByClause(Map<String,Object> params);
    
    /**
     * 删除指定对象
     * @param t
     */
    public void delete(T t);
    
    /**
     * 批量删除
     * @param ts
     */
    public void delete(List<T> ts) ;
    
    /**
     * 删除全部（慎用）
     */
    public void deleteAll();
    
    /**
     * 更新
     * @param t
     */
    public void update(T t);

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    public T findOne(Serializable id);
    
    /**
     * 查询全部
     * @return
     */
    public List<T> findAll();
    
    /**
     * 根据条件查询/根据条件分页查询
     * 分页时，params需包含<code>Page</code>类型对象
     * @param params
     * @return
     */
    public List<T> findAll(Map<String, Object> params);
    
    /**
     * 计算总数
     * @return
     */
    public long countAll();
    
    /**
     * 根据条件计算总数
     * @param params
     * @return
     */
    public long countAll(Map<String, Object> params);
    
}
