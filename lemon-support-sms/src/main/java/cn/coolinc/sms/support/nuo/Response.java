package cn.coolinc.sms.support.nuo;

import javax.xml.bind.annotation.XmlElement;

import cn.coolinc.sms.Result;

public class Response {
    
    private  String phone;
    
    private  String result;
    
    private  String description;

    @XmlElement(name="FPhone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @XmlElement(name="FResult")
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @XmlElement(name="FDescription")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String toString() {
        StringBuffer buffer=new StringBuffer();
        buffer
        .append("手机号码：").append(phone)
        .append("\n发送状态").append(result)
        .append("\n详细信息：").append(description);
        return buffer.toString();
    }
    
    public Result toResult(){
        Result result=new Result();
        if("发送成功".equals(this.result)){
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        result.setMobile(phone);
        result.setDescription(description);
        return result;
    }

}
