<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>  
<html>  
<head>  
<c:import url="/admin/resource.jsp"/>
</head>  
<body class="easyui-layout">  
		<div data-options="region:'north'" style="height:76px;border: 0;">
			<table width="100%">
				<tbody>
					<tr height="40">
						<td class="logo">系统管理后台</td>
						<td align="right">
						       <a href="javascript:void(0);" class="easyui-menubutton" menu="#user-center-menu" iconCls="icon-user">${staff.name}</a>
						       <a href="javascript:void(0);" class="easyui-menubutton" menu="#theme-menu" iconCls="icon-theme"><f:message key="L_ADMIN_006"/></a>
						       <a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-logout'" onclick="L.logout('${ctx}');"><f:message key="L_ADMIN_007"/></a>  
						</td>
					</tr>
					<tr>
						<td class="panel-header"  colspan="2" style="padding: 1px;">
						    ${menu}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
        <div data-options="region:'center'" style="padding: 0 2px 0px 2px;border: 0;">
	 	   <div id="tt" class="easyui-tabs main-tabs" data-options="fit:true,border:false" > 
	 	   		 <div title="默认" data-options="href:'${ctx}/admin/portlet'"></div>
		   </div>  
        </div>
        <div id="user-center-menu" class="easyui-menu" style="width: 100px;">
			<div onclick="L.profile();">个人信息</div>
		    <div onclick="L.change_password();">修改密码</div>
		    <div  onclick="L.logout('${ctx}');">退出</div>
		</div>
        <div id="theme-menu" class="easyui-menu" style="width: 100px;">
		    <div onclick="L.change_theme('${ctx}','default');">default</div>
			<div onclick="L.change_theme('${ctx}','black');">black</div>
			<div onclick="L.change_theme('${ctx}','bootstrap');">bootstrap</div>
			<div onclick="L.change_theme('${ctx}','gray');">gray</div>
			<div onclick="L.change_theme('${ctx}','metro');">metro</div>
		</div>
        <div id="mm" class="easyui-menu" style="width:150px;">
		    <div id="mm-tabclose">关闭标签页</div>
		    <div id="mm-tabcloseother">关闭其他标签页</div>
		    <div class="menu-sep"></div>
		    <div id="mm-tabcloseright">关闭右侧标签页</div>
		    <div id="mm-tabcloseleft">关闭左侧标签页</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:400px;height:200px;padding:10px 20px"  closed="true" buttons="#dlg-buttons">  
		    <form id="fm" method="post">  
			    <table class="dlg-table">
			    	<tbody>
			    		<tr><td class="ltd">旧密码</td><td class="rtd"><input name="password_old"  id="password_old"  type="password" class="easyui-validatebox" required="true"></td></tr>
			    		<tr><td class="ltd">新密码</td><td class="rtd"><input name="password_new"  id="password_new"  type="password" class="easyui-validatebox" required="true"></td></tr>
			    		<tr><td class="ltd">确认新密码</td><td class="rtd"><input name="password_confirm" id="password_confirm"   type="password" class="easyui-validatebox" required="true"></td></tr>
			    	</tbody>
			    </table>
			</form>
		</div>
		<div id="dlg-buttons">  
		    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save()">确定</a>  
		    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close')">取消</a>  
		</div>  
		<script type="text/javascript">
		var url="${ctx}/admin/profile/password";
		L.change_password=function(){  
			$('#dlg').dialog('open').dialog('setTitle','密码修改'); 
			$('#fm').form('clear');
		};
		L.save=function(){
			var p_o=$('#password_old').val();
			var p=$('#password_new').val();
			var p_c=$('#password_confirm').val();
			if(p!=p_c){
				 $.messager.show({  
	                 title: '提示信息',  
	                 msg:"两次新密码输入不一致！" 
	             }); 
				 return false;
			}
		    $('#fm').form('submit',{  
		        url: url,  
		        onSubmit: function(){  
		            return $(this).form('validate');
		        },  
		        success: function(result){  
		            var result = eval('('+result+')');  
		            if (result.success){  
		                $('#dlg').dialog('close');  
		                $.messager.show({  
		                    title: '信息反馈',  
		                    msg: "密码修改成功！" 
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
		</script>
</body>  
</html>  