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
					<tr><td class="ltd">姓名</td><td><input name="name"></td></tr>
					<tr class="operate">
					<td colspan="2">
						<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="false" onclick="query()"  enabled="function.query">查询</a>  
		            	<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="false" onclick="$('#fm-query').form('clear')"  enabled="function.query">重置</a>
		            </td>
		        </tr>
				</tbody>
			</table>
			</form>
   </div>  
   <div data-options="region:'center',split:true,border:false,title:'列表'">
  		 <table id="dg" title="" class="easyui-datagrid frame-datagrid"
			        url="${ctx}/admin/staff"  
			        toolbar="#toolbar"  
			        rownumbers="true" fitColumns="true" singleSelect="true"  pagination="true" data-options="border:false,fit:true">
			    <thead>  
			        <tr>  
						<th field="name" width="50">姓名</th>
						<th field="id" width="50" formatter="grantFormat">授权</th>
			        </tr>  
			    </thead>  
			</table>
			<div id="toolbar">
			    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()"  enabled="function.edit">授权</a>
			</div>  
   </div>
</div>

	<div id="dlg" class="easyui-dialog" style="width:350px;height:410px;padding:5px 5px"
	        closed="true" buttons="#dlg-buttons">  
	    <form id="fm" method="post">  
	        <div class="fitem" style="display: none;">  
	            <label>ID:</label>  
	            <input name="id"  style="width:200px;">  
	        </div>  
	        <div style="width: 250px; height: 300px;">
				<ul id="tt" class="easyui-tree"
						url=""
						animate="true"
						checkbox="true">
				</ul>
			</div>
	    </form>  
	</div>  
	<div id="dlg-buttons">  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">确定</a>  
	    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
	</div>  
	<input type="button" id="test" value="test-tab">
	<script type="text/javascript">
	var url="${ctx}/admin/role-staff";
	function edit(){  
		var row = $('#dg').datagrid('getSelected');  
		if (row){  
		    $('#tt').tree({  
			    url:url+"/load-role?id="+row.id, 
			});
		    $('#dlg').dialog('open').dialog('setTitle','选择角色');  
		    $('#fm').form('load',row);  
		}
	}
	function save(){  
    	var role = $('#tt').tree('getSelected');
	    $('#fm').form('submit',{  
	        url: url+"/save",  
	        onSubmit: function(){  
	    		var nodes = $('#tt').tree('getChecked');
	    		for(var i=0;i<nodes.length;i++){
	    		   $("<input type='hidden' class='roleId' name='roleId' value='"+nodes[i].id+"'>").appendTo("#fm");
	    		}
	    		return;
	        },  
	        success: function(result){  
	        	 $(".roleId").remove();
		       	 $('#tt').tree('reload');
	             $('#dlg').dialog('close');   
	            var result = eval('('+result+')');  
	            if (result.success){  
	            	 $.messager.show({
                         title: '信息反馈',  
                         msg: '操作成功！'  
                     });
	            } else {  
	                $.messager.show({  
	                    title: '信息反馈',  
	                    msg: result.msg  
	                });  
	            }  
	        }  
	    });  
	}  
	
	function grantFormat(val,row){
		if(val=="")
			return "";
		 else
		 	return "<a href=\"javascript:edit()\">选择角色</span>";  
	}
	
	function query(){ 
	   var params=$('#fm-query').serializeObject();
	   $('#dg').datagrid({url:"${ctx}/admin/staff",queryParams:params,pageNumber:1});
	}
	
</script>
</body>
</html>
