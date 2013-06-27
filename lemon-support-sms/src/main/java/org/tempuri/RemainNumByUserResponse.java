
package org.tempuri;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="RemainNumByUserResult" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "remainNumByUserResult"
})
@XmlRootElement(name = "RemainNumByUserResponse")
public class RemainNumByUserResponse {

    @XmlElement(name = "RemainNumByUserResult")
    protected String remainNumByUserResult;

    /**
     * Gets the value of the remainNumByUserResult property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRemainNumByUserResult() {
        return remainNumByUserResult;
    }

    /**
     * Sets the value of the remainNumByUserResult property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRemainNumByUserResult(String value) {
        this.remainNumByUserResult = value;
    }

}
