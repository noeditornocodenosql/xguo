<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>合肥新果文化传播有限公司后台管理</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    <div class="mainindex">
    <div class="welinfo">
    <span><img src="${pageContext.request.contextPath}/resources/back/images/sun.png" alt="天气" /></span>
    <b>[${currentAdmin.aNickName }]早上好，欢迎使用信息管理系统</b>(${currentAdmin.aUserName }@www.xinguotv.com)
    <c:choose>
          	<c:when test="${currentAdmin.aUserName =='admin'}">
    <a href="${pageContext.request.contextPath}/accountSettings/1" onclick="checkForm()" >帐号管理</a>
    </c:when>
    </c:choose>
    </div>
    <div class="welinfo">
    <span><img src="${pageContext.request.contextPath}/resources/back/images/time.png" alt="时间" /></span>
    <i>您上次登录的时间：${currentAdmin.aLastLogonTime }</i> （不是您登录的？<a href="${pageContext.request.contextPath}/updateAdmin/${currentAdmin.aId}">请点这里</a>）
    </div>
    <div class="xline"></div>
    <ul class="iconlist">
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico01.png" /><p><a href="#">管理设置</a></p></li>
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico02.png" /><p><a href="#">发布文章</a></p></li>
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico03.png" /><p><a href="#">数据统计</a></p></li>
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico04.png" /><p><a href="#">文件上传</a></p></li>
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico05.png" /><p><a href="#">目录管理</a></p></li>
    <li><img src="${pageContext.request.contextPath}/resources/back/images/ico06.png" /><p><a href="#">查询</a></p></li> 
    </ul>
    <div class="ibox"><a class="ibtn"><img src="${pageContext.request.contextPath}/resources/back/images/iadd.png" />添加新的快捷功能</a></div>
    <div class="xline"></div>
    <div class="box"></div>
    <div class="welinfo">
    <span><img src="${pageContext.request.contextPath}/resources/back/images/dp.png" alt="提醒" /></span>
    <b>5imoban信息管理系统使用指南</b>
    </div>
    <ul class="infolist">
    <li><span>您可以快速进行消息发布</span><a class="ibtn">发布或管理消息</a></li>
    <li><span>您可以快速进行案例发布</span><a class="ibtn">发布或管理案例</a></li>
    <li><span>您可以对首页8张动态图操作</span><a class="ibtn">发布或管理8张动态图</a></li>
    </ul>
    <div class="xline"></div>
    <div class="uimakerinfo"><b>查看5imoban网站使用指南，您可以了解到多种风格的B/S后台管理界面,软件界面设计，图标设计，手机界面等相关信息</b>(<a href="#" target="_blank"></a>)</div>
    <ul class="umlist">
    <li><a href="#">如何发布文章</a></li>
    <li><a href="#">如何访问网站</a></li>
    <li><a href="#">如何管理广告</a></li>
    <li><a href="#">后台用户设置(权限)</a></li>
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>

</body>
</html>
