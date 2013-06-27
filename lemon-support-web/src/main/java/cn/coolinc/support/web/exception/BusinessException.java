package cn.coolinc.support.web.exception;

public class BusinessException  extends Exception{
    
    private static final long serialVersionUID = 5426228144648116777L;
    
    public BusinessException(){
        super();
    }
    
    /**
     * @param excode 异常代号
     */
    public BusinessException(String excode) {
        super();
        this.excode = excode;
    }

    protected String excode;
    
    public String getExcode() {
        return excode;
    }
    
    public void setExcode(String excode) {
        this.excode = excode;
    }
}
