package cn.coolinc.sms;


/**
 * 短信服务
 * @author coolinc
 *
 */
public interface SmsService {

    /**
     * 发送短信
     * @param mobile 对方手机号码 
     * @param content 短信内容
     * @return {@link cn.coolinc.sms.Result}
     */
    public abstract Result send(String mobile, String content) throws RuntimeException;
}