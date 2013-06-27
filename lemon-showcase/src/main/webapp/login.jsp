<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<f:setLocale value="${locale}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<meta name="description" content=""/>
<title><f:message key="L_ADMIN_001"/></title>
<script type="text/javascript" src="${ctx}/static/js/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery-placeholder/jquery.placeholder.min.js"></script>
<style type="text/css">
/* reset */
body{line-height:1.666;background: url("${ctx}/static/images/login-bg.gif");}
body,select,input,h1,h2,h3{font-size:12px}
body,input,select{font-family:verdana}
body,h1,h2,h3,ul,li,form,p,img{margin:0;padding:0;border:0}
input{margin:0;padding:0}
input,img{line-height:normal}
ul,li{list-style:none}
article,aside,copyright,.header,hgroup,nav,section{display: block}
a{color:#fff;text-decoration:none}
a:hover{text-decoration:underline}

.page,html,body{width:100%;height:100%}
.page{min-width:689px;min-height:435px;position:relative;+zoom:1}
/* 行内元素 */
.btn,
.copy-item,
.ico,
.tab-list{display:inline-block;+display:inline;+zoom:1;vertical-align:middle}
/* 隐藏文字 */
.main h3,
.tab-list .item .ico-logo,
.form .hd{line-height:100px;overflow:hidden}
/* 背景 */
.btn,
.ico{background-image:url('${ctx}/static/images/login-btn.png');background-repeat:no-repeat}
/* 图标 */
.ico-logo{height:30px;background-position:0 0}
.ico-logo-gcxx{width:131px;/* background: url('/images/backstage/logo1.gif') no-repeat; */}
.ico-logo-v1980{width:133px;/* background: url('/images/backstage/logo1.gif') no-repeat; */}
.ico-logo-club{width:130px;/* background: url('/images/backstage/logo1.gif') no-repeat; */}
.ico-logo-soping{width:133px;/* background: url('/images/backstage/logo1.gif') no-repeat; */}
.ico-why{width:14px;height:14px;background-position:-336px -64px}
.ico-rArr{width:4px;height:7px;background-position:-336px -128px}
/* 按钮 */
.btn{border:0;width:102px;height:40px}
.btn-login{background-position:0 -64px;cursor: pointer;}
.btn-login-hover{background-position:-112px -64px}
.btn-login-active{background-position:-224px -64px}
/* 输入框 */
.ipt-wraper .ipt-c{position: relative;top: 2px;margin-right: 5px;}
/* tab */
.tab-list{width:220px;position:relative;+zoom:1;box-shadow:0px 1px 5px RGBA(0,0,0,0.2)}
.tab-list .item{cursor:pointer;position:relative;overflow:hidden;+zoom:1;height:77px;width:220px;vertical-align:top}
.tab-list .item .bg{cursor:pointer;width:100%;height:76px;background-color:#fff;border-bottom:1px solid #ccc;position:absolute;z-index:0;left:0;top:0;opacity:0.4;filter:alpha(opacity=40);_filter:alpha(opacity=50)}
.tab-list .item-qiye .bg{border-bottom:none;height:77px}
.tab-list .item .bg-selected{display:none;position:absolute;z-index:4;top:0;left:0;background-repeat:repeat-x;_background:#fff;_filter:alpha(opacity=50);width:219px;height:76px;zoom:1}
.tab-list .item .logo{position:absolute;zoom:1;background-color:transparent;cursor:pointer;z-index:5;top:23px;left:47px;opacity:0.6;filter:alpha(opacity=60)}
.tab-panel-locat {-webkit-transition: all .3s;-moz-transition: all .3s;-o-transition: all .3s;-ms-transition: all .3s;transition: all .3s;}
.tab-panel-locat {position: absolute;z-index: 15;top: 28px;left: -15px;}
.ico-arr {width: 16px;height: 24px;background-position: 0 0;_background-position: -288px 0;}
.ico-arr {background-image: url(http://mimg.127.net/index/email/img/2012/arr.png);_background-image: url(http://mimg.127.net/index/email/img/2012/logo_ie6.png);}
.mail-163 .tab-list .item-163 .bg,
.mail-126 .tab-list .item-126 .bg,
.mail-yeah .tab-list .item-yeah .bg,
.mail-qiye .tab-list .item-qiye .bg,
.tab-list .hover .bg{opacity:0.6;filter:alpha(opacity=60);_filter:alpha(opacity=80)}
.mail-163 .tab-list .item-163 .logo,
.mail-126 .tab-list .item-126 .logo,
.mail-yeah .tab-list .item-yeah .logo,
.mail-qiye .tab-list .item-qiye .logo{opacity:1;filter:alpha(opacity=100)}
.tab-list .hover .logo{opacity:0.7;filter:alpha(opacity=70)}
.mail-163 .tab-list .item-163 .bg-selected,
.mail-126 .tab-list .item-126 .bg-selected,
.mail-yeah .tab-list .item-yeah .bg-selected,
.mail-qiye .tab-list .item-qiye .bg-selected{display:block}
/* tab panel */
.tab-panel{width:460px;height:308px;border-color:#CDCDCD;border-width:0;background-color:#fff;;border-style:solid;position:relative;z-index:10;+zoom:1;box-shadow:0px 1px 5px RGBA(0,0,0,0.5)}
.tab-panel .form{padding:0 60px}

.tab-panel .shadow,
.tab-list .shadow{display:none}

/* 表单 */
.form{overflow:hidden;+zoom:1;color:#7A8698;line-height:normal;height:308px}
.form a{color:#217DD9}
.form .hd{width:220px;height:24px;line-height: 24px;font-size: 20px; font-family: '微软雅黑';color: #666;}
.form .options{position:relative;+zoom:1}
.form .options label{margin-right:60px}
.form .options .help{line-height:0;display:inline-block;+display:inline;+zoom:1;vertical-align:top;margin-left:4px}
.form .options .ext{position:absolute;right:0;top:0;color:#7a8698}
.form .options .ext:hover{text-decoration:none;color:#217dd9}
.form .ft{border-top:1px solid #C9D6DD;padding-top:11px}
.form .hd{margin-top:29px;}
.form .user,
.form .pass{margin-top:26px}
.form .options{margin-top:16px}
.form .ft{margin-top:25px}
/* 版本选择 */
.ft-mailver-text{color:#7a8698}
.form .ft-mailver-now{cursor:pointer;display:inline-block;padding-right:12px;position:relative;color:#7a8698;}
.form .ft-mailver-now:hover{color:#217dd9;text-decoration:none;}
#loginFootTipsVer{position:relative;}
.ft-verSelect{position:absolute;height:122px;width:133px;border:1px solid #cdcdcd;overflow:hidden;background:#fff;z-index:2;top:263px;left:108px;display:none;box-shadow:0px 1px 5px rgba(0,0,0,0.5);border-color:rgba(205, 205, 205, 0)}
.ft-verSelect-inner{position:absolute;height:120px;width:131px;border:1px solid #fff;overflow:hidden;}
.ft-verSelect-inner li{float:left:height:24px;width:131px;overflow:hidden}
.form .ft-verSelect-inner-a{height:24px;width:131px;overflow:hidden;display:block;line-height:24px;color:#7a8698;text-indent:18px;}
.form .ft-verSelect-inner-a-selected{color:#217dd9;text-decoration:none}
.form .ft-verSelect-inner-a:hover{background:#ecf5fa;text-decoration:none}
.ft-mailver-darr{position:absolute;width:7px;height:4px;overflow:hidden;right:0;top:5px;}
.ft-mailver-darr i{background:#217dd9}
.ft-verSelect-tick{height:13px;width:13px;overflow:hidden;left:4px;position:absolute;top:0}
.icoTick-color1{background:#c8e0f4}
.icoTick-color2{background:#217dd9}
.icoTick-color3{background:#b7d6f1}
.icoTick-color4{background:#98c4ec}
/* 输入框 */
.ipt-t{line-height:0;font-size:0;border-radius:2px;position:relative;+zoom:1;height:46px;border:1px solid #BAC7D2;background-color:#ECF5FA;box-shadow:0 0 2px RGBA(0,46,115,.25) inset;font-family:"Microsoft Yahei";}
.ipt-t input{width:211px;outline:none;background:none;border:none;height:19px;margin:0;padding:13px 10px;_padding-bottom:10px;font-size:14px;line-height:normal;color:#000;font-weight:bold;margin-top;1px;}
.ipt-t label{position:absolute;left:0;top:12px;line-height:normal;font-size:16px;color:#90A2BC}
.ipt-t .domain{position:absolute;font-size:14px;font-weight:bold;font-family:verdana;height:46px;width:105px;border-left:1px solid #E0E9ED;text-align:center;color:#5E6F88;line-height:46px;background-color:#F7FBFD;right:0;top:0}
.ipt-t .btn-login{position:absolute;top:3px;right:3px}
.ipt-t-hover{border-color:#93afc6}
.ipt-t-hover label{color:#6C88B3}
.ipt-t-focus{border-color:#7dc4ff}
.ipt-t-focus label{color:#6D89B3}
/* 顶部 */
.header{*position:absolute;*width:100%;display:block;}
.header{position:relative;z-index:11;height:45px;}
.header .bg{position:absolute;z-index:2;left:0;top:0;width:100%;height:45px;opacity:0.5;filter:alpha(opacity=50);_filter:alpha(opacity=100);}
.header .inner{position:relative;z-index:3;width:680px;margin:0 auto}
.header h1{position:absolute;top:9px;left:1px;opacity:0.6;filter:alpha(opacity=60);}
.header h1 img{_visibility:hidden}
.header .ext{position:absolute;right:0;line-height:normal;top:15px;opacity:0.4;filter:alpha(opacity=40)}
.header .link{margin-left:20px}
/* 主要 */
.main{position:relative;z-index:10}
.main .inner{width:680px;margin:0 auto;position:relative;+zoom:1}
.tab{position:relative;+zoom:1}
.tab-panel{position:absolute;left:220px;top:0}
.main h3{font-family:'微软雅黑';z-index:1;width:298px;height:40px;padding-top: 20px;padding-bottom:10px; line-height: 40px;font-size: 23px;color: black;font-weight: lighter;}
main h3#mainHd{font-family:'宋体';}
/* 推广 */
.expansion{text-align:left;position:absolute;z-index:10;bottom:46px;left:0;width:100%;height:18px;color:#a0c9e0;}
.expansion .inner{border-top:1px solid #75b3d5;line-height:17px;height:17px;margin:0 auto;position:relative;width:680px;text-align:center;border-color:rgba(255, 255, 255 , 0.2)}
.expansion a{color:#fff;}
.expansion a:hover{text-decoration:none}
.expansion .tranex{position:relaitve;zoom:1;opacity:0.5;filter:alpha(opacity=50);z-index:1;}
.expansion .tranex:hover{opacity:0.8;filter:alpha(opacity=80)}
.expansion span{margin-right:8px;}
.expansion .left{position:absolute;text-align:left;left:0;top:0;line-height:17px;height:17px;z-index:2;}
.expansion .right{position:absolute;text-align:right;right:0;top:0;line-height:17px;height:17px;z-index:2;}
/* 版权 */
.copyright{text-align:left;position:absolute;z-index:10;bottom:0;left:0;width:100%;height:45px}
.copyright .bg{position:absolute;left:0;top:0;width:100%;height:100%;background-color:#fff;opacity:0.4;filter:alpha(opacity=40)}
.copyright .inner{padding-top:16px;width:680px;margin:0 auto;position:relative;z-index:2}
.copyright,.copyright a{color:#000}
.copy-title{display:none}
.copy-item{margin-right:18px;vertical-align:top;opacity:0.4;filter:alpha(opacity=40)}
.copy-item-img{margin-right:0;position:absolute;right:0;top:15px;opacity:0.65;filter:alpha(opacity=65)}
.copy-item .sptln{margin-right:18px}
/* 主题背景 */
.theme{overflow:hidden;position:absolute;z-index:5;width:100%;height:100%;left:0;top:0}
.theme img{position:absolute}


.mail-126 .icoTick-color1{background:#c5e8c7}
.mail-126 .icoTick-color2{background:#01ab1d}
.mail-126 .icoTick-color3{background:#c8e9c9}
.mail-126 .icoTick-color4{background:#8dd796}
.mail-126 .form .ft-verSelect-inner-a{color:#537a5b;}
.mail-126 .form .ft-verSelect-inner-a-selected{color:#01ab1d;}
.mail-126 .form .ft-verSelect-inner-a:hover{background:#eff5eb;}
.mail-126 .ft-mailver-text{color:#537a5b}
.mail-126 .form .ft-mailver-now{color:#537a5b}
.mail-126 .form .ft-mailver-now:hover{color:#01ab1d}
.mail-126 .ft-mailver-darr i{background:#01ab1d}
.mail-126 .form .options .ext{color:#537a5b;}
.mail-126 .form .options .ext:hover{color:#01ab1d}
.mail-126 .form{color:#537A5B}
.mail-126 .form a{color:#01AB1D}
.mail-126 .form .hd{background-position:-176px 0}
.mail-126 .form .ft{border-color:#C9D6DD}
.mail-126 .ipt-t{box-shadow: 0 0 2px RGBA(0,86,31,.25) inset;border-color:#b5cdaa;background-color:#EFF5EB}
.mail-126 .ipt-t label{color:#85A28B}
.mail-126 .ipt-t-hover{border-color:#97b188}
.mail-126 .ipt-t-hover label{color:#73937A}
.mail-126 .ipt-t-focus{border-color:#81dc4d}
.mail-126 .ipt-t-focus label{color:#73937A}
.mail-126 .ipt-t .domain{background-color:#F9FBF7;border-color:#E3E9DF;color:#4C8057}
.mail-126 .ipt-t .btn-login{background-position:0 -112px}
.mail-126 .ipt-t .btn-login-hover{background-position:-112px -112px}
.mail-126 .ipt-t .btn-login-active{background-position:-224px -112px}
.mail-126 .ico-why{background-position:-336px -80px}


.mail-yeah .icoTick-color1{background:#edcccd}
.mail-yeah .icoTick-color2{background:#dc1f26}
.mail-yeah .icoTick-color3{background:#eeced0}
.mail-yeah .icoTick-color4{background:#e89b9d}
.mail-yeah .form .ft-verSelect-inner-a{color:#7d7d7d;}
.mail-yeah .form .ft-verSelect-inner-a-selected{color:#dc1f26;}
.mail-yeah .form .ft-verSelect-inner-a:hover{background:#f1f1f1;}
.mail-yeah .ft-mailver-text{color:#7d7d7d}
.mail-yeah .form .ft-mailver-now{color:#7d7d7d}
.mail-yeah .form .ft-mailver-now:hover{color:#dc1f26}
.mail-yeah .ft-mailver-darr i{background:#dc1f26}
.mail-yeah .form .options .ext{color:#7d7d7d;}
.mail-yeah .form .options .ext:hover{color:#dc1f26;}
.mail-yeah .form{color:#7D7D7D}
.mail-yeah .form a{color:#DC1F26}
.mail-yeah .form .hd{width:180px;background-position:-176px -33px}
.mail-yeah .form .ft{border-color:#C9D6DD}
.mail-yeah .ipt-t{box-shadow: 0 0 2px RGBA(67,67,67,.25) inset;border-color:#C9C9C9;background-color:#f1f1f1}
.mail-yeah .ipt-t label{color:#A0A0A0}
.mail-yeah .ipt-t-hover{border-color:#b0b0b0}
.mail-yeah .ipt-t-hover label{color:#898989}
.mail-yeah .ipt-t-focus{border-color:#d5a3a3}
.mail-yeah .ipt-t-focus label{color:#898989}
.mail-yeah .ipt-t .domain{background-color:#F9F9F9;border-color:#E5E5E5;color:#707070}
.mail-yeah .ipt-t .btn-login{background-position:0 -160px}
.mail-yeah .ipt-t .btn-login-hover{background-position:-112px -160px}
.mail-yeah .ipt-t .btn-login-active{background-position:-224px -160px}
.mail-yeah .ico-why{background-position:-336px -96px}

.mail-qiye .form a{color:#7A8698}
.mail-qiye .form a .ico-rArr{margin-left:4px}
.mail-qiye .form a:hover{color:#2475B5}
.mail-qiye .form a:hover .ico-rArr{background-position:-336px -144px}
.mail-qiye .form{color:#7A8698}
.mail-qiye .form .hd{background-position:0 -32px}
.mail-qiye .user input{width:318px}
.mail-qiye .ipt-t .domain{display:none}
.mail-qiye .ipt-t .btn-login{background-position:0 -208px}
.mail-qiye .ipt-t .btn-login-hover{background-position:-112px -208px}
.mail-qiye .ipt-t .btn-login-active{background-position:-224px -208px}
.mail-qiye .ico-why{background-position:-336px -112px}

input.placeholder{color: #a9a9a9;}
#divError{line-height:normal;px;position:absolute;top:132px;left:60px;color:#d90000}
.ft-ext{position:absolute;top:270px;right:60px;}
</style> 
<!--[if lte IE 8]>
	<style type="text/css">
		.ipt-t label{top:15px}
		.tab-panel .shadow,
		.tab-list .shadow{display:block;font-size:0;line-height:0;position:absolute;background-image:url(/images/backstage/shadow_x.png);background-repeat:repeat-x;_background:#000;_filter:alpha(opacity=20)}
		.tab-panel .shadow-left,
		.tab-panel .shadow-right,
		.tab-list .shadow-left{position:absolute;background-image:url(/images/backstage/shadow_y.png);background-repeat:repeat-y;_background:#000;_filter:alpha(opacity=20)}
		.tab-panel .shadow-bottom,
		.tab-panel .shadow-top,
		.tab-list .shadow-bottom,
		.tab-list .shadow-top{bottom:-5px;left:0;width:220px;height:5px;background-position:0 0}
		.tab-list .shadow-top{bottom:auto;top:-3px;height:3px;background-position:0 -32px}
		.tab-list .shadow-left{width:4px;height:311px;left:-4px;bottom:-2px}
		.tab-panel .shadow-bottom{width:460px;left:0;bottom:-5px;background-position:0 -16px}
		.tab-panel .shadow-top{bottom:auto;width:460px;top:-3px;height:3px;background-position:0 -48px}
		.tab-panel .shadow-left{z-index:10;width:3px;height:309px;left:-3px;bottom:-1px;background-position:-16px 0}
		.tab-panel .shadow-right{width:4px;height:311px;left:auto;right:-4px;bottom:-2px;background-position:-32px 0}
		.ipt-wraper .ipt-c{position:static;visibility:visible}
		.copy-item-img{filter:none}
	</style>
<![endif]-->
<!--[if IE 6]>
	<style type="text/css">
		.main h3{line-height:normal;font-size:26px;color:#fff;background:none;width:400px;font-family:simhei;font-weight:normal}
		.tab-list .shadow-bottom{height:1px;bottom:-1px;filter:alpha(opacity=10)}
		.tab-list .shadow-top{height:1px;top:-1px;filter:alpha(opacity=10)}
		.tab-list .shadow-left{width:1px;left:-1px;height:309px;bottom:-1px;filter:alpha(opacity=10)}
		.tab-panel .shadow-bottom{width:461px;height:1px;bottom:-1px}
		.tab-panel .shadow-top{height:1px;top:-1px}
		.tab-panel .shadow-left{width:1px;left:-1px;filter:alpha(opacity=20)}
		.tab-panel .shadow-right{height:310px;width:1px;right:-1px;height:309px;bottom:0}
		.copyright,.copyright a{color:#7d7d7d}
		.copy-item{filter:none}
		.copy-item-img{filter:alpha(opacity=65)}
	</style>
<![endif]-->
<style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style></head>
	<body class="mail-163">
		<div class="page" id="page">
			<!-- 头 -->
			<div class="header">
				<div class="inner">
					<h1></h1>
					<p class="ext"></p>
				</div>
				<div class="bg"></div>
			</div>
			<!-- 主要内容 -->
			<div class="main" id="main" style="margin-top: 8.5px; ">
				<div class="inner">
					<h3 id="mainHd"><f:message key="L_ADMIN_001"/></h3>
					<div class="tab">
						<div class="tab-list">
							<ul>
								<li id="tab163Link" class="item item-163">
									<div class="logo"></div>
									<div class="bg"></div>
									<div class="bg-selected"></div>
								</li>
								<li id="tab126Link" class="item item-126">
									<div class="logo"></div>
									<div class="bg"></div>
									<div class="bg-selected"></div>
								</li>
								<li id="tabyeahLink" class="item item-yeah">
									<div class="logo"></div>
									<div class="bg"></div>
									<div class="bg-selected"></div>
								</li>
								<li id="tabqiyeLink" class="item item-qiye">
									<div class="logo"></div>
									<div class="bg"></div>
									<div class="bg-selected"></div>
								</li>
							</ul>
							<span class="shadow shadow-bottom">&nbsp;</span>
							<span class="shadow shadow-top">&nbsp;</span>
							<span class="shadow shadow-left">&nbsp;</span>
						</div>
						<div class="tab-panel">
							<div class="form">	
								<h2 class="hd" id="LoginTitle"><f:message key="L_ADMIN_002"/></h2>							
								<form class="bd" action="${ctx}/admin/login" name="frmLogin" method="post" id="loginForm" onsubmit="return loginSubmit();">
									<!-- 帐号 -->
									<div class="ipt ipt-t user">
										<input type="text" placeholder="<f:message key="L_ADMIN_003"/>" name="username" tabindex="1" style="width: 317px;">
									</div>
									<!-- 密码 -->
									<div class="ipt ipt-t pass">
										<input type="password" name="password" placeholder="<f:message key="L_ADMIN_004"/>" tabindex="2">
										<button id="btnSubmit" title="登录" class="btn btn-login" type="submit"></button>
									</div>
									<!-- 风格 -->
									<div id="setStyleOutter" style="display:none;">
										<!-- <select tabindex="4" class="sel" id="selStyle" onchange="fStyleEvent();"><option value="-1">默认版本&nbsp;</option><option value="5">XXX邮箱5.0</option></select> -->
									</div>
									<!-- 相关选项 -->
									<div class="options">
										<label class="ipt-wraper ipt-wraper-checked" style="margin-right:56px;"><input tabindex="5" type="checkbox" id="remember_me" name="remember_me" class="ipt ipt-c" id="rmbUser"><f:message key="L_ADMIN_005"/></label>
										<!-- <a class="ext" href="http://reg.coolinc.cn/RecoverPasswd1.shtml" title="" id="forGetPassword" target="_blank" style="">忘记密码?</a> -->
									</div>
									<div id="divError" style="display: none; "></div>
									<div class="ft" id="loginFootTipsVer" style="display: block; ">
										<!-- <span class="ft-mailver-text">邮箱版本：</span>
										<a id="ftVerSelLink" class="ft-mailver-now" href="javascript:void(0);">
											<span id="ftVerSelLinkTxt">默认版本&nbsp;</span>
											<div id="ftDarr" class="ft-mailver-darr"><i style="position:absolute;height:1px;overflow:hidden;left:0px;top:0px;width:7px;"></i><i style="position:absolute;height:1px;overflow:hidden;left:1px;top:1px;width:5px;"></i><i style="position:absolute;height:1px;overflow:hidden;left:2px;top:2px;width:3px;"></i><i style="position:absolute;height:1px;overflow:hidden;left:3px;top:3px;width:1px;"></i></div>
										</a> -->
									</div>
									<div class="ft" id="loginFootTips" style="display: none; "></div>
									<div class="ft-ext" id="loginFootTipsQiye" style="display: none; ">
										<a href="http://qiye.coolinc.cn/admin.jsp">进入管理员登录页面<b class="ico ico-rArr"></b></a>
									</div>
									<!-- <div class="ft-ext" id="loginFootTipsRight" style="display: block; "><a href="http://reg.email.coolinc.cn/mailregAll/reg0.jsp?from=email163&amp;regPage=163" target="_blank" tabindex="9">注册XXX免费邮</a></div>
									<div class="ft-verSelect" id="verSelect" style="display: none; ">
										<div class="ft-verSelect-inner" id="verSelectUl">
											<ul>
												<li>
													<a class="ft-verSelect-inner-a ft-verSelect-inner-a-selected" data-ver="default" href="javascript:void(0)" onclick="fVerSelect(this);">默认版本&nbsp;</a>
												</li>
												<li>
													<a class="ft-verSelect-inner-a" data-ver="jy3" href="javascript:void(0)" onclick="fVerSelect(this);">简约3.0</a>
												</li>
											</ul>
											<b id="verSelectTick" class="ft-verSelect-tick" style="top: 5px; "><i style="position:absolute;height:1px;overflow:hidden;left:10px;top:3px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:9px;top:4px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:10px;top:4px;width:1px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:8px;top:5px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:9px;top:5px;width:2px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:2px;top:6px;width:1px;" class="icoTick-color3"></i><i style="position:absolute;height:1px;overflow:hidden;left:3px;top:6px;width:1px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:4px;top:6px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:7px;top:6px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:8px;top:6px;width:2px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:10px;top:6px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:2px;top:7px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:3px;top:7px;width:2px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:5px;top:7px;width:2px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:7px;top:7px;width:2px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:9px;top:7px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:3px;top:8px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:4px;top:8px;width:4px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:8px;top:8px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:4px;top:9px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:5px;top:9px;width:2px;" class="icoTick-color2"></i><i style="position:absolute;height:1px;overflow:hidden;left:7px;top:9px;width:1px;" class="icoTick-color1"></i><i style="position:absolute;height:1px;overflow:hidden;left:5px;top:10px;width:2px;" class="icoTick-color1"></i></b>
										</div>
									</div> -->
								</form>
							</div>
							<b class="ico ico-arr tab-panel-locat"></b>
							<span class="shadow shadow-bottom">&nbsp;</span>
							<span class="shadow shadow-top">&nbsp;</span>
							<span class="shadow shadow-left">&nbsp;</span>
							<span class="shadow shadow-right">&nbsp;</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 底 -->
			<div class="copyright">
				<div class="inner">
					<h2 class="copy-title">底部版权</h2>
					<ul class="copy-list">
						<!-- <li class="copy-item"><a href="http://corp.coolinc.cn/index_gb.html" target="_blank">关于XXX</a></li>
						<li class="copy-item"><a href="http://mail.coolinc.cn/html/mail_intro" target="_blank">关于XXX免费邮</a></li> -->
						<li class="copy-item"><!-- <span class="sptln">|</span> -->公司版权所有 ©2013 coolinc.cn All CopyRights Reserved</li>
						<li class="copy-item"><a href="${ctx}/locale?locale=zh_CN" target="_self">[简体中文]</a></li>
						<li class="copy-item"><a href="${ctx}/locale?locale=en_US" target="_self">[English]</a></li>
					</ul>
				</div>
				<div class="bg"></div>
			</div>
			<!-- 背景 -->
		</div>
		<!-- Devilfish -->
		<script type="text/javascript">
		function $id(option){
			return document.getElementById(option);
		}
		
		var gWindow = {};
		// 获取窗口宽高
		function fCalc(){
			gWindow.width = typeof window.innerWidth == "undefined" ? document.documentElement.clientWidth : window.innerWidth;
			gWindow.height = typeof window.innerHeight == "undefined" ? document.documentElement.clientHeight : window.innerHeight;
			// 窗口最小高度不能小于435像素
			gWindow.height = gWindow.height <= 435 ? 435 : gWindow.height;
		}
		fCalc();
		// 背景图上下左右居中
		function fChangeBg(){
			var oBgImg = $id("themeImg");
			var nImgHeight = oBgImg.height;
			var nImgWidth = oBgImg.width;
			if(typeof gWindow.height == "undefined"){
				fCalc();
			}
			oBgImg.style.top = (gWindow.height - nImgHeight)/2 + "px";
			oBgImg.style.left =  (gWindow.width - nImgWidth)/2 + "px";
		}
		
		function loginSubmit(){
			/* if(!isCaptcha()){
				alert("验证码错误，请重新输入！");
				captcha();
				return false;
			} */
			return true;
		}
		
		window.onresize = function(){
			fCalc();
			fChangeBg();
		}
		$(document).ready(function(){
			$('input').placeholder();
		});
		</script>
</html>