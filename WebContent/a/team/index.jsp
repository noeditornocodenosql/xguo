<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8" />
	<title>合肥新果文化传播有限公司</title>
    <meta name="keywords" content="合肥新果文化传播有限公司" />
    <meta name="description" content="安徽省内影视制作,平面广告,视频设计制作,动画漫画设计,电脑图文设计,企业策划咨询,会展服务,国内广告设计、制作、发布代理" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <meta name="copyright" content="Copyright www.xinguotv.com 版权所有" />
    
    <link href="${pageContext.request.contextPath}/templets/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/templets/Content/inner.min.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="/templets/Scripts/html5shiv.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/templets/Scripts/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/templets/Scripts/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/templets/Scripts/inner.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/a/team/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/a/team/css/zalki_hover_img.css" type="text/css" media="screen">
<script src="${pageContext.request.contextPath}/a/team/js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/a/team/js/jquery.zalki_hover_img.min-0.2.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/a/team/js-global/FancyZoom.js" language="JavaScript" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/a/team/js-global/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/a/team/css/cabel-v1.css" type="text/css" />
<script type="text/javascript">
$(window).load(function(){
	$('.main_box').ZalkiHoverImg(
);
});

</script>
</head>

<body onLoad="setupZoom();">
<header>
    <div class="box">
	    <a href="${pageContext.request.contextPath}/initialization"target="blank" title="www.xinguotv.com"><img src="${pageContext.request.contextPath}/templets/Picture/logo_cases.png" alt="www.xinguotv.com" style="width:255px;height: 180px; "/></a>
        <div class="wechat">
    	    <img src="${pageContext.request.contextPath}/templets/Picture/wechat_code.jpg" alt="扫描关注合肥新果文化传播有限公司微信账号" class="wechat" /><p>扫一扫微信二维码<i></i></p>
        </div>
        <nav>
          <ul>
             <li><a href="${pageContext.request.contextPath}/initialization"target="blank">${staticText.headerUlL1 }</a></li>
            <li class='active'><a href='${pageContext.request.contextPath}/cases/1'>${staticText.headerUlL2 }</a></li>
            <li><a href="${pageContext.request.contextPath}/news/1" style='color:white;'>${staticText.headerUlL3 }</a></li>
          </ul>
        </nav>
    </div>
    <footer>
	   ${staticText.footerName }<a href="http://www.xinguotv.com/" target="_blank">${staticText.footerUrlName }</a>
    </footer>
</header>
    
    <section class="toolbar">
    	<a href="${pageContext.request.contextPath}/initialization" title="返回首页" class="homelink" target="_blank"><span class="glyphicon glyphicon-chevron-left"></span></a>
    	<span class="switch glyphicon glyphicon-th-list"></span>
        <div class="category btn-group">
             <a href="${pageContext.request.contextPath}/initialization" class="btn btn-default btn-primary" target="_blank">返回首页</a>
        </div>	
    </section>
<!-- 代码部分end -->    
<div id="container">
	<!-- text elements -->
	<c:forEach items="${teamList }" var="team">
	<div class="main_box user_style7" data-hipop="text_content2">
		<a href="${pageContext.request.contextPath}/${team.tExtra2 }"><img src="${pageContext.request.contextPath}/${team.tExtra2 }" title alt="Img preview"></a>
		<p class="textTitle"> ${team.tExtra1 }</p>
	</div>
	</c:forEach>
	</div>
	
<!-- container close -->
       <div class="dock">
        <ul class="icons">
        	<li class="up"><i></i></li>
            <li class="tel">
            	<i></i><p>咨询热线<br />${sessionScope.constant.cExtra2 }</p>
            </li>
            <li class="im">
            	<i></i><p><a href="http://wpa.qq.com/msgrd?v=3&uin=${constant.cExtra3 }&site=qq&menu=yes" target="_blank">在线咨询</a></p>
            </li>
        </ul>
    </div>

</body>
</html>