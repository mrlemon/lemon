<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<c:import url="layout/resource.jsp" charEncoding="utf-8"></c:import>
<link rel="stylesheet" type="text/css" href="css/act-video.css">
<script type="text/javascript" src="js/player/jwplayer.js"></script>
<title>软筑俱乐部</title>
</head>
<body>
<c:import url="layout/header.html" charEncoding="utf-8"></c:import>
<div class="main">
	<div class="content">
		<div class="nav">
			<img src="images/ico-nav.gif"> <a href="" >俱乐部首页</a> &gt;  <a href="/video" >活动视频</a>  &gt;  <a href="/video?act=<c:out value="${act.id}"/>"><c:out value="${act.subject }"/></a>&gt; <c:out value="${vo.title}"/>
		</div>
		<div class="frame-left">
			<div class="tit-block"><c:out value="${vo.title}"/></div>
			<div id="player-block">
				<div id='mediaplayer'></div>
				<script type="text/javascript">
/* 				    var embed_code='<object type="application/x-shockwave-flash" data="js/player/player.swf" width="100%" height="100%" bgcolor="#000000" id="mediaplayer" name="mediaplayer" tabindex="0">';
				    	embed_code+='<param name="allowfullscreen" value="true">';
				    	embed_code+='<param name="allowscriptaccess" value="always">';
				    	embed_code+='<param name="seamlesstabbing" value="true">';
				    	embed_code+='<param name="wmode" value="opaque">';
				    	embed_code+='<param name="flashvars"';
				    	embed_code+='value="netstreambasepath=http%3A%2F%2F127.0.0.1%3A8080%2Fact-video-play.jsp&amp;id=mediaplayer&amp;file=http%3A%2F%2F127.0.0.1%3A8080%2Fupload%2Feditor%2Fflash%2F2012-03%2Fceo-czd.flv&amp;image=http%3A%2F%2F127.0.0.1%3A8080%2Fimages%2Fcont-activity-pic.gif&amp;skin=http%3A%2F%2F127.0.0.1%3A8080%2Fjs%2Fplayer%2Fglow.zip&amp;plugins=sharing-2h&amp;sharing.code=%3Cobject%20type%3D%22application%2Fx-shockwave-flash%22%20data%3D%22http%3A%2F%2F127.0.0.1%3A8080%2Fjs%2Fplayer%2Fplayer.swf%22%20width%3D%22480%22%20height%3D%22320%22%20bgcolor%3D%22%23000000%22%20id%3D%22mediaplayer%22%20name%3D%22mediaplayer%22%20tabindex%3D%220%22%3E%3Cparam%20name%3D%22allowfullscreen%22%20value%3D%22true%22%3E%3Cparam%20name%3D%22allowscriptaccess%22%20value%3D%22always%22%3E%3Cparam%20name%3D%22seamlesstabbing%22%20value%3D%22true%22%3E%3Cparam%20name%3D%22wmode%22%20value%3D%22opaque%22%3E%3Cparam%20name%3D%22flashvars%22%20value%3D%22netstreambasepath%3Dhttp%253A%252F%252F127.0.0.1%253A8080%252Fact-video-play.jsp%26amp%3Bid%3Dmediaplayer%26amp%3Bfile%3Dhttp%253A%252F%252F127.0.0.1%253A8080%252Fupload%252Feditor%252Fflash%252F2012-03%252Fceo-czd.flv%26amp%3Bimage%3Dhttp%253A%252F%252F127.0.0.1%253A8080%252Fimages%252Fcont-activity-pic.gif%26amp%3Bskin%3Dhttp%253A%252F%252F127.0.0.1%253A8080%252Fjs%252Fplayer%252Fglow.zip%26amp%3Bplugins%3Dsharing-2h%26amp%3Bsharing.code%3D%253Cobject%2520type%253D%2522application%252Fx-shockwave-flash%2522%2520data%253D%2522js%252Fplayer%252Fplayer.swf%2522%2520width%253D%2522480%2522%2520height%253D%2522320%2522%2520bgcolor%253D%2522%2523000000%2522%2520id%253D%2522mediaplayer%2522%2520name%253D%2522mediaplayer%2522%2520tabindex%253D%25220%2522%253E%253Cparam%2520name%253D%2522allowfullscreen%2522%2520value%253D%2522true%2522%253E%253Cparam%2520name%253D%2522allowscriptaccess%2522%2520value%253D%2522always%2522%253E%253Cparam%2520name%253D%2522seamlesstabbing%2522%2520value%253D%2522true%2522%253E%253Cparam%2520name%253D%2522wmode%2522%2520value%253D%2522opaque%2522%253E%253Cparam%2520name%253D%2522flashvars%2522%2520value%253D%2522netstreambasepath%253Dhttp%25253A%25252F%25252F127.0.0.1%25253A8080%25252Fact-video-play.jsp%2526amp%253Bid%253Dmediaplayer%2526amp%253Bfile%253Dupload%25252Feditor%25252Fflash%25252F2012-03%25252Fceo-czd.flv%2526amp%253Bimage%253Dimages%25252Fcont-activity-pic.gif%2526amp%253Bskin%253Djs%25252Fplayer%25252Fglow.zip%2526amp%253Bplugins%253Dsharing-2h%2526amp%253Bsharing.code%253D%25255B%25253Cembed%252520src%25253D%252522http%25253A%25252F%25252Fplayer.youku.com%25252Fplayer.php%25252FType%25252FFolder%25252FFid%25252F17294084%25252FOb%25252F1%25252FPt%25252F0%25252Fsid%25252FXMzc2Nzc0NzUy%25252Fv.swf%252522%252520quality%25253D%252522high%252522%252520width%25253D%252522480%252522%252520height%25253D%252522400%252522%252520align%25253D%252522middle%252522%252520allowScriptAccess%25253D%252522always%252522%252520allowFullScreen%25253D%252522true%252522%252520mode%25253D%252522transparent%252522%252520type%25253D%252522application%25252Fx-shockwave-flash%252522%25253E%25253C%25252Fembed%25253E%25255D%2526amp%253Bsharing.pluginmode%253DFLASH%2526amp%253Bcontrolbar.position%253Dover%2522%253E%253C%252Fobject%253E%26amp%3Bsharing.pluginmode%3DFLASH%26amp%3Bcontrolbar.position%3Dover%22%3E%3C%2Fobject%3E&amp;sharing.pluginmode=FLASH&amp;controlbar.position=over">';
				    	embed_code+='</object>'; */
				  jwplayer('mediaplayer').setup({
				    'flashplayer': 'js/player/player.swf',
				    'id': 'playerID',
				    'width': '480',
				    'height': '320',
				    'file': '<c:out value="${vo.path}"/>',
				    'image': '<c:out value="${vo.subpath}"/>',
				    'skin': 'js/player/glow.zip',
				    'controlbar': 'over',
				    'plugins': {
				  /*      'sharing-2': {
				           'code': embed_code
				       } */
				    }
				  });
				</script>
			</div>
			<div class="conent-bar" id="conent-bar"> 
					<div class="share-bar">
						<!-- JiaThis Button BEGIN -->
						<div id="ckepop">
							<span class="jiathis_txt">分享到：</span>
							<a class="jiathis_button_icons_1"></a>
							<a class="jiathis_button_icons_2"></a>
							<a class="jiathis_button_icons_3"></a>
							<a class="jiathis_button_icons_4"></a>
							<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
							<a class="jiathis_counter_style"></a>
						</div>
						<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
						<!-- JiaThis Button END -->
					</div>
			</div>
			<div class="video-pre">
				<c:choose>
					<c:when test="${previous!=null}">
					<a href="/play?id=<c:out value="${previous.id }"/>">上一篇：<c:out value="${previous.title }"/></a>
					</c:when>
					<c:otherwise><a>没有了</a></c:otherwise>
				</c:choose>
			</div>
			<div class="video-next">
				<c:choose>
					<c:when test="${next!=null}">
					<a href="/play?id=<c:out value="${next.id }"/>">下一篇：<c:out value="${next.title }"/></a>
					</c:when>
					<c:otherwise><a>没有了</a></c:otherwise>
				</c:choose>
            </div>
			<div class="video-tags">
			<b>标签：</b><a href="">新闻</a><a href="">中国</a><a href="">建筑</a>
			</div>
			<div class="other">
				<div class="tit">相关阅读：</div>
				<div class="ls">
					<ul>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
						<li><a href="">媒领域我们最懂泛建筑,们最懂泛建筑</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="frame-right">
			<div class="panel pn-2">
				<div class="title">精彩视频</div>
				<div class="cont">
					<div class="rank">
						<ul>
							<c:forEach var="vo" items="${voList1}" varStatus="st">
								<li>
									<span class=<c:if test="${st.count>3}">follow</c:if> <c:if test="${st.count<=3}">front</c:if>><c:out value="${st.count}"/> </span>
									<span><a href="/play?id=<c:out value='${vo.id}'/>" title="<c:out value='${vo.title}'/>"><c:out value='${vo.title_sub}'/> </a></span>
								</li>
							</c:forEach>	
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="layout/footer.html" charEncoding="utf-8"></c:import>
</body>
</html>