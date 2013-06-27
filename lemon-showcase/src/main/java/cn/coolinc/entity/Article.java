package cn.coolinc.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.coolinc.support.dao.IdEntity;

public class Article extends IdEntity{
    
    private String title;
    
    private String content;
    
    private Date createDate;
    
    private Date modifyDate;
    

    /**
     * 
     */
    public Article() {
        super();
    }

    /**
     * @param title
     * @param content
     * @param createDate
     * @param modifyDate
     */
    public Article(Long id,String title, String content, Date createDate, Date modifyDate) {
        super();
        this.id=id;
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.modifyDate = modifyDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        String date="";
        if(createDate!=null){
            date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(getCreateDate());
        }
        return "id:"+getId()+", title:"+getTitle()+", content:"+this.getContent()+", create date:"+date;
    }
}
