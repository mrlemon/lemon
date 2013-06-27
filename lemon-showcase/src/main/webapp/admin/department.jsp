<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>  
<html>  
<head>
<c:import url="/admin/resource.jsp"/>
</head>
<body style="border: 0;margin: 0;">
<div class="easyui-layout" data-options="fit:true">  
   <div data-options="region:'west',split:true,border:false,title:'部门'" style="width:200px">
	<ul id="tt" class="easyui-tree" url="${ctx}/admin/department" checkbox="false"></ul>
   </div>  
   <div data-options="region:'center',split:true,border:false,title:'部门信息'">
    			<div id="toolbar" class="datagrid-toolbar ">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="L.add()" enabled="function.add">新增</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="L.remove()"  enabled="function.delete">删除</a>  
			</div>  
			<form id="fm" method="post" style="width:400px;height:280px;padding:10px 20px" > 
				<table class="dlg-table">
		        	<tbody>
		        		<tr><td class="ltd">部门名称:</td><td class="rtd"><input id="name" name="name" class="easyui-validatebox" required="true"></td></tr>
		        		<tr><td class="ltd">同级顺序:</td><td class="rtd"><input id="seq" name="seq" class="easyui-numberbox" min="0" max="1000"></td></tr>
		        		<tr><td class="ltd">上级节点:</td><td class="rtd"><input id="pid" name="pid" class="easyui-combotree" url="${ctx }/admin/department" value="" style="width:204px;"></td></tr>
		        		<tr><td class="ltd">说明:</td><td class="rtd"><textarea id="description" name="description" style="width: 198px;height: 50px;"></textarea></td></tr>
		        		<tr><td class="ltd"></td><td class="rtd"><a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save()">确定</a><input id="id" name="id" type="hidden"> </td></tr>
		        	</tbody>
		        </table>
	    	</form> 
	</div>  
</div>
<script type="text/javascript">
	var url="${ctx}/admin/department";
	$(function(){
		$('#tt').tree({
			onClick:function(node){
				L.edit();
			}
		});
	});
	
	L.add=function (){  
	    $('#fm').form('clear');  
	    var node = $('#tt').tree('getSelected');
	    if(node){
			$('#pid').combotree('setValue',node.id);
	    }
	};
	
	L.edit=function(){  
		var node = $('#tt').tree('getSelected');
		if(node){
			if(node.id==0)
				return;
			$("#id").val(node.id);
			$("#name").val(node.text);
			$("#seq").val(node.attributes.seq);	
			$("#description").val(node.attributes.description);	
			$('#pid').combotree('setValue',node.attributes.pid); 
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
	            	 $('#tt').tree('reload');
	                 $('#fm').form('clear');  
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
	};
	
	L.remove=function(){  
		var node = $('#tt').tree('getSelected');
	    if (node){  
	        $.messager.confirm('消息框','确定要删除吗?',function(r){  
	            if (r){  
	                $.post(url+'/delete',{id:node.id},function(result){  
	                    if (result.success){  
	                    	$('#tt').tree('reload');  
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
	                },'json');  
	            }  
	        });  
	    }  
	};
	</script>
</body>
</html>
