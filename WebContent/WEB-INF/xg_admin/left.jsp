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
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
	
})	;
</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    <dl class="leftmenu">
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/resources/back/images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${pageContext.request.contextPath}/indexMain" target="rightFrame">后台首页</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/constant" target="rightFrame">联系方式</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/categorysOneLevel" target="rightFrame">导航</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/news/1" target="rightFrame">动态</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/cases/1" target="rightFrame">案例</a><i></i></li>
         <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/dynamicCirculate/1" target="rightFrame">首页动态图</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/carouselFigureupload" target="rightFrame">4张首页图</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/wordsupload" target="rightFrame">Words</a><i></i></li>
      <%--   <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/introductionupload" target="rightFrame">简介图</a><i></i></li> --%>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/backgroundImageupload" target="rightFrame">7张背景图</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/team/1" target="rightFrame">团队图片</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/advertisementupload" target="rightFrame">动态详细页AD</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/customerupload" target="rightFrame">客户logo图</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/welcomeupload" target="rightFrame">海报图</a><i></i></li>
        <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/logoupload" target="rightFrame"> logo&wechat</a><i></i></li>
         <li><cite></cite><a href="${pageContext.request.contextPath}/backstage/staticText" target="rightFrame"> 页面文字修改</a><i></i></li>
        </ul>    
    </dd>
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/resources/back/images/leftico02.png" /></span>其他设置
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="#">编辑内容</a><i></i></li>
        <li><cite></cite><a href="#">发布信息</a><i></i></li>
        <li><cite></cite><a href="#">档案列表显示</a><i></i></li>
        </ul>     
    </dd> 
    <dd><div class="title"><span><img src="${pageContext.request.contextPath}/resources/back/images/leftico03.png" /></span>编辑器</div>
    <ul class="menuson">
        <li><cite></cite><a href="javascript:void(0)" onclick="defineField()">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>    
    </dd>  
    <dd><div class="title"><span><img src="${pageContext.request.contextPath}/resources/back/images/leftico04.png" /></span>日期管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>
    </dd>   
    </dl>
</body>
</html>
