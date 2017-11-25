<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号设置</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});
  
  $("#save").click(function(){
	  location.href = "${pageContext.request.contextPath}/saveAdmin";
  });
  
  $("#update").click(function(){
	  if($("input[type='checkbox'][name='test']:checked").attr("checked")){
		  $(".update").click(function(){
			  $(".tip").fadeIn();
			  });
		   var str="";
			  $("input[name='test']:checked").each(function() { // 遍历选中的checkbox
				  if($(this).attr("checked")){
		              str += $(this).val()+","
		              str.split(",");
		          }
			});
		  $(".sure").click(function(){
			//  location.href = "${pageContext.request.contextPath}/updateAdmin?str="+str[0];
		  });
		}else{
		alert("请选择一条需要修改的数据");
		return false;
		}
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
    <div class="tools">
    	<ul class="toolbar">
        <li class="save" id="save"><span><img src="${pageContext.request.contextPath}/resources/back/images/t01.png" /></span>添加</li>
        <li class="update" id="update"><span><img src="${pageContext.request.contextPath}/resources/back/images/t02.png" /></span>修改</li>
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t03.png" /></span>删除</li>
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
        <li><span><img src="${pageContext.request.contextPath}/resources/back/images/t05.png" /></span>设置</li>
        </ul>
    </div>
    <table class="tablelist" id="tableId">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value=""/></th>
        <th>编号<i class="sort"><img src="${pageContext.request.contextPath}/resources/back/images/px.gif" /></i></th>
        <th>用户</th>
        <th>昵称</th>
        <th>邮箱</th>
        <th>注册时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${adminList }" var="admin">
        <tr>
        <td><input type="checkbox" name="test" value="${ admin.aId}"/></td>
        <td>${ admin.aId}</td>
        <td>${ admin.aUserName}</td>
        <td>${ admin.aNickName}</td>
        <td>${ admin.aEmail}</td>
        <td>${ admin.aRegisterTime}</td>
        <td><a href="${pageContext.request.contextPath}/updateAdmin/${admin.aId}" class="tablelink">修改</a> | <a href="${pageContext.request.contextPath}/deleteAdmin/${page.pageNow}/${ admin.aId}" class="tablelink"> 删除</a></td>
        </tr> 
        </c:forEach>
        </tbody>
    </table>
    
    <div class="pagin">
    <div class="message">共<i class="blue">${page.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${page.pageNow}&nbsp;</i>页</div>
    	 <table style="float: right;">
   <tr>
	<c:if test="${page.pageNow != 1}">
 		<td><a href="${pageContext.request.contextPath}/accountSettings/${page.pageNow-1}" style="text-decoration:none;">上一页</a></td>
		<td><a href="${pageContext.request.contextPath}/accountSettings/1" style="text-decoration:none;">1</a></td>
	<c:if test="${page.pageNow-1 != 1}">
		<td><span>...</span></td>
		<td><a href="${pageContext.request.contextPath}/accountSettings/${page.pageNow-1}" style="text-decoration:none;">${page.pageNow-1}</a></td>
	</c:if>
	</c:if>
		<td><a href="javascript:;" style="color:#6CF;text-decoration:none;">${page.pageNow}</a></td>
	<c:if test="${page.pageNow != page.totalPageCount}">
	<c:if test="${page.pageNow+1 != page.totalPageCount}">
			<td><a href="${pageContext.request.contextPath}/accountSettings/${page.pageNow+1}" style="text-decoration:none;">${page.pageNow+1}</a></td>
		<td><span>...</span></td>
	</c:if>
		<td><a href="${pageContext.request.contextPath}/accountSettings/${page.totalPageCount}" style="text-decoration:none;">${page.totalPageCount}</a></td>
	    <td><a href="${pageContext.request.contextPath}/accountSettings/${page.pageNow+1}" style="text-decoration:none;">下一页</a></td>
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
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
