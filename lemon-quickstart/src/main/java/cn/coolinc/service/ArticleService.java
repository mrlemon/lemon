package cn.coolinc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.dao.ArticleDao;
import cn.coolinc.entity.Article;

@Service
public class ArticleService {
    @Autowired
    private ArticleDao articleDao;
    
    public void save(Article article){
        articleDao.save(article);  
    }
    
    public void update(Article article){
        articleDao.update(article); 
    }
    
    public Article findOne(int id){
        return articleDao.findOne(id);   
    }
    
    public List<Article> findAll(){
        return articleDao.findAll();
    }
}
