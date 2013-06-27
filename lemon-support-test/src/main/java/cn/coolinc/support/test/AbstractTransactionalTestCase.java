package cn.coolinc.support.test;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
/**
 * 测试数据库操作基类
 * @author coolinc
 *
 */
@ActiveProfiles("test")
@ContextConfiguration(locations = "classpath:applicationContext.xml") 
public abstract class AbstractTransactionalTestCase extends AbstractTransactionalJUnit4SpringContextTests {
	protected DataSource dataSource;

	@Override
	@Autowired
	public void setDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
		this.dataSource = dataSource;
	}
}
