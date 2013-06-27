package cn.coolinc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.Fieldable;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.queryParser.QueryParser.Operator;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NumericRangeQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopFieldDocs;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.coolinc.entity.Article;
import cn.coolinc.support.dao.Page;
import cn.coolinc.support.search.LuceneTemplate;

@Service
public class ArticleIndexService{
    Log log=LogFactory.getLog(getClass());
    
    @Autowired
    private LuceneTemplate indexTemplate;
    
    public void create(Article vo){
        IndexWriter indexWriter=null;
        try {
            indexWriter=indexTemplate.getIndexWriter();
            Document doc=getDocument(vo);
            indexWriter.addDocument(doc);
            indexWriter.optimize();
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(indexWriter!=null){
                try {
                    indexWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        
    }
    
    public void create(List<Article> voList){
        IndexWriter indexWriter=null;
        try {
            indexWriter=indexTemplate.getIndexWriter();
            for(Article vo:voList){
                Document doc=getDocument(vo);
                indexWriter.addDocument(doc);
            }
            indexWriter.optimize();
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(indexWriter!=null){
                try {
                    indexWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public void delete(long id){
        IndexWriter indexWriter=null;
        indexWriter=indexTemplate.getIndexWriter();
        try {
            indexWriter.deleteDocuments(new Term("id",String.valueOf(id)));
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(indexWriter!=null){
                try {
                    indexWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public void update(Article vo){
        IndexWriter indexWriter=indexTemplate.getIndexWriter();
        Document doc=getDocument(vo);
        try {
            indexWriter.updateDocument(new Term("id",String.valueOf(vo.getId())), doc);
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(indexWriter!=null){
                try {
                    indexWriter.close();
                } catch (CorruptIndexException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    

    public void deleteAll(){
        IndexWriter indexWriter=null;
        try {
            indexWriter=indexTemplate.getIndexWriter();
            indexWriter.deleteAll();
            indexWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                indexWriter.close();
            } catch (CorruptIndexException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Article> search(String q, Page page) {
        IndexSearcher indexSearcher=indexTemplate.getIndexSearcher();
        try{
            Analyzer analyzer=indexTemplate.getAnalyzer();
            String[] fields=new String[]{"title","content"};
            QueryParser queryParser=new MultiFieldQueryParser(Version.LUCENE_34, fields, analyzer);
            queryParser.setDefaultOperator(Operator.AND);
            Query query=queryParser.parse(q);
            SortField field=new SortField("updateDate",SortField.LONG,true);
            Sort sort=new Sort(field);
            TopFieldDocs docs = indexSearcher.search(query,indexSearcher.maxDoc(), sort);
            ScoreDoc[] sdocs=docs.scoreDocs;
            if(sdocs.length<1)
                Collections.emptyList();
            page.setTotal(sdocs.length);
            
            List<Article> results=new ArrayList<Article>(page.getPageSize());
            //pagination
            int start=page.getOffset();
            int end=start+page.getPageSize();
            if(end>page.getTotal())
                end=page.getTotal();
            for(int i=start;i<end;i++){
                ScoreDoc sdoc=sdocs[i];
                Document document=indexSearcher.doc(sdoc.doc);
                Article vo=getArticle(document,q);
                results.add(vo);
            }
            return results;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(indexSearcher!=null){
                try {
                    indexSearcher.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
    
    
    public boolean notNull(Object obj){
        if(obj==null)
            return false;
        else
            return true;
    }
    
    /**
     * 多条件查询(备份)
     * @param params 查询条件
     * @param page 分页javabean
     * @return
     */
    public List<Article> search(Map<String,Object> params, Page page) {
        IndexSearcher indexSearcher=indexTemplate.getIndexSearcher();
        try{
            BooleanQuery query=getQuery(params);
            Sort sort = getSort();
            TopFieldDocs docs = indexSearcher.search(query,indexSearcher.maxDoc(), sort);
            ScoreDoc[] sdocs=docs.scoreDocs;
            if(sdocs.length<1)
                Collections.emptyList();
            page.setTotal(sdocs.length);
            
            List<Article> results=new ArrayList<Article>(page.getPageSize());
            //pagination
            int start=page.getOffset();
            int end=start+page.getPageSize();
            if(end>page.getTotal())
                end=page.getTotal();
            for(int i=start;i<end;i++){
                ScoreDoc sdoc=sdocs[i];
                Document document=indexSearcher.doc(sdoc.doc);
                Article vo=getArticle(document);
                results.add(vo);
            }
            return results;
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(indexSearcher!=null){
                try {
                    indexSearcher.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    
    private Sort getSort() {
        SortField field1=new SortField("updateDate",SortField.LONG,true);
        SortField field2=new SortField("modifyDate",SortField.LONG,true);
        SortField field3=new SortField("id",SortField.LONG,true);
        Sort sort=new Sort(field1,field2,field3);
        return sort;
    }
    
    private BooleanQuery getQuery(Map<String,Object> map){
        Analyzer analyzer=indexTemplate.getAnalyzer();
        BooleanQuery  bquery=new BooleanQuery(); 
        Object id=map.get("id");
        Object title=map.get("title");
        Object content=map.get("content");
        Object createDate=map.get("createDate");
        Object modifyDate=map.get("modifyDate");
        if(id!=null) {
            Query query = new TermQuery(new Term("id",id.toString()));
            bquery.add(query,Occur.MUST);
        }
        
        if(title!=null) {
          QueryParser parser=new QueryParser(Version.LUCENE_34,"title",analyzer);
          Query query=null;
          try {
              query = parser.parse(title.toString());
          } catch (ParseException e) {
              e.printStackTrace();
          }
          bquery.add(query,Occur.MUST);
        }
        
        if(content!=null) {
            QueryParser parser=new QueryParser(Version.LUCENE_34,"content",analyzer);
            Query query=null;
            try {
                query = parser.parse(content.toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            bquery.add(query,Occur.MUST);
        }
       
        if(createDate!=null){
            Date date=(Date)createDate;
            Query query= NumericRangeQuery.newLongRange("createDate",date.getTime(), new Date().getTime(),true,true);
            bquery.add(query,Occur.MUST);
        }
        if(modifyDate!=null){
            Date date=(Date)createDate;
            Query query= NumericRangeQuery.newLongRange("modifyDate",date.getTime(), new Date().getTime(),true,true);
            bquery.add(query,Occur.MUST);
        }
        
        log.debug("Queries:"+bquery.toString()+"\n");
        return bquery;
    }
    
    
    private Document getDocument(Article vo){
        Document doc=new Document();
        Fieldable id=new Field("id",String.valueOf(vo.getId()),Store.YES,Index.NOT_ANALYZED);
//        Fieldable id=new NumericField("id",Store.YES,true).setLongValue(vo.getId());
        doc.add(id);
        
        Fieldable name=new Field("title",null2s(vo.getTitle()),Store.YES,Index.ANALYZED);
        doc.add(name);
        
        Fieldable content=new Field("content",null2s(vo.getContent()),Store.YES,Index.ANALYZED); 
        doc.add(content);
        
        Fieldable updateDate=new NumericField("createDate",Store.YES,true).setLongValue(date2long(vo.getCreateDate()));
        doc.add(updateDate);
        
        Fieldable modifyDate=new NumericField("modifyDate",Store.YES,true).setLongValue(date2long(vo.getModifyDate()));
        doc.add(modifyDate);
        return doc;
    }
    
    
    private String null2s(String s){
        if(s==null){
            return "";
        }else{
            return s.trim();
        }
    }
    
    private long date2long(Date d){
        if(d==null){
            return 0l;
        }else{
            return d.getTime();
        }
    }
    
    
    /**
     * 工程信息搜索
     * @param document
     * @param q
     * @return
     */
    public Article getArticle(Document document,String q){
        String id=document.get("id");
        String title=indexTemplate.highLighter("title",document.get("title"),q);
        String content=indexTemplate.highLighter("content",document.get("content"),q);
        String date_str=document.get("createDate");
        Date createDate=null;
        if(date_str!=null){
            long date_long=Long.parseLong(date_str);
            createDate=new Date(date_long);
        }
        Article vo=new Article();
        vo.setId(id==null?0:Long.parseLong(id));
        vo.setTitle(title);
        vo.setContent(content);
        vo.setCreateDate(createDate);
        return vo;
    }
    
    /**
     * 工程信息列表搜索
     * @param document
     * @return
     */
    public Article getArticle(Document document){
        String id=document.get("id");
        String title=document.get("title");
        String content=document.get("content");
        String date_str=document.get("createDate");
        Date create_date=null;
        if(date_str!=null){
            long date_long=Long.parseLong(date_str);
            create_date=new Date(date_long);
        }
        Article vo=new Article();
        vo.setId(id==null?0:Long.parseLong(id));
        vo.setTitle(title);
        vo.setContent(content);
        vo.setCreateDate(create_date);
        return vo;
    }
}
