package cn.coolinc.service;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;

import cn.coolinc.entity.Article;
import cn.coolinc.support.test.AbstractTransactionalTestCase;

@DirtiesContext
public class ArticleServiceTest extends AbstractTransactionalTestCase{
    @Autowired  
    ArticleService articleService;  

    @Test
    public void findOneTest() throws Exception  {
        Article article=articleService.findOne(1);
        Assert.assertNotNull(article);
    }
   
}
