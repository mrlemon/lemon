(function($){
	'use strict';
	$.fn.extend({
		paging: function(opts,callback) {
			if(!this[0])return;
			if (typeof opts == "string" || typeof opts == "undefined") opts = {};
			var pagenav = $(this);
			var hand = true;
			$(this).find("#"+$(this).attr("id")+"_next").click(function() {
				var page = parseInt(pagenav.attr("data-page"));
				if(hand == true) {
					hand = false;
					pagenav.find("span").html("<button class='tips_loading' style='width:30px;height:16px;'></button>");
					$.getJSON(GV.URL.INDEX.ALLNEWS+'?jsoncallback=?',{"type":opts.type,"page":page+1},function(data, status){
						if(data.status == 'success'){
							hand = true;
							if(data.result.length > 0) {
								pagenav.attr("data-page", page+1);
								pagenav.find("span").html("");
								callback(data.result);
								return;
							}
						}
						pagenav.find("span").html("\u6ca1\u6709\u4e86...");
						pagenav.find("span").fadeOut(5000);
						hand = false;
                        // init fixed position
                        fixed_top = $("#fixed_area").offset().top;
					});
				}
				return false;
			});
		},
		cexpand: function(){
			var self = $(this),
				list = $(".comments_list"),
				box = $(".comments_side");
			self.click(function() {
				self.toggleClass("icon_narrow");
				if(self.hasClass("icon_narrow")){
					list.css({"height":"auto"});
					box.css({"height":"auto","overflow":"visible"});
				}else{
					list.css({"height":"350px"});
					box.css({"height":"350px","overflow":"auto"});
				}
                // init fixed position
                fixed_top = $("#fixed_area").offset().top;
			});
		}
	});
})(jQuery);