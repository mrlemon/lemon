
(function($) {

    $.fn.waterfall = function(options) {
        var settings = {
            url          : GV.URL.MORENEWS,
            param        : {},
            waterarea    : null,//瀑布区域
            template     : '<dl><dt><a href="<%=url_show%>" target="_blank"><%=title_show%></a></dt><dd><div class="pic"><img src="<%=logo%>" /></div><div class="newsinfo cf"><p><%=hometext_show_short2%><a href="<%=url_show%>" target="_blank">阅读全文&gt;&gt;</a></p><div class="tools"><div class="share"><ul><li class="head comment" title="评论"><%=comments%></li><li class="s-t"></li><li class="sina"><a title="分享到新浪微博" href="javascript:void(0)" data-type="weibosina" onclick="javascript:shareJump(this)" target="_blank"></a></li><li class="qq"><a title="分享到QQ空间" href="javascript:void(0)" data-type="qq" onclick="javascript:shareJump(this)" target="_blank"></a></li><li class="blg"><a title="分享到搜狐微博" href="javascript:void(0)" data-type="weibosohu" onclick="javascript:shareJump(this)" target="_blank"></a></li><li class="rrw"><a title="分享到人人网" href="javascript:void(0)" data-type="renren" onclick="javascript:shareJump(this)" target="_blank"></a></li><li class="db"><a title="分享到豆瓣" href="javascript:void(0)" data-type="douban" onclick="javascript:shareJump(this)" target="_blank"></a></li><li class="itb"><a title="分享到百度贴吧" href="javascript:void(0)" data-type="itb" onclick="javascript:shareJump(this)" target="_blank"></a></li></ul></div><div class="time"><%=aid%> 发表于 <%=time%></div></dd></dl>',
            linkid       : "#linkpager",
            container    : ".items",
            loading      : "#loading",
			_scrollTimer : null,
			_posted      : 0,
			_stop        : 0,
			_split       : 1 //第一页分割
        };
        var elements = this;

        if(options) {
            $.extend(settings, options);
            if(settings.waterarea == null){settings.waterarea = elements}
        }

		function getData(param, success) {
            var url = settings.url;
            if(url){
                $.extend(param, settings.param);
                if(url.indexOf("?") == -1 ){
                    url += '?jsoncallback=?';
                }else{
                    url += '&jsoncallback=?';
                }
                for(var el in param){
                    url += '&'+el+'='+param[el];
                }
            }else{
                return;
            }
			if(settings._posted == 0){
			    settings._posted = 1;
                $(settings.loading).show();
				$.getJSON(url,function(data){
					success(data);
                    $(settings.loading).hide();
                    settings._posted = 0;
				});
			}
        }
		function onScroll() {
            var bottom = $(settings.waterarea).offset().top + $(settings.waterarea).outerHeight(),
                scrollTop = document.documentElement.scrollTop || document.body.scrollTop || 0,
                windowHeight = document.documentElement.clientHeight || document.body.clientHeight || 0;
            if (scrollTop >= bottom - windowHeight && settings._stop == 0) {

                settings._split++;
                var param = {'split_page':settings._split,'page':'1'};
                getData(param,function(data){
                    if(data.result.list.length > 0) {
                        for(var i=0; i < data.result.list.length; i++){
                            var html = CB.tmpl(settings.template, data.result.list[i]);
                            $(settings.waterarea).find(settings.container).append(html);
                        }
                    }else{
                        //stop
                        settings._stop = 1;
                        $(settings.linkid).html(data.result.pager);
                        //bind link action
                        $(settings.linkid).on("click", "a", function() {
                            var page = parseInt($(this).attr("data-page")),
                                param = {'page':page};
                            getData(param,function(data){
                                if(data.result.list.length > 0) {
                                    $("html,body").animate({scrollTop: $(settings.waterarea).offset().top}, 120);
                                    $(settings.waterarea).find(settings.container).html("");
                                    for(var i=0; i < data.result.list.length; i++){
                                        var html = CB.tmpl(settings.template, data.result.list[i]);
                                        $(settings.waterarea).find(settings.container).append(html);
                                    }
                                    $(settings.linkid).html(data.result.pager);
                                }
                                if(page == 1){
                                    //reset
                                    settings._split = 1;
                                    $(settings.linkid).html("");
                                    settings._stop = 0;
                                }
                            });
                        });
                    }
                });
            }
		}

		$(window).bind('scroll', function() {
			clearTimeout(settings._scrollTimer);
			settings._scrollTimer = setTimeout(onScroll, 300);
		});
	}

})(jQuery);