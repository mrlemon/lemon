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
   <div data-options="region:'west',split:true,border:false,title:'菜单树'" style="width:200px">
	<ul id="tt" class="easyui-tree"
					url="${ctx}/admin/menu"
					animate="true"
					checkbox="false">
	</ul>
	</div>  
   <div data-options="region:'center',split:true,border:false,title:'菜单信息'">
        <div id="toolbar" class="datagrid-toolbar ">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="L.add()" enabled="function.add">新增</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="L.remove()"  enabled="function.delete">删除</a>  
			</div>  
			<form id="fm" method="post" style="width:400px;height:280px;padding:10px 20px" > 
			 <table class="dlg-table">
	        	<tbody>
	        		<tr><td class="ltd">菜单名称:</td><td class="rtd"><input id="name" name="name" class="easyui-validatebox" required="true"></td></tr>
	        		<tr><td class="ltd">菜单连接:</td><td class="rtd"><input id="url" name="url" class="easyui-validatebox"></td></tr>
	        		<tr><td class="ltd">连接框架:</td>
	        			<td class="rtd">
	        			  <select id="target" name="target" class="easyui-combobox"  style="width:204px;">
							<option value=""></option>
							<option value="_blank">_blank</option>
							<option value="_self">_self</option>
							<option value="_parent">_parent</option>
							<option value="_top">_top</option>
						 </select>
	        			</td>
	        		</tr> 
	        		<tr><td class="ltd">同级顺序:</td><td class="rtd"><input id="seq" name="seq" class="easyui-numberbox" min="0" max="1000"></td></tr> 
	        		<tr><td class="ltd">是否可用:</td>
		        		<td class="rtd">
		        		 <select id="enable" class="easyui-combobox" name="enable" style="width:204px;" required="true">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
		        		</td>
	        		</tr> 
	        		<tr><td class="ltd">上级菜单:</td><td class="rtd"><input id="pid" name="pid" class="easyui-combotree" url="${ctx}/admin/menu" value=""  style="width:204px;"></td></tr> 
	        		<tr><td class="ltd"></td><td class="rtd"><a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save()">确定</a><input id="id" name="id" type="hidden"></td></tr> 
	        	</tbody>
	        </table>
	    	</form> 
        
	</div>  
</div>
<script type="text/javascript">
	var url="${ctx}/admin/menu";
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
			$('#enable').combobox('setValue','1');
	    }
	};
	
	L.edit=function (){  
		var node = $('#tt').tree('getSelected');
		if(node){
			if(node.id==0)
				return;
			$("#id").val(node.id);
			$("#name").val(node.text);
			$("#url").val(node.attributes.url);		
			$("#title").val(node.attributes.title);
			$('#target').combobox('setValue',node.attributes.target==null?'':node.attributes.target);
			$('#seq').numberbox('setValue',node.attributes.seq); 
			$('#enable').combobox('setValue',node.attributes.enable==null?1:node.attributes.enable);
			$('#pid').combotree('setValue',node.attributes.pid); 
		}
	};
	
	L.save=function (){  
	    $('#fm').form('submit',{  
	        url: url+"/save",  
	        onSubmit: function(){  
	        	if(!L.ckeckParentIsChild()){
	        		return false;
	        	};
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
	L.remove=function (){  
		var node = $('#tt').tree('getSelected');
		var nodes = $('#tt').tree('getChildren',node.target);
	    if (node){  
	    	if(nodes.length>0){
	    		 $.messager.alert('提示框','有子菜单,不允许删除！',"warning");
	    		 return false;
	    	}
	        $.messager.confirm('消息框','确定要删除吗?',function(r){  
	            if (r){  
	                $.post(url+'/delete',{id:node.id},function(result){  
	                    if (result.success){  
	                    	$('#tt').tree('reload');    // reload the user data  
	                    	 $.messager.show({
	                             title: '信息反馈',  
	                             msg: '操作成功！'  
	                         });
	                    } else {  
	                        $.messager.show({   // show error message  
	                            title: '信息反馈',  
	                            msg: result.msg  
	                        });  
	                    }  
	                },'json');  
	            }  
	        });  
	    }  
	};
	
	//死循环检查
	L.ckeckParentIsChild=function (){
		var cnode_id = $('#id').val();
		if(cnode_id){
			var tree=$('#pid').combotree('tree');
			var pnode=$(tree).tree('getSelected');
			if(pnode){
				try{
					var path=pnode.attributes.path;
					if(path.indexOf('/'+cnode_id+'/')>-1){
						 $.messager.show({  
			                    title: '信息反馈',  
			                    msg: "[上级菜单]不允许设为自己或自己的子类型"
			               });  
						 return false;
					}
				}catch(e){
					
				}
				return true;
			}
		}
		//新增，不检查
		return true;
	};
	</script>
</body>
</html>
