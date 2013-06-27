<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>  
<html>  
<head>
<c:import url="/admin/resource.jsp"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">  
   <div data-options="region:'west',split:true,border:false,title:'查询'" style="width:225px">
	<form id="fm-query" method="post">  
	<table class="query-table">
	<tbody>
		<tr><td class="ltd">职员</td><td><input name="staffId" class="easyui-combobox"  url="${ctx}/admin/staff/load"  textField='name' valueField='id'></td></tr>
		<tr><td class="ltd">登录日期起</td><td><input name="loginDateFrom" class="easyui-datebox"  editable="false"></td></tr>
		<tr><td class="ltd">登录日期止</td><td><input name="loginDateTo"   class="easyui-datebox"  editable="false"></td></tr>
		<tr class="operate">
			<td colspan="2">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="false" onclick="query()"  enabled="function.query">查询</a>  
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="false" onclick="$('#fm-query').form('clear')">重置</a>
            </td>
        </tr>
		</tbody>
	</table>
   	</form>  
   </div>  
   <div data-options="region:'center',split:true,border:false,title:'列表'">
	 <table id="dg" class="easyui-datagrid" 
            data-options="url:'${ctx }/admin/staff-login',singleSelect:true,border:false,collapsible:true,
            fit:true,pagination:true,fitColumns:true,toolbar:'#toolbar',rownumbers:true">  
        <thead>  
	        <tr>  
				<th field="id" hidden="true">ID</th>
				<th field="staffName" width="50">职员</th>
				<th field="staffId" width="50" hidden="true">职员ID</th>
				<th field="loginIp" width="50">登录IP</th>
				<th field="loginDate" width="50">登录日期</th>
	        </tr>  
	    </thead>  
    </table>  
	</div>  
</div>
<script type="text/javascript">
	var url="${ctx}/admin/staff-login";
	function query(){ 
		   var params=$('#fm-query').serializeObject();
		   $('#dg').datagrid({url:url,queryParams:params,pageNumber:1});
	}
	</script>
</body>
</html>
