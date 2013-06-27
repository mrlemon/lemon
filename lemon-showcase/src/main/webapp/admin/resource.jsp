<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="javax.servlet.http.Cookie" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String locale="zh_CN";
String theme="default";
String locale_cookie_name="SS_WEB_APPLICATION_LOCALE";
String theme_cookie_name="SS_WEB_APPLICATION_THEME";
Cookie[] cookies=request.getCookies();
for(Cookie c:cookies){
    if(locale_cookie_name.equals(c.getName())){
        locale=c.getValue();
    }
    if(theme_cookie_name.equals(c.getName())){
        theme=c.getValue();
    }
}
request.setAttribute("theme",theme);
request.setAttribute("locale",locale);
%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">  
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-easyui/1.3.3/themes/${theme}/easyui.css">  
<link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-easyui/1.3.3/themes/icon.css">  
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/lemon.css">  
<script type="text/javascript" src="${ctx}/static/js/jquery/1.8.0/jquery.min.js"></script>  
<script type="text/javascript" src="${ctx}/static/js/jquery-easyui/1.3.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${ctx}/static/js/jquery-easyui/1.3.3/jquery.edatagrid.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/jquery-easyui/1.3.3/locale/easyui-lang-${locale}.js"></script> 
<script type="text/javascript" src="${ctx}/static/js/lemon/1.0.0/lemon.js"></script>  
<script type="text/javascript" src="${ctx}/static/js/ckeditor/3.6.6/ckeditor.js"></script>