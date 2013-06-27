package cn.coolinc.sms.support.nuo;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
 
/**
 * @author Unmi
 * CreateTime: Apr 21, 2011
 */
@XmlRootElement(name="ds")
public class ResponseList {
    
    private List<Response> response;

    @XmlElement(name="dt")
    public List<Response> getResponse() {
        return response;
    }

    public void setResponse(List<Response> response) {
        this.response = response;
    }
}