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
 			<form id="fm-type-query" method="post">  
			<table>
				<tbody>
					<tr><td>类型编码</td><td><input name="code" class="easyui-validatebox"></td><td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="false" onclick="query_type()"  enabled="function.query">查询</a></td></tr>
					<tr><td>类型名称</td><td><input name="name" class="easyui-validatebox"></td><td><a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="false" onclick="$('#fm-type-query').form('clear')"  enabled="function.query">重置</a></td></tr>
				</tbody>
			</table>
	    	</form>  
	    	<table id="dg-type" title="" class="easyui-datagrid frame-datagrid"
			        url="${ctx}/admin/code-type"  
			        toolbar="#toolbar-type"  
			        data-options="border:false"
			        rownumbers="true" fitColumns="true" singleSelect="true"  pagination="true">  
			    <thead>  
			        <tr>  
						<th field="id" width="100"  editor="text" hidden="true">ID</th>
						<th field="code" width="100" editor="{type:'validatebox',options:{required:true}}">类型编码</th>
						<th field="name" width="100" editor="{type:'validatebox',options:{required:true}}">类型名称</th>
						<th field="seq" width="100" editor="{type:'text'}"  hidden="true" >顺序</th>
						<th field="description" width="100" editor="{type:'text'}"  hidden="true" >说明</th>
			        </tr>  
			    </thead>  
			</table>  
			<div id="toolbar-type">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg-type').edatagrid('addRow')" enabled="function.add">新增</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:dg_type_remove()"  enabled="function.delete">删除</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg-type').edatagrid('saveRow')">保存</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg-type').edatagrid('cancelRow')">撤销</a>
			</div>  
	</div>  
   <div data-options="region:'center',split:true,border:false">
   			<table id="dg" title="" class="easyui-datagrid frame-datagrid"
			        toolbar="#toolbar"  data-options="fit:true,border:false"
			        rownumbers="true" fitColumns="true" singleSelect="true"  pagination="true">  
			    <thead>  
			        <tr>  
						<th field="id" width="100" hidden="true">ID</th>
						<th field="type" width="100" editor="{type:'codeType'}" hidden="true">类型</th>
						<th field="code" width="100" editor="{type:'validatebox',options:{required:true}}">编码</th>
						<th field="name" width="100" editor="{type:'validatebox',options:{required:true}}">名称</th>
						<th field="value" width="100" editor="{type:'validatebox',options:{required:true}}">值</th>
						<th field="enable" width="100" formatter="booleanFormat" editor="{type:'combobox',options:{required:true,textField:'text',valueField:'id',editable:false,panelHeight:'auto',data:[{id:1,text:'是'},{id:0,text:'否'}]}}">是否可用</th>
						<th field="description" width="100" editor="{type:'validatebox'}"  formatter="titleFormat">说明</th>
						<th field="seq" width="100"  editor="{type:'numberbox'}">顺序</th>
			        </tr>  
			    </thead>  
			</table>  
			<div id="toolbar">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="dg_addRow()" enabled="function.add">新增</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')"  enabled="function.delete">删除</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">保存</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销</a>
			</div>  
	</div>  
</div>
<script type="text/javascript">
  	var url="${ctx}/admin/code";
  	var url_type="${ctx}/admin/code-type";
  	function dg_type_remove(){  
	    var row = $('#dg-type').datagrid('getSelected');  
	    if (row){  
	        $.messager.confirm('消息框','确定要删除吗?',function(r){  
	            if (r){  
	                $.post(url_type+'/delete',{id:row.id},function(result){  
	                    if (result.success){  
	                        $('#dg-type').datagrid('load');  
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
	
	function query_type(){ 
		try{
		   var params=$('#fm-type-query').serializeObject();
		   $('#dg-type').datagrid({url:url_type,queryParams:params});

			//重定义#dg-type pagination
			var pager=$('#dg-type').datagrid('getPager');
			$(pager).pagination({
				displayMsg:""
			});
		}catch(err){
			$.messager.show({ title: '信息反馈',msg:'查询失败，请联系管理员！'});
		}
	}
	
	$(document).ready(function(){
		$('#dg-type').edatagrid({
			url:url_type,  
		    saveUrl:url_type+'/save',  
		    updateUrl:url_type+'/save',  
		    destroyUrl:url_type+'/delete',		    		
			onClickRow:function(rowIndex,rowData){
				$('#dg').datagrid('load',{
					type:rowData.id
				});
			},
			onSave:function(index,row){
				$('#dg-type').datagrid('load');
			}
		});
		
		//重定义#dg-type pagination
		var pager=$('#dg-type').datagrid('getPager');
		$(pager).pagination({
			displayMsg:""
		});
		
		$('#dg').edatagrid({
			url:url,  
		    saveUrl:url+'/save',  
		    updateUrl:url+'/save',  
		    destroyUrl:url+'/delete',	
		});
		
	});
	
	function codeTypeFormat(val,row){
		var valueField='id';
		var textField='name';
		var result="";
		var data=document.codeTypeData;
		if(!data){
			$.ajax({
				url:'/admin/code-type/loadAll',
				success:function(res){
					data=eval('('+res+')');
					document.codeTypeData=data;
				},
				async:false
			});
		}
		for(var i=0;i<data.length;i++){
			var  obj=data[i];
			if(obj[valueField]==val){
				result=obj[textField];
				break;
			}
		}
		return result;
	}
	
	function dg_addRow(){
		var row = $('#dg-type').datagrid('getSelected');  
		if (row){  
			$('#dg').edatagrid('addRow');
		}else{
       		$.messager.show({
                title: '信息反馈',  
                msg:"请先选中左边类型的一项，再新增！"
            }); 
		}
	}
	
	$.extend($.fn.datagrid.defaults.editors, {
		codeType: {
			init : function(container, options) {
				var row=$('#dg-type').datagrid('getSelected');
				var val=row.id;
				var text = $("<input type='text' value='"+val+"'>").appendTo(container);	
				return text;
			},
			getValue : function(target) {
				return $(target).val();
			},
			setValue : function(target, value) {
				if(value){
					$(target).val(value);
				}else{
					$(target).text('setValue',value);
				}
			},
			resize : function(target, width) {
				$(target)._outerWidth(width);
			}
		}
	});
	</script>
</body>
</html>
