package cn.coolinc.sms;
/**
 * 短信反馈信息
 * @author coolinc
 */
public class Result {
    
    public String mobile;
    
    public boolean success;
    
    public String description;
    
    public Result() {
        
    }
    
    
    /**
     * @param mobile
     * @param success
     * @param description
     */
    public Result(String mobile, boolean success, String description) {
        super();
        this.mobile = mobile;
        this.success = success;
        this.description = description;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        StringBuffer result=new  StringBuffer();
        result.append("手机号码：").append(mobile)
        .append("\n发送状态：").append(success?"成功":"失败")
        .append("\n反馈信息：").append(description);
        return result.toString();
    }
    
    

   
}
