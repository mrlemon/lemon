<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=1000" />
<title>管理后台登陆错误信息</title>
<style type="text/css">
.error {
	width: 100%;
	height: 26px;
	line-height: 26px;
	margin: 0 auto;
	background: #F8F8F8;
	border: 1px #E6E6E6 solid;
	font-size: 14px;
	padding: 15px 60px;
	font-family: "宋体";
	background: url("/static/images/failure.png") no-repeat 0 5px;
}
</style>
</head>
<body>
	<table cellpadding="0" cellspacing="0" border="0" class="error">
		<tr>
			<td><span id="msg">${text}</span><a href="/admin/login" style="color: blue;">[返回]</a></td>
		</tr>
	</table>
</body>
</html>
