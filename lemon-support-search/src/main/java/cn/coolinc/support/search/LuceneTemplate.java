package cn.coolinc.support.search;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.InitializingBean;
import org.wltea.analyzer.lucene.IKAnalyzer;
/**
 * Lucene辅助类
 * @author coolinc
 */
public class LuceneTemplate implements InitializingBean {
    
    private IndexWriter indexWriter;
    
    private IndexReader indexReader;
    
    private IndexSearcher indexSearcher;
    
    private Analyzer analyzer;
    
    private String path;
    
    private Directory directory;
    
    private String highlighter_pre;
    
    private String highlighter_post;
    
    private int summary_size;
    
    public IndexWriter getIndexWriter() {
        IndexWriterConfig conf=new IndexWriterConfig(Version.LUCENE_34, analyzer);
        try {
            indexWriter=new IndexWriter(getDirectory(), conf);
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (LockObtainFailedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return indexWriter;
    }

    public IndexReader getIndexReader() throws CorruptIndexException, IOException {
        indexReader=IndexReader.open(getDirectory());
        return indexReader;
    }

    public IndexSearcher getIndexSearcher() {
        try {
            indexSearcher=new IndexSearcher(getIndexReader());
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return indexSearcher;
    }
    

    public void setAnalyzer(Analyzer analyzer) {
        this.analyzer = analyzer;
    }

    public Analyzer getAnalyzer() {
        return analyzer;
    }
    

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    

    public Directory getDirectory() {
        File file=new File(getPath());
        try {
            directory=new SimpleFSDirectory(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return directory;
    }
    
   
    public void setHighlighter_pre(String highlighter_pre) {
        this.highlighter_pre = highlighter_pre;
    }

    public void setHighlighter_post(String highlighter_post) {
        this.highlighter_post = highlighter_post;
    }
    

    public void setSummary_size(int summary_size) {
        this.summary_size = summary_size;
    }

    public void afterPropertiesSet() throws Exception {
        if(path==null)
            throw new IllegalArgumentException("path must be set.");
        if(analyzer==null)
            analyzer=new IKAnalyzer();
        if(highlighter_pre==null)
            highlighter_pre="<span class='highlighter'>";
        if(highlighter_post==null)
            highlighter_post="</span>";
        if(summary_size==0)
            summary_size=100;
    }
    
    /**
     * 高亮结果
     * @param fieldName
     * @param fieldText
     * @param highlighterText
     * @return
     */
    public String highLighter(String fieldName,String fieldText,String highlighterText){
        try{
            TermQuery query = new TermQuery(new Term(fieldName,highlighterText));
            Scorer scorer = new QueryScorer(query);
            SimpleHTMLFormatter formatter = new SimpleHTMLFormatter(highlighter_pre,highlighter_post);
            Highlighter hig = new Highlighter(formatter, scorer);
            hig.setTextFragmenter(new SimpleFragmenter(summary_size));
            TokenStream tokens = analyzer.tokenStream(fieldName, new StringReader(fieldText));
            String result= hig.getBestFragment(tokens, fieldText);
            return result==null?subFieldText(fieldText):result;
        }catch(Exception e){
            e.printStackTrace();
            return fieldText;
        }
    }
    
    public String subFieldText(String text){
        int len=text.length();
        if(len<=summary_size){
            return text;
        }else{
            return text.substring(0,summary_size);
        }
    }
}
