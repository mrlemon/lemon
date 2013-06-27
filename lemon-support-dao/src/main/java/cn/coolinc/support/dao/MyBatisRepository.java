package cn.coolinc.support.dao;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 标识MyBatis的DAO,方便{@link org.mybatis.spring.mapper.MapperScannerConfigurer}的扫描。
 * <p>使用方法：</p>
 * <code>@MyBatisRepository<br>
 * public interface MyDao extends MybatisDao&lt;MyEntity&gt;{// to do something}
 * </code>
 * @see cn.coolinc.support.dao.MybatisDao
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface MyBatisRepository {
}
