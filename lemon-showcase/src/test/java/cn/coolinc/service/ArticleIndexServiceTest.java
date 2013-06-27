package cn.coolinc.service;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import cn.coolinc.entity.Article;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.test.AbstractTestCase;

@ContextConfiguration(locations ={"classpath*:/search/applicationContext-lucene.xml"})
public class ArticleIndexServiceTest extends AbstractTestCase{
    
    @Autowired
    ArticleIndexService articleIndexService;
    
//    @Test
    public void createTest(){
        Article article=new Article(1l,"中华人民共和国50周年庆","中华人民共和国50周年庆内容详细" , new Date(),new Date());
        Article article2=new Article(2l,"中华人民共和国60周年庆","中华人民共和国60周年庆内容详细" , new Date(),new Date());
        articleIndexService.create(article);
        articleIndexService.create(article2);
    }
//    
//    @Test
//    public void updateTest(){
//        Article article=new Article(1l,"中华人民共和国80周年庆","中华人民共和国50周年庆内容详细" , new Date(),new Date());
//        articleIndexService.update(article);
//    }
//    @Test
    public void deleteTest(){
        articleIndexService.delete(2l);
    }
    
    @Test
    public void searchTest(){
        Page page=new Page(1, 10);
        List<Article> results=articleIndexService.search("中华", page);
        Assert.assertTrue(page.getTotal()>0);
        for(Article article:results){
            System.out.println(article.toString());
        }
    }

}
