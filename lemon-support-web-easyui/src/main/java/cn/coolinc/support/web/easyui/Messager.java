package cn.coolinc.support.web.easyui;

/**
 * UI简单信息载体
 * @author coolinc
 *
 */
public class Messager{
    boolean success;
    String msg;
    public final static Messager SUCCESS=new Messager(true);
    public final static Messager FAILURE=new Messager(false);
    /**
     * @param success
     */
    public Messager(boolean success) {
        super();
        this.success = success;
    }
    /**
     * @param success
     * @param msg
     */
    public Messager(boolean success, String msg) {
        super();
        this.success = success;
        this.msg = msg;
    }
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
}
