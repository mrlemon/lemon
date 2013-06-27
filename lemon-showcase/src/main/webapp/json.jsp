<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="" />
<meta name="description" content=""/>
<script type="text/javascript" src="/static/js/jquery/1.8.0/jquery.min.js"></script>
</head>
<body>
<a href="javascript:;" onclick="test()">test</a>
<script type="text/javascript">
 $.ajaxSetup({ //设置ajax请求全局默认设置
	async : true,
	error : function(jqXHR, textStatus, errorThrown){
	var msg = $.parseJSON(jqXHR.responseText).msg;
		alert(msg);
	},
	traditional : true,
	dataType : "json",
	type : "POST"
}); 

/* $.ajax({ //请求将成功
	url: "/foo",
	data: {name: "you param"},
	dataType : "json",
	type : "POST",
	success: function(data){
	alert("请求发送成功，返回数据：" + data.name);
	}
	}); */
	
/* $.ajax({ //请求将失败，弹出人性化的错误信息
	url: "/err",
	dataType : "json",
	type : "POST",
	success: function(data){
	alert("请求发送成功，返回数据：" + data.success);
	}
	}); */
	
		
	$.getJSON("/bar",function(data) {
		alert(data);
	 });

</script>

</body>
</html>