<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案例</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	;
	  $(".saveBtn").click(function(){
		  location.href = "${pageContext.request.contextPath}/backstage/cases/soru/1/0";
	  });
	  
	//弹出新增/修改/删除结果提示
	  var message = $("#message").val();
	 	 if(message!=""){
	 		  alert(message);
	 	  }
})	;
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
  	 	<li><a href="${pageContext.request.contextPath}/indexMain">首页</a></li>
         <li><a href="${pageContext.request.contextPath}/backstage/cases/1">案例修改</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <div class="tools">
    	<ul class="toolbar">
        <li class="saveBtn"><span><img src="${pageContext.request.contextPath}/resources/back/images/t01.png" /></span>添加</li>
        <li class="click"><span><img src="${pageContext.request.contextPath}/resources/back/images/t02.png" /></span>修改</li>
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t03.png" /></span>删除</li>
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t05.png" /></span>设置</li>
        </ul>
    </div>
      <input type="hidden" id="message" value="${message }"/>
    <ul class="imglist">
    <c:forEach items="${exampleList }" var="example">
    <li class="selected">
    <span><a href="${pageContext.request.contextPath}/backstage/cases/soru/${page.pageNow}/${example.eId}"><img src="${pageContext.request.contextPath}/${example.eThumbnail }" style="width: 168px;height: 126px;"/></a></span>
    <h2><a href="#">${example.eProjectName }</a></h2>
    <p><a href="${pageContext.request.contextPath}/backstage/cases/soru/${page.pageNow}/${example.eId}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/cases/delete/${page.pageNow}/${example.eId}">删除</a></p>
    </li>
    </c:forEach>
    </ul>
    
   <div class="pagin">
    <div class="message">共<i class="blue">${page.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${page.pageNow}&nbsp;</i>页</div>
    	 <table style="float: right;">
   <tr>
	<c:if test="${page.pageNow != 1}">
 		<td><a href="${pageContext.request.contextPath}/backstage/cases/${page.pageNow-1}" style="text-decoration:none;">上一页</a></td>
		<td><a href="${pageContext.request.contextPath}/backstage/cases/1" style="text-decoration:none;">1</a></td>
	<c:if test="${page.pageNow-1 != 1}">
		<td><span>...</span></td>
		<td><a href="${pageContext.request.contextPath}/backstage/cases/${page.pageNow-1}" style="text-decoration:none;">${page.pageNow-1}</a></td>
	</c:if>
	</c:if>
		<td><a href="javascript:;" style="color:#6CF;text-decoration:none;">${page.pageNow}</a></td>
	<c:if test="${page.pageNow != page.totalPageCount}">
	<c:if test="${page.pageNow+1 != page.totalPageCount}">
			<td><a href="${pageContext.request.contextPath}/backstage/cases/${page.pageNow+1}" style="text-decoration:none;">${page.pageNow+1}</a></td>
		<td><span>...</span></td>
	</c:if>
		<td><a href="${pageContext.request.contextPath}/backstage/cases/${page.totalPageCount}" style="text-decoration:none;">${page.totalPageCount}</a></td>
	    <td><a href="${pageContext.request.contextPath}/backstage/cases/${page.pageNow+1}" style="text-decoration:none;">下一页</a></td>
   </c:if>
 </tr>
</table>
    </div>
    
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

</body>
</html>
