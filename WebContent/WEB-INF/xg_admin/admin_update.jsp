<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号修改</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <form action="${pageContext.request.contextPath}/updateAdmin" method="post">
      <input type="hidden" name="aId" value="${ admin.aId}"/>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="${pageContext.request.contextPath}/resources/back/images/px.gif" /></i></th>
        <th>昵称</th>
        <th>邮箱</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${ admin.aId}</td>
        <td><input type="text" name="aNickName" value="${ admin.aNickName}"/></td>
        <td><input type="text" name="aEmail" value="${ admin.aEmail}"/></td>
        <td><input type="submit"  value="修改" style="cursor:pointer"/> | 
       <c:choose>
       	<c:when test="${currentAdmin.aUserName =='admin' }">
       		 <a href="${pageContext.request.contextPath}/accountSettings/1" class="tablelink">返回</a>
       	</c:when>
       	<c:otherwise>
       		 <a href="${pageContext.request.contextPath}/indexMain" class="tablelink">返回</a>
       	</c:otherwise>
       </c:choose>
       </td>
        </tr> 
        </tbody>
    </table>
    </form>
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
      <div class="tipinfo">
        <span><img src="${pageContext.request.contextPath}/resources/back/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
