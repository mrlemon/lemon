package cn.coolinc.support.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.builder.xml.dynamic.ForEachSqlNode;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;


/**
 *  Mybatis的分页查询插件
 * 只有在参数列表中包括Page类型的参数时才进行分页查询。
 * 在多参数的情况下，只对第一个{@link cn.coolinc.support.dao.Page}类型的参数生效。
 * @author coolinc
 *
 */
@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args={Connection.class})}) 
public class PaginationInterceptor implements Interceptor {
    private String dialect;

    @SuppressWarnings("unchecked")
    public Object intercept(Invocation invocation) throws Throwable {
        if(!(invocation.getTarget() instanceof RoutingStatementHandler)) 
            return invocation.proceed();
        
        RoutingStatementHandler statementHandler = (RoutingStatementHandler)invocation.getTarget();
        BoundSql boundSql = statementHandler.getBoundSql();
        //分析是否含有分页参数，如果没有则不是分页查询
        //注意：在多参数的情况下，只处理第一个分页参数
        Page page = null;
        Object paramObj = boundSql.getParameterObject();
        if (paramObj instanceof Page){ //只有一个参数的情况
            page = (Page)paramObj;
        }
        else if (paramObj instanceof Map){ //多参数的情况，找到第一个Page的参数
            for (Map.Entry<String, Object> e : ((Map<String, Object>)paramObj).entrySet()){
                if (e.getValue() instanceof Page){
                    page = (Page)e.getValue();
                    break;
                }
            }
        }
        
        if (page == null) return invocation.proceed();
        
        //查找总记录数，并设置Page的相关参数
        int total = this.getTotal(invocation);
        page.setTotal(total);
        //生成分页SQL
        String pageSql = generatePageSql(boundSql.getSql(), page);
        //强制修改最终要执行的SQL
        setFieldValue(boundSql, "sql", pageSql);
        return invocation.proceed();
    }
    
    /**
     * 获取记录总数
     */
    @SuppressWarnings("unchecked")
    private int getTotal(Invocation invocation) throws Exception{
        RoutingStatementHandler statementHandler = (RoutingStatementHandler)invocation.getTarget();
        BoundSql boundSql = statementHandler.getBoundSql();
        /*
         * 为了设置查找总数SQL的参数，必须借助MappedStatement、Configuration等这些类，
         * 但statementHandler并没有开放相应的API，所以只好用反射来强行获取。
         */
        BaseStatementHandler delegate = (BaseStatementHandler)getFieldValue(statementHandler, "delegate");
        MappedStatement mappedStatement = (MappedStatement)getFieldValue(delegate, "mappedStatement");
        Configuration configuration = mappedStatement.getConfiguration();
        TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
        Object param = boundSql.getParameterObject();
        MetaObject metaObject = configuration.newMetaObject(param);
        
        int total = 0;
        String sql = boundSql.getSql();
        String countSql = "select count(1) from (" + sql+ ") as t"; //记录统计  (mysql要求必须添加 最后的as t)
        try{
            Connection conn = (Connection)invocation.getArgs()[0];
            PreparedStatement ps = conn.prepareStatement(countSql);
            int i = 1;
            for (ParameterMapping pm : boundSql.getParameterMappings()) {
                Object value = null;
                String propertyName = pm.getProperty();
                PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                if (typeHandlerRegistry.hasTypeHandler(param.getClass())) {
                    value = param;  
                }
                else if (boundSql.hasAdditionalParameter(propertyName)) {
                    value = boundSql.getAdditionalParameter(propertyName);  
                }
                else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)&& boundSql.hasAdditionalParameter(prop.getName())) {  
                    value = boundSql.getAdditionalParameter(prop.getName());
                    if (value != null) {  
                        value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));  
                    }
                } else {  
                    value = metaObject.getValue(propertyName);
                }
                //http://www.ostools.net/apidocs/apidoc?api=mybatis-3.1.1
                pm.getTypeHandler().setParameter(ps, i++, value, pm.getJdbcType());
            }
            ResultSet rs = ps.executeQuery();
            rs.next();
            total = rs.getInt(1);
            rs.close();  
            ps.close();
        }
        catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("分页查询无法获取总记录数", e);
        }
        return total;
    }
    
    /**
     * 生成分页SQL
     */
    private String generatePageSql(String sql, Page page){
        StringBuilder pageSql = new StringBuilder();
        if("mysql".equals(dialect)){
            pageSql.append(sql);
            pageSql.append(" limit ").append(page.getOffset()).append(",").append(page.getPageSize());  
        }
        else if("oracle".equals(dialect)){
            pageSql.append("select * from (select t.*, ROWNUM num from (")
                .append(sql).append(") as t where ROWNUM <= ")
                .append(page.getOffset()+ page.getPageSize())
                .append(") where num > ").append(page.getOffset());
        }
        else{
            throw new RuntimeException("分页插件还不支持数据库类型:" + dialect);
        }
        return pageSql.toString();
    }
    
    /**
     * 用反射取对象的属性值
     */
    private Object getFieldValue(Object obj, String fieldName) throws Exception{        
        for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass.getSuperclass()) {
            try{
                Field field = superClass.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field.get(obj);
            }
            catch(Exception e){}
        }
        return null;
    }

    /**
     * 用反射设置对象的属性值
     */
    private void setFieldValue(Object obj, String fieldName, Object fieldValue) throws Exception{
        Field field = obj.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        field.set(obj, fieldValue);
    }
    
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }
    
    public void setProperties(Properties props) {
        
    }
    
    public void setDialect(String dialect){
        this.dialect = dialect.toLowerCase();
    }
    
    public String getDialect(){
        return this.dialect;
    }
}
