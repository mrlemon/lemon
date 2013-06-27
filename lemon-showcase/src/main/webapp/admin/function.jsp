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
					<tr><td>功能名称:</td><td><input name="name"></td></tr>
					<tr class="operate">
					<td colspan="2">
						<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="false" onclick="L.query()"  enabled="function.query">查询</a>
			            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="false" onclick="$('#fm-query').form('clear')"  enabled="function.query">重置</a>
					</td></tr>
				</tbody>
			</table>
	 </form>  
   </div>  
   <div data-options="region:'center',split:true,border:false,title:'列表'">
	 <table id="dg" class="easyui-datagrid" 
             data-options="
             url:'${ctx }/admin/function',
             toolbar:'#toolbar',
             singleSelect:true,border:false,collapsible:true,
            fit:true,pagination:true,fitColumns:true,rownumbers:true">
	    <thead>  
	        <tr>  
				<th field="id" width="30" hidden="true">ID</th>
				<th field="code" width="100">编码</th>
				<th field="name" width="100">名称</th>
				<th field="description" width="100">角色描述</th>
	        </tr>  
	    </thead>  
	</table>  
	<div id="toolbar">  
	    <a href="#" class="easyui-linkbutton priv-add" iconCls="icon-add" plain="true" onclick="L.add()" enabled="function.add">新增</a>  
	   <a href="#" class="easyui-linkbutton priv-edit" iconCls="icon-edit" plain="true" onclick="L.edit()"  enabled="function.edit">编辑</a>  
	   <a href="#" class="easyui-linkbutton priv-remove" iconCls="icon-remove" plain="true" onclick="L.remove()"  enabled="function.delete">删除</a>  
	</div>  
	</div>  
</div>
<div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding:10px 20px"  
	        closed="true" buttons="#dlg-buttons">  
	  <form id="fm" method="post">  
	      <table class="dlg-table">
        	<tbody>
        		<tr><td class="ltd">编码:</td><td class="rtd"><input name="code" class="easyui-validatebox" required="true"> </td></tr>
        		<tr><td class="ltd">名称:</td><td class="rtd"><input name="name" class="easyui-validatebox" required="true"></td></tr>
        		<tr><td class="ltd">描述:</td><td class="rtd"><input name="description" class="easyui-validatebox"> </td></tr> 
        	</tbody>
        </table>
        <input name="id" type="hidden">  
       </form>
	</div>  
	<div id="dlg-buttons">  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save()">确定</a>  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
	</div>  
	<script type="text/javascript">
	var url="${ctx}/admin/function";
	L.add=function (){  
	    $('#dlg').dialog('open').dialog('setTitle','新增');  
	    $('#fm').form('clear');  
	};
	
	L.edit=function(){  
		var row = $('#dg').datagrid('getSelected');  
		if (row){  
		    $('#dlg').dialog('open').dialog('setTitle','编辑');  
		    $('#fm').form('load',row);  
		}  
	};
	
	
	L.save=function(){  
	    $('#fm').form('submit',{  
	        url: url+"/save",  
	        onSubmit: function(){  
	            return $(this).form('validate');  
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#dlg').dialog('close');  
	                $('#dg').datagrid('load');  
	            } else {  
	                $.messager.show({  
	                    title: '信息反馈',  
	                    msg: result.msg  
	                });  
	            }  
	        }  
	    });  
	};
	
	L.remove=function(){  
	    var row = $('#dg').datagrid('getSelected');  
	    if (row){  
	        $.messager.confirm('消息框','确定要删除吗?',function(r){  
	            if (r){  
	                $.post(url+'/delete',{id:row.id},function(result){  
	                    if (result.success){  
	                        $('#dg').datagrid('load');  
	                    } else {  
	                        $.messager.show({  
	                            title: '信息反馈',  
	                            msg: result.msg  
	                        });  
	                    }  
	                },'json');  
	            }  
	        });  
	    }  
	};
	
	L.query=function(){
	   var params=$('#fm-query').serializeObject();
	   $('#dg').datagrid({url:url,queryParams:params,pageNumber:1});
	};
	</script>
</body>
</html>
