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
				<tr><td class="ltd">姓名:</td><td><input name="name"></td></tr>
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
            data-options="url:'${ctx}/admin/staff',singleSelect:true,border:false,collapsible:true,
            fit:true,pagination:true,fitColumns:true,toolbar:'#toolbar',rownumbers:true">  
			    <thead>  
			        <tr>  
						<th field="id" hidden="true">ID</th>
						<th field="name" width="50">姓名</th>
						<th field="loginName" width="50">登录名</th>
						<th field="yearEntry" width="50">入职年份</th>
						<th field="deptid" hidden="true">部门</th>
						<th field="positionId" width="50">岗位</th>
						<th field="sex" width="50" formatter="sexFormat">性别</th>
						<th field="birthday" width="50">生日</th>
						<th field="mobile" width="50">手机</th>
						<th field="education" width="50">教育程度</th>
						<th field="nation" hidden="true">民族</th>
						<th field="marital" hidden="true">婚否</th>
						<th field="household"  hidden="true">籍贯</th>
						<th field="profession" hidden="true">专业</th>
						<th field="address" hidden="true">联系地址</th>
						<th field="email" hidden="true">邮箱</th>
						<th field="idCard" hidden="true">身份证号码</th>
						<th field="status" width="50"  formatter="jobStatusFormat">在职状态</th>
						<th field="enabled" width="50" formatter="enabledFormat">可用</th>
						<th field="resume" hidden="true">简历信息</th>
						<th field="evaluation" hidden="true">个人自评</th>
			        </tr>  
			    </thead>  
			</table>
			<div id="toolbar">
			    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="L.add()" enabled="function.add">新增</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="L.edit()"  enabled="function.edit">编辑</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="L.remove()"  enabled="function.delete">删除</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="L.edit_password()"  enabled="function.edit.password">修改密码</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="L.enabled()"  enabled="function.edit">启用/禁用</a>
			</div>  
			<div id="dlg" class="easyui-dialog" style="width:800px;height:500px;padding: 10px;" closed="true" buttons="#dlg-buttons">
			<form id="fm" method="post">    
		        <table class="dlg-table" style="width:746px;">
		        	<tbody>
		        		<tr>
		        			<td>
		        				<table>
					        		<tbody>
					        		<tr><td class="ltd">登录名:</td><td class="rtd"><input name="loginName" class="easyui-validatebox" required="true"><input name="id" type="hidden"></td></tr>
					        		<tr><td class="ltd">姓名:</td><td class="rtd"><input name="name" class="easyui-validatebox" required="true">  </td></tr>
					        		<tr><td class="ltd">性别:</td><td class="rtd"><select name="sex" class="easyui-combobox"  style="width:202px;"><option value="">- 请选择 -</option><option value="1">男</option><option value="0">女</option></select></td></tr>
					        		<tr><td class="ltd">出生日期:</td><td class="rtd"><input name="birthday" onClick="WdatePicker()"></td></tr>
					        		<tr><td class="ltd">身份证号码:</td><td class="rtd"><input name="idCard"></td></tr>
					        		<tr><td class="ltd">籍贯:</td><td  class="rtd"><input name="household"></td></tr>
					        		<tr><td class="ltd">民族:</td>
					        			<td class="rtd">
					        			<select id="nation" name="nation"  class="easyui-combobox"  style="width:202px;">
											<option value="">- 请选择 -</option>
											<option value="汉族">汉族</option>
											<option value="蒙古族">蒙古族</option>
											<option value="满族">满族</option>
											<option value="回族">回族</option>
											<option value="藏族">藏族</option>
											<option value="维吾尔族">维吾尔族</option>
											<option value="壮族">壮族</option>
											<option value="苗族">苗族</option>
											<option value="彝族">彝族</option>
											<option value="朝鲜族">朝鲜族</option>
											<option value="布依族">布依族</option>
											<option value="侗族">侗族</option>
											<option value="瑶族">瑶族</option>
											<option value="白族">白族</option>
											<option value="土家族">土家族</option>
											<option value="哈尼族">哈尼族</option>
											<option value="哈萨克族">哈萨克族</option>
											<option value="傣族">傣族</option>
											<option value="黎族">黎族</option>
											<option value="傈僳族">傈僳族</option>
											<option value="佤族">佤族</option>
											<option value="畲族">畲族</option>
											<option value="高山族">高山族</option>
											<option value="拉祜族">拉祜族</option>
											<option value="水族">水族</option>
											<option value="东乡族">东乡族</option>
											<option value="纳西族">纳西族</option>
											<option value="景颇族">景颇族</option>
											<option value="柯尔克孜族">柯尔克孜族</option>
											<option value="土族">土族</option>
											<option value="达斡尔族">达斡尔族</option>
											<option value="仫佬族">仫佬族</option>
											<option value="羌族">羌族</option>
											<option value="布朗族">布朗族</option>
											<option value="撒拉族">撒拉族</option>
											<option value="毛南族">毛南族</option>
											<option value="仡佬族">仡佬族</option>
											<option value="锡伯族">锡伯族</option>
											<option value="阿昌族">阿昌族</option>
											<option value="普米族">普米族</option>
											<option value="塔吉克族">塔吉克族</option>
											<option value="怒族">怒族</option>
											<option value="乌兹别克族">乌兹别克族</option>
											<option value="俄罗斯族">俄罗斯族</option>
											<option value="鄂温克族">鄂温克族</option>
											<option value="德昂族">德昂族</option>
											<option value="保安族">保安族</option>
											<option value="裕固族">裕固族</option>
											<option value="京族">京族</option>
											<option value="塔塔尔族">塔塔尔族</option>
											<option value="独龙族">独龙族</option>
											<option value="鄂伦春族">鄂伦春族</option>
											<option value="赫哲族">赫哲族</option>
											<option value="门巴族">门巴族</option>
											<option value="珞巴族">珞巴族</option>
											<option value="基诺族">基诺族</option>
											<option value="其它">其它</option>
										</select>
					        			</td>
					        		</tr>
					        		<tr><td class="ltd">婚否:</td>
					        			<td class="rtd">
						        			<select name="marital" class="easyui-combobox"  style="width:202px;">
									        	<option value="">- 请选择 -</option>
												<option value="0">未婚</option>
												<option value="1">已婚</option>
											</select>
					        			</td>
					        		</tr>
						        	</tbody>
						        </table>
		        			</td>
		        			<td>
		        				<table>
					        		<tbody>
						        		<tr><td class="ltd">手机号码:</td><td class="rtd"><input name="mobile"></td></tr>
						        		<tr><td class="ltd">邮箱:</td><td class="rtd"> <input name="email"></td></tr>
						        		<tr><td class="ltd">入职年份:</td><td class="rtd"><input name="yearEntry"maxlength="4" ></td></tr>
						        		<tr><td class="ltd">所属部门:</td><td class="rtd"><input id="deptId" name="deptId" class="easyui-combotree" url="${ctx }/admin/department" value=""  style="width:202px;"></td></tr>
						        		<tr><td class="ltd">岗位:</td><td class="rtd"><input name="positionId"></td></tr>
						        		<tr><td class="ltd">教育程度:</td>
						        			<td class="rtd"><select name="education" class="easyui-combobox"  style="width:202px;">
										        	<option value="">- 请选择 -</option>
													<option value="小学">小学</option>
													<option value="初中">初中</option>
													<option value="高中">高中</option>
													<option value="中专">中专</option>
													<option value="专科">专科</option>
													<option value="本科">本科</option>
													<option value="硕士">硕士</option>
													<option value="博士">博士</option>
													<option value="博士后">博士后</option>
												</select>
											</td>
										</tr>
						        		<tr><td class="ltd">专业:</td>
						        			<td class="rtd">
						        				<select name="profession" id="profession" class="easyui-combobox"  style="width:202px;">
													<option value="">- 请选择 -</option>
													<option value="计算机类">计算机类</option>
													<option value="管理类">管理类</option>
													<option value="行政管理">行政管理</option>
													<option value="党政管理">党政管理</option>
													<option value="管理工程类">管理工程类</option>
													<option value="工科">工科</option>
													<option value="机械制造类">机械制造类</option>
													<option value="仪器仪表类">仪器仪表类</option>
													<option value="热工类">热工类</option>
													<option value="电气自动化">电气自动化</option>
													<option value="电子技术">电子技术</option>
													<option value="工业自动化">工业自动化</option>
													<option value="通信类">通信类</option>
													<option value="土建类">土建类</option>
													<option value="化工类">化工类</option>
													<option value="轻工/粮食/食品类">轻工/粮食/食品类</option>
													<option value="纺织类">纺织类</option>
													<option value="运输类">运输类</option>
													<option value="水利类">水利类</option>
													<option value="测绘类">测绘类</option>
													<option value="环境类">环境类</option>
													<option value="原子能类">原子能类</option>
													<option value="应用理科及力学类">应用理科及力学类</option>
													<option value="地质类">地质类</option>
													<option value="矿业类">矿业类</option>
													<option value="冶金类">冶金类</option>
													<option value="材料类">材料类</option>
													<option value="军工类">军工类</option>
													<option value="财经类">财经类</option>
													<option value="政法类">政法类</option>
													<option value="文科类">文科类</option>
													<option value="中国语言文学">中国语言文学</option>
													<option value="外语类">外语类</option>
													<option value="历史类">历史类</option>
													<option value="政治类">政治类</option>
													<option value="哲学类">哲学类</option>
													<option value="图书馆学">图书馆学</option>
													<option value="文科类其他专业">文科类其他专业</option>
													<option value="理科类">理科类</option>
													<option value="数学类">数学类</option>
													<option value="物理学类">物理学类</option>
													<option value="化学类">化学类</option>
													<option value="力学类">力学类</option>
													<option value="地学类">地学类</option>
													<option value="天文学类">天文学类</option>
													<option value="海洋学类">海洋学类</option>
													<option value="生物学类">生物学类</option>
													<option value="理科类其他专业">理科类其他专业</option>
													<option value="医药类">医药类</option>
													<option value="师范">师范</option>
													<option value="农科类">农科类</option>
													<option value="林科类">林科类</option>
													<option value="体育类">体育类</option>
													<option value="艺术">艺术</option>
													<option value="音乐类">音乐类</option>
													<option value="工艺美术类">工艺美术类</option>
													<option value="工业美术类">工业美术类</option>
													<option value="戏剧舞蹈类">戏剧舞蹈类</option>
													<option value="电影电视">电影电视</option>
													<option value="技工类">技工类</option>
													<option value="其他">其他</option>	
												</select>
						        			</td>
						        		</tr>
						        		<tr><td class="ltd">在职状态:</td>
						        			<td class="rtd">
							        			 <select name="status" class="easyui-combobox"  style="width:202px;"  >  
										        	<option value="">- 请选择 -</option>
													<option value="1">在职</option>
													<option value="0">离职</option>
												</select>
											</td>
										</tr>
						        	</tbody>
						        </table>
						       </td>
						      </tr>
		        	</tbody>
		        </table>
		        <table class="dlg-table" style="width:746px;">
		        	<tbody>
		        		<tr><td class="ltd">联系地址:</td><td class="rtd"><input name="address" style="width: 575px;"></td></tr>
		        		<tr><td class="ltd">个人自评:</td><td class="rtd"><textarea id="evaluation" name="evaluation"  style="width:575px;height: 80px;"></textarea></td></tr>
		        		<tr><td class="ltd">简历信息:</td><td class="rtd"></td></tr> 
		        		<tr>
		        			<td colspan="2">
		        				<textarea id="resume" name="resume" style="width:300px;height: 100px;"></textarea>
		        			</td>
					   	</tr>
		        	</tbody>
		        </table>
		    </form>  
			</div>  
			<div id="dlg-buttons">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save()">确定</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
			</div>  
			<div id="dlg-pwd" class="easyui-dialog" style="width:400px;height:250px;padding:10px"  closed="true" buttons="#dlg-buttons-pwd">  
			    <form id="fm-pwd" method="post">  
				    <table class="dlg-table">
				    	<tbody>
				    		<tr><td class="ltd">ID:</td><td class="rtd"><input name="id"></td></tr>
				    		<tr><td class="ltd">登录名:</td><td class="rtd"><input name="loginName" class="easyui-validatebox"  readonly="readonly"></td></tr>
				    		<tr><td class="ltd">姓名:</td><td class="rtd"><input name="name" class="easyui-validatebox" readonly="readonly"></td></tr>
				    		<tr><td class="ltd">新密码:</td><td class="rtd"><input name="password_new"  id="password"  type="password" class="easyui-validatebox" required="true"></td></tr>
				    	</tbody>
				    </table>
				</form>
			</div>
			<div id="dlg-buttons-pwd">  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="L.save_password()">确定</a>  
			    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-pwd').dialog('close')">取消</a>  
			</div>  
	</div>  
</div>
<script type="text/javascript">
	$('#resume').ckeditor();
	var url="${ctx}/admin/staff";
	
	L.add=function(){  
	    $('#dlg').dialog('open').dialog('setTitle','新增');  
	    $('#fm').form('clear');  
	    $('#resume').ckeditor("clear");
	};
	
	L.edit=function(){  
		var row = $('#dg').datagrid('getSelected');  
		$('#fm').form('clear');  
		if (row){  
			$('#resume').ckeditor("clear");
		    $.post("${ctx}/admin/staff/"+row.id,function(data){
		    	var staff=eval('('+data+')');
		    	$('#fm').form('load',staff);  	
		    	$('#resume').ckeditor("setValue",staff.resume);
		    });
		    $('#dlg').dialog('open').dialog('setTitle','编辑');  
		}  
	};
	
	L.edit_password=function(){  
		var row = $('#dg').datagrid('getSelected');  
		$('#fm-pwd').form('clear');  
		if (row){  
		    $('#dlg-pwd').dialog('open').dialog('setTitle','修改密码');  
		    $('#fm-pwd').form('load',row);  
		}  
	};  
	L.enabled=function(){  
		var row = $('#dg').datagrid('getSelected');  
		var msg="用户已启用";
		var enabled=1;
		if(row.enabled==1){
			enabled=0;
			msg="用户已禁用";
		}
		$.post("${ctx}/admin/staff/enabled/"+row.id+"/"+enabled,function(result){
			var result = eval('('+result+')');  
            if (result.success){  
                $.messager.show({  
                    title: '信息反馈',  
                    msg:msg
                });
                $('#dg').datagrid('load');
            }else{
            	$.messager.show({  
                    title: '信息反馈',  
                    msg: "系统错误" 
                });
            }
		});
	};  
	
	L.save_password=function(){  
	    $('#fm-pwd').form('submit',{  
	        url: "${ctx}/admin/staff/password",  
	        onSubmit: function(){  
	            return $(this).form('validate');
	        },  
	        success: function(result){  
	            var result = eval('('+result+')');  
	            if (result.success){  
	                $('#dlg-pwd').dialog('close');  
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
	
	L.save=function(){  
		$('#resume').ckeditor("sync");
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
	                	var result = eval('('+result+')');  
	                    if (result.success){  
	                        $('#dg').datagrid('load');
	                    } else {  
	                        $.messager.show({  
	                            title: '信息反馈',  
	                            msg: result.msg  
	                        });  
	                    }
	                });  
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
