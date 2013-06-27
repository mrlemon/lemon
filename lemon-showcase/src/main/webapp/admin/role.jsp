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
   <div data-options="region:'west',split:true,border:false,title:'角色'" style="width:350px">
 			<form id="fm" method="post" style="padding: 5px;">  
			<table class="query-table">
			<tbody>
				<tr><td>角色编码:</td><td> <input name="code" class="easyui-validatebox" autocomplete="off"></td><td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="false" onclick="query()"  enabled="function.query">查询</a></td></tr>
				<tr><td>角色名称:</td><td> <input name="name" class="easyui-validatebox" autocomplete="off"></td><td><a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="false" onclick="$('#fm').form('clear')"  enabled="function.query">重置</a></td></tr>
				</tbody>
			</table>
   			</form>
		 	<table id="dg" class="easyui-datagrid" 
	            data-options="singleSelect:true,border:false,collapsible:true,
	            pagination:true,fitColumns:true,toolbar:'#toolbar',rownumbers:true"> 
	    	<thead>  
	        <tr>  
				<th field="id" width="100"  editor="text" hidden="true">角色ID</th>
				<th field="code" width="100"  editor="{type:'validatebox',options:{required:true}}">角色编码</th>
				<th field="name" width="100"  editor="{type:'validatebox',options:{required:true}}">角色名称</th>
	        </tr>  
		    </thead>  
			</table>  
			<div id="toolbar">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')" enabled="function.add">新增</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:dg_remove()"  enabled="function.delete">删除</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">保存</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销</a>
			</div>  
	</div>  
   <div data-options="region:'center',split:true,border:false">
   	<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
			    <div title="菜单权限" class="ti">
			    	<div id="buttoms-menu" class="datagrid-toolbar">  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save_menu()" enabled="function.add">保存</a>  
					</div>  
			    	<div id="p" class="easyui-panel"  style="height: 430px;border: 0px;">  
				        <form id="fm-tt" method="post">
					        <input type="hidden" name="role_id" id="roleId_menu">
							<ul id="tt" class="easyui-tree" checkbox="true" lines="true" cascadeCheck="true"></ul>
						</form>
					</div>
			    </div>
			    <div title="功能权限" class="ti">
			    	<form id="fm-func" method="post">  
			    	<input type="hidden" name="role_id" id="roleId_func">
					<table id="dg-func"  class="easyui-datagrid"  
					toolbar="#toolbar-func"
					url="${ctx}/admin/function/all" rownumbers="true" fitColumns="false" 
					singleSelect="false"  pagination="false" data-options="border:false"  >  
					    <thead>  
					        <tr>  
								<th field="ck" checkbox="true"></th>
								<th field="id" width="50" hidden="true">功能ID</th>
								<th field="code" width="150">功能编码</th>
								<th field="name" width="150">功能名称</th>
								<th field="description" width="250">功能说明</th>
					        </tr>  
					    </thead>  
					</table>  
					</form>
					<div id="toolbar-func">  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save_func()">保存</a>  
					</div>  
			    </div>
		    </div> 
 
	</div>  
</div>
<script type="text/javascript">
var url="${ctx}/admin/role";
$(document).ready(function(){
	$('#dg').edatagrid({
		url:url,  
	    saveUrl:url+'/save',  
	    updateUrl:url+'/save',  
	    destroyUrl:url+'/delete',		    		
		onClickRow:function(rowIndex,row){
			$('#tt').tree({url:"${ctx}/admin/role-res/load-menu?role_id="+row.id});
			$('#roleId_func').val(row.id);
			$('#roleId_menu').val(row.id);
			var data_url="${ctx}/admin/role-res/load-func?role_id="+row.id;
			var rows=$('#dg-func').datagrid('unselectAll');
			$.post(data_url,function(data){
				var funcs=eval('('+data+')');
				var rows=$('#dg-func').datagrid('getRows');
		 		for(var i=0;i<rows.length;i++){
		 			for(var j=0;j<funcs.length;j++){
		 				if(funcs[j].resId==rows[i].id){
							$('#dg-func').datagrid('selectRow',i);
		 				}
		 			}
				}
			});
		},
		onSave:function(index,row){
			$('#dg').datagrid('load');
		}
	});
	
	//重定义#dg pagination
	var pager=$('#dg').datagrid('getPager');
	$(pager).pagination({
		displayMsg:""
	});
});

 function dg_remove(){  
    var row = $('#dg').datagrid('getSelected');  
    if (row){  
        $.messager.confirm('消息框','确定要删除吗?',function(r){  
            if (r){  
                $.post(url+'/delete',{id:row.id},function(result){  
                    if (result.success){  
                        $('#dg').datagrid('load');  
                        $('#roleId_func').val("");
                        $('#roleId_menu').val("");
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
}

function query(){ 
   var params=$('#fm').serializeObject();
   $('#dg').datagrid({url:url,queryParams:params,pageNumber:1});
}

function save_menu(){  
	var v=$('#roleId_menu').val();
	if(v==null||v==''||v==undefined){
		 $.messager.show({
             title: '信息反馈',  
             msg: '请在左边选择一个角色！'  
         });
		 return;
	}
	var url="${ctx}/admin/role-res";
    $('#fm-tt').form('submit',{  
        url: url+"/save_menu",  
        onSubmit: function(){  
    		var nodes = $('#tt').tree('getChecked');
    		for(var i=0;i<nodes.length;i++){
    		   $("<input type='hidden' class='menuId' name='menuId' value='"+nodes[i].id+"'>").appendTo("#fm-tt");
    		}
    		return;
        },  
        success: function(result){  
        	$(".menuId").remove();
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

function save_func(){  
	var v=$('#roleId_func').val();
	if(v==null||v==''||v==undefined){
		 $.messager.show({
             title: '信息反馈',  
             msg: '请在左边选择一个角色！'  
         });
		 return;
	}
	var url="${ctx}/admin/role-res";
    $('#fm-func').form('submit',{  
        url: url+"/save_func",  
        onSubmit: function(){  
    		var rows=$('#dg-func').datagrid('getSelections');
    		for(var i=0;i<rows.length;i++){
    		   $("<input type='hidden' class='funcId' name='funcId' value='"+rows[i].id+"'>").appendTo("#fm-func");
    		}
    		return;
        },  
        success: function(result){  
        	$(".funcId").remove();
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
</script>
</body>
</html>
