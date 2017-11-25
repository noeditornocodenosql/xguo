<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>合肥新果文化传播有限公司后台管理</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body style="background:url(${pageContext.request.contextPath}/resources/back/images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="main.html" target="_parent"><img src="${pageContext.request.contextPath}/resources/back/images/logo.png" title="系统首页" /></a>
    </div>
    <ul class="nav">
    <li><a href="${pageContext.request.contextPath}/indexMain" target="rightFrame" class="selected"><img src="${pageContext.request.contextPath}/resources/back/images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a  target="rightFrame"><img src="${pageContext.request.contextPath}/resources/back/images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a   target="rightFrame"><img src="${pageContext.request.contextPath}/resources/back/images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a   target="rightFrame"><img src="${pageContext.request.contextPath}/resources/back/images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a  target="rightFrame"><img src="${pageContext.request.contextPath}/resources/back/images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a   target="rightFrame"><img src="${pageContext.request.contextPath}/resources/back/images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
    </ul>
    <div class="topright">    
    <ul>
    <li><span><img src="${pageContext.request.contextPath}/resources/back/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${pageContext.request.contextPath}/wh_2884" target="_parent">退出</a></li>
    </ul>
    <div class="user">
    <span>${currentAdmin.aUserName }</span>
    <i>消息</i>
    <b>8</b>
    </div>    
    </div>
</body>
</html>