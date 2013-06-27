(function($,window){
	var L={
		version:'0.0.1',
		author:'coolinc',
		create_time:'2013-06-06',
		update_time:'2013-06-09',
		is_debug:true
	};
	
	//***********************
	// common
	//***********************
	
	/**
	 * 动态添加Tab
	 */
	L.add_tab=function(title,url,closable) {
		this.tab_close=function(){
			var def_tab="默认";
		    /*双击关闭TAB选项卡*/
		    $(".tabs-inner").dblclick(function(){
		        var subtitle = $(this).children("span").text();
		        if(subtitle!=def_tab)
		        	$('#tt').tabs('close',subtitle);
		    })
		    $(".tabs-inner").bind('contextmenu',function(e){
		        $('#mm').menu('show', {
		            left: e.pageX,
		            top: e.pageY,
		        });
		        var subtitle =$(this).children("span").text();
		        $('#mm').data("currtab",subtitle);
		        return false;
		    });
		};
		
		this.tab_close_event=function(){
			var def_tab="默认";
		    //关闭当前
		    $('#mm-tabclose').click(function(){
		        var currtab_title = $('#mm').data("currtab");
		        if(currtab_title!=def_tab){
		        	$('#tt').tabs('close',currtab_title);
		        }
		    })
		    //全部关闭
		    $('#mm-tabcloseall').click(function(){
		        $('.tabs-inner span').each(function(i,n){
		            var t = $(n).text();
		            if(t!=def_tab){
		            	 $('#tt').tabs('close',t);
		            }
		        });    
		    });
		    //关闭除当前之外的TAB
		    $('#mm-tabcloseother').click(function(){
		        var currtab_title = $('#mm').data("currtab");
		        $('.tabs-inner span').each(function(i,n){
		            var t = $(n).text();
		            if(t!=def_tab){
		            	 if(t!=currtab_title)
		                     $('#tt').tabs('close',t);
		            }
		        });    
		    });
		    //关闭当前右侧的TAB
		    $('#mm-tabcloseright').click(function(){
		        var nextall = $('.tabs-selected').nextAll();
		        if(nextall.length==0){
		            return false;
		        }
		        nextall.each(function(i,n){
		            var t=$('a:eq(0) span',$(n)).text();
		            if(t!=def_tab){
		                $('#tt').tabs('close',t);
		            }
		        });
		        return false;
		    });
		    //关闭当前左侧的TAB
		    $('#mm-tabcloseleft').click(function(){
		        var prevall = $('.tabs-selected').prevAll();
		        if(prevall.length==0){
		            return false;
		        }
		        prevall.each(function(i,n){
		            var t=$('a:eq(0) span',$(n)).text();
		            if(t!=def_tab){
		                $('#tt').tabs('close',t);
		            }
		        });
		        return false;
		    });
		};
		
		if ($('#tt').tabs('exists', title)) {
			$('#tt').tabs('select', title);
		} else {
			$('#tt').tabs('add', {
				title : title,
				content:"<iframe scrolling=\"no\" frameborder=\"0\"  src=\""+url+"\" style=\"width:100%;height:99%;\"></iframe>",
				closable : closable==undefined?true:closable
			});
			this.tab_close();
			this.tab_close_event();
		}
	};

	L.change_theme=function(ctx,theme){
		var _url=ctx+"/admin/theme?theme="+theme;
		window.top.location=_url;
	};
	
	L.logout=function(ctx){
		window.top.location=ctx+"/admin/logout";
	};
	
	//jquery extension
	$.fn.extend({
		serializeObject:function(){
			 var array=$(this).serializeArray();
			 var len=array.length,i=0,obj_str='',obj=null;
			  for(i=0;i<len;i++){
				  var field=array[i];
				  if(!L.is_empty(field.value)){
					  obj_str+=field.name + ":\"" + field.value+"\"";
					  if(i!=len-1){
						  obj_str+=",";
					  }
				  }
			  }
			  obj_str="{"+obj_str+"}"
			  obj=eval('('+obj_str+')');
			  return obj;
		}
	});
	
	$.fn.ckeditor=function(mod,value,width,height){
		 var id=$(this).attr('id'); 
		 var init=function(){
			CKEDITOR.replace(id,
			{
		        width:width||'700px',
		        height:height||'230px',
		        uiColor: '#d7eff8',
				filebrowserImageUploadUrl : '/editor/upload/image',
				filebrowserFlashUploadUrl : '/editor/upload/flash',
				filebrowserUploadUrl : '/editor/upload/file',
				flv_path:'/static/js/ckeditor/player/player.swf',
				toolbar :
				[
					{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Ltrike','Subscript','Superscript','-','RemoveFormat' ] },
					{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
					{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
					{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] },
					'/',
					{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
					{ name: 'colors', items : [ 'TextColor','BGColor' ] },
					{ name: 'insert', items : [ 'Image','Flash','flv','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe','Preview' ] }
				],
				extraPlugins:'flv'
			});
		};

		var clear=function(){
			CKEDITOR.instances[id].setData("");
		};
		
		var setValue=function(value){
			CKEDITOR.instances[id].setData(value);
		};
		var getValue=function(){
			return CKEDITOR.instances[id].getData();
		};
		if(id==''||id==null||id==undefined){
			 alert('jQuery ckeidtor only id selector supported');
			 return;
		}
		 if(mod==null||mod==undefined||mod==''){
			 init();
		 }else{
			 if(mod=='init'){
				 init();
			 }else if(mod=='setValue'){
				 setValue(value);
			 }else if(mod=='getValue'){
				 return getValue();
			 }else if(mod=='clear'){
				 clear();
			 }else if(mod=='sync'){
				 $('#'+id).val(getValue());
			 }
		 }
	};
	
	
	//***********************
	// Lunshine utils
	//***********************
	L.ltrim=function(str){
	    var whitespace = new String(" \t\n\r");
	    var s = new String(str);
	    if (whitespace.indexOf(s.charAt(0)) != -1){
	        var j=0, i = s.length;
	        while (j < i && whitespace.indexOf(s.charAt(j)) != -1){
	            j++;
	        }
	        s = s.substring(j, i);
	    }
	    return s;
	};

	L.rtrim=function(str){
	    var whitespace = new String(" \t\n\r");
	    var s = new String(str);
	    if (whitespace.indexOf(s.charAt(s.length-1)) != -1){
	        var i = s.length - 1;
	        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1){
	            i--;
	        }
	        s = s.substring(0, i+1);
	    }
	    return s;
	};
	 
	L.trim=function(str){
	    return L.rtrim(L.ltrim(str));
	};

	L.is_empty=function(str){
	    return L.trim(str)=="";
	};

	L.is_int=function(objStr,sign,zero){
	    var reg;    
	    var bolzero;    
	    if(trim(objStr)==""){
	        return false;
	    }
	    else{
	        objStr=objStr.toString();
	    }
	    
	    if((sign==null)||(trim(sign)=="")){
	        sign="+-";
	    }
	    if((zero==null)||(trim(zero)==""))
	    {
	        bolzero=false;
	    }
	    else{
	        zero=zero.toString();
	        if(zero=="0"){
	            bolzero=true;
	        }
	    }

	    switch(sign)

	    {
	        case "+-":
	            reg=/(^-?|^\+?)\d+$/;            
	            break;
	        case "+": 
	            if(!bolzero){
	                reg=/^\+?[0-9]*[1-9][0-9]*$/;
	            }
	            else{
	                reg=/^\+?[0-9]*[0-9][0-9]*$/;
	            }
	            break;
	        case "-":
	            if(!bolzero){
	            	reg=/^-[0-9]*[1-9][0-9]*$/;
	            }
	            else{
	                reg=/^-[0-9]*[0-9][0-9]*$/;
	            }            
	            break;
	        default:
	            return false;
	            break;
	    }

	    var r=objStr.match(reg);
	    if(r==null){
	        return false;
	    }
	    else{
	        return true;     
	    }
	};

	L.is_email=function(email)
	{
		// a very simple email validation checking. 
		// you can add more complex email checking if it helps 
	    var splitted = email.match("^(.+)@(.+)$");
	    if(splitted == null) return false;
	    if(splitted[1] != null )
	    {
	      var regexp_user=/^\"?[\w-_\.]*\"?$/;
	      if(splitted[1].match(regexp_user) == null) 
	      	return false;
	    }
	    if(splitted[2] != null)
	    {
	      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
	      if(splitted[2].match(regexp_domain) == null) 
	      {
		    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
		    if(splitted[2].match(regexp_ip) == null) 
		    	return false;
	      }// if
	      return true;
	    }
		return false;
	};
	
	L.log=function(message){
		if(!L.is_debug)
			return;
		if(typeof console == "object"){
			console.log(message);
		}else if(typeof opera == "object"){
			opera.postError(message);
		}else if(typeof java == "object" && typeof java.lang == "object"){
			java.lang.System.out.println(message);
		}
	};
	
	//***********************
	//datagrid formatter
	//***********************
	
	window.booleanFormat=function(val, rows) {
		if (val == null || val == undefined) {
			return "";
		} else {
			if (val == 1)
				return "是";
			else
				return "否";
		}
	};
	
	window.titleFormat=function(val,rows){
		if(val){
			return '<span title="'+val+'">'+val+'</span>';
		}
	};
	
	window.sexFormat=function(val, rows) {
		if (val == "" || val == undefined)
			return "";
		if (val == 1)
			return "男";
		else
			return "女";
	};
	
	window.urlFormat=function(val, row) {
		if (val == "" || val == undefined){
			return "";
		}else{
			if(val.indexOf('http://')>-1)
				return "<a href=" + val + " target='_blank' title='" + val+ "'>链接</span>";
			else
				return "<a href=http://" + val + " target='_blank' title='" + val+ "'>链接</span>";
				
		}
	};
	
	window.jobStatusFormat=function(val, rows) {
		if (val == "" || val == undefined)
			return "";
		if (val == 1)
			return "在职";
		else
			return "离职";
	};
	window.enabledFormat=function(val, rows) {
		if (val == 1)
			return "<span class='icon icon-ok'></span>";
		else
			return "<span class='icon icon-forbidden' title='被禁用'></span>";
	};
	window.lockedFormat=function(val, rows) {
		if (val == 1)
			return "锁定";
	};
	
	
	//***********************
	//validatebox extend
	//***********************
	
	// Usage:
	//  <input name="loginName" id="loginName"  class="easyui-validatebox" required="true" 
	//	placeholder="请填手机号" maxlength="11" validType="mobile">
	$.extend($.fn.validatebox.defaults.rules, {  
	    mobile:{  
	        validator: function(value){ 
	          var pattner=/^\d{11}$/;
	       	 return pattner.test(value);
	        },  
	        message: '请输入正确的11位手机号码！'  
	    }  
	});  
	
	/** 
	 * JQuery扩展方法，用户对JQuery EasyUI的DataGrid控件进行操作。 
	 * usage:
	 * $(function() { 
		    //datagrid数据表格ID 
		    var datagridId = 'dg';  
		  
		    // 第一次加载时自动变化大小  
		    $('#' + datagridId).resizeDataGrid(28, 275, 0, 0);  
		  
		    // 当窗口大小发生变化时，调整DataGrid的大小  
		    $(window).resize(function() {  
		        $('#' + datagridId).resizeDataGrid(20, 60, 600, 800);  
		    }); 
		});
	 */  
	$.fn.extend({  
	    /** 
	     * 修改DataGrid对象的默认大小，以适应页面宽度。 
	     * @param heightMargin 高度对页内边距的距离。 
	     * @param widthMargin 宽度对页内边距的距离。 
	     * @param minHeight 最小高度。 
	     * @param minWidth 最小宽度。 
	     */  
	    resizeDataGrid : function(heightMargin, widthMargin, minHeight, minWidth) {  
	        var height = $(document.body).height() - heightMargin;  
	        var width = $(document.body).width() - widthMargin;  
	  
	        height = height < minHeight ? minHeight : height;  
	        width = width < minWidth ? minWidth : width;  
	  
	        $(this).datagrid('resize', {  
	            height : height,  
	            width : width  
	        });  
	    }  
	});  
	
	window.L=L;
	
	//******************* error exception handler************************//
	 $.ajaxSetup({ 
		async : true,
		error : function(jqXHR, textStatus, errorThrown){
		var msg = $.parseJSON(jqXHR.responseText).msg;
			alert(msg);
		},
		traditional : true,
		dataType : "json",
		type : "POST"
	});
	 
	//******************* AOP support************************//
	window.Aspects=function(){};
	Aspects.prototype={
		before:function(target,method,advice){
			var original=target[method];
			target[method]=function(){
				(advice)();
				original.apply(this,arguments);
			};
		},
		after:function(target,method,advice){
			var original=target[method];
			target[method]=function(){
				original.apply(this,arguments);
				(advice)();
			};
		},
		around:function(target,method,advice){
			var original=target[method];
			target[method]=function(){
				(advice)();
				original.apply(this,arguments);
				(advice)();
			};
		}
	};
})($,window);
