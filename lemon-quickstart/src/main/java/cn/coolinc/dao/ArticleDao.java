package cn.coolinc.dao;

import cn.coolinc.entity.Article;
import cn.coolinc.support.dao.MyBatisRepository;
import cn.coolinc.support.dao.MybatisDao;

@MyBatisRepository
public interface ArticleDao extends MybatisDao<Article>{
}
