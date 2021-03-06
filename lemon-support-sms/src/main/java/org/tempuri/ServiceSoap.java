package org.tempuri;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 2.7.4
 * 2013-05-15T13:52:38.765+08:00
 * Generated source version: 2.7.4
 * 
 */
@WebService(targetNamespace = "http://tempuri.org/", name = "ServiceSoap")
@XmlSeeAlso({ObjectFactory.class})
public interface ServiceSoap {

    @WebResult(name = "GetTotalByDayResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetTotalByDay", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetTotalByDay")
    @WebMethod(operationName = "GetTotalByDay", action = "http://tempuri.org/GetTotalByDay")
    @ResponseWrapper(localName = "GetTotalByDayResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetTotalByDayResponse")
    public java.lang.String getTotalByDay(
        @WebParam(name = "userName", targetNamespace = "http://tempuri.org/")
        java.lang.String userName,
        @WebParam(name = "pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "startDate", targetNamespace = "http://tempuri.org/")
        javax.xml.datatype.XMLGregorianCalendar startDate,
        @WebParam(name = "endDate", targetNamespace = "http://tempuri.org/")
        javax.xml.datatype.XMLGregorianCalendar endDate
    );

    @WebResult(name = "RemainNumByUserResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "RemainNumByUser", targetNamespace = "http://tempuri.org/", className = "org.tempuri.RemainNumByUser")
    @WebMethod(operationName = "RemainNumByUser", action = "http://tempuri.org/RemainNumByUser")
    @ResponseWrapper(localName = "RemainNumByUserResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.RemainNumByUserResponse")
    public java.lang.String remainNumByUser(
        @WebParam(name = "userName", targetNamespace = "http://tempuri.org/")
        java.lang.String userName,
        @WebParam(name = "pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd
    );

    @WebResult(name = "SendNoteResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "SendNote", targetNamespace = "http://tempuri.org/", className = "org.tempuri.SendNote")
    @WebMethod(operationName = "SendNote", action = "http://tempuri.org/SendNote")
    @ResponseWrapper(localName = "SendNoteResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.SendNoteResponse")
    public java.lang.String sendNote(
        @WebParam(name = "userName", targetNamespace = "http://tempuri.org/")
        java.lang.String userName,
        @WebParam(name = "pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "phone", targetNamespace = "http://tempuri.org/")
        java.lang.String phone,
        @WebParam(name = "note", targetNamespace = "http://tempuri.org/")
        java.lang.String note
    );

    @WebResult(name = "GetDetailResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetDetail", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetDetail")
    @WebMethod(operationName = "GetDetail", action = "http://tempuri.org/GetDetail")
    @ResponseWrapper(localName = "GetDetailResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetDetailResponse")
    public java.lang.String getDetail(
        @WebParam(name = "userName", targetNamespace = "http://tempuri.org/")
        java.lang.String userName,
        @WebParam(name = "pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "startDate", targetNamespace = "http://tempuri.org/")
        javax.xml.datatype.XMLGregorianCalendar startDate,
        @WebParam(name = "endDate", targetNamespace = "http://tempuri.org/")
        javax.xml.datatype.XMLGregorianCalendar endDate
    );

    @WebResult(name = "GetMd5ExampleResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "GetMd5Example", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetMd5Example")
    @WebMethod(operationName = "GetMd5Example", action = "http://tempuri.org/GetMd5Example")
    @ResponseWrapper(localName = "GetMd5ExampleResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.GetMd5ExampleResponse")
    public java.lang.String getMd5Example();

    @WebResult(name = "AddChildUserResult", targetNamespace = "http://tempuri.org/")
    @RequestWrapper(localName = "AddChildUser", targetNamespace = "http://tempuri.org/", className = "org.tempuri.AddChildUser")
    @WebMethod(operationName = "AddChildUser", action = "http://tempuri.org/AddChildUser")
    @ResponseWrapper(localName = "AddChildUserResponse", targetNamespace = "http://tempuri.org/", className = "org.tempuri.AddChildUserResponse")
    public java.lang.String addChildUser(
        @WebParam(name = "parentname", targetNamespace = "http://tempuri.org/")
        java.lang.String parentname,
        @WebParam(name = "parentPwd", targetNamespace = "http://tempuri.org/")
        java.lang.String parentPwd,
        @WebParam(name = "username", targetNamespace = "http://tempuri.org/")
        java.lang.String username,
        @WebParam(name = "truename", targetNamespace = "http://tempuri.org/")
        java.lang.String truename,
        @WebParam(name = "pwd", targetNamespace = "http://tempuri.org/")
        java.lang.String pwd,
        @WebParam(name = "contacter", targetNamespace = "http://tempuri.org/")
        java.lang.String contacter,
        @WebParam(name = "telphone", targetNamespace = "http://tempuri.org/")
        java.lang.String telphone,
        @WebParam(name = "address", targetNamespace = "http://tempuri.org/")
        java.lang.String address,
        @WebParam(name = "zipcode", targetNamespace = "http://tempuri.org/")
        java.lang.String zipcode,
        @WebParam(name = "email", targetNamespace = "http://tempuri.org/")
        java.lang.String email
    );
}
