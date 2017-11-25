<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>introduction</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/uploadPreview.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/uploadPreview.js"></script>
<script language="javascript">
$(function(){	
	//弹出新增/修改/删除结果提示
	  var message = $("#message").val();
	 	 if(message!=""){
	 		  alert(message);
	 	  }
	 	//上传图片预览
	 	$("#up1").uploadPreview({ Img: "ImgPr1", Width: 420, Height: 270 });
});
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
     <li><a href="${pageContext.request.contextPath}/indexMain">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/backstage/introductionupload">简介图</a></li>
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
    <form action="${pageContext.request.contextPath}/backstage/introductionupload" method="post" enctype="multipart/form-data">
    <ul class="forminfo">
     <li><label>简介图(420x270)<b>*</b></label><img id="ImgPr1" alt="" src="${pageContext.request.contextPath}/resources/front/we/images/introductionPic.jpg"  style="width:420px;height: 270px;">
     <input name="file" type="file" class="dfinput" style="width:150px;" id="up1"/>
     </li>
     <li><label>&nbsp;</label><input type="submit" class="btn" value="上传"/>&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:gray;">(注意:图片名须为introductionPic.jpg,不可以是其他图片格式)</a></li>
    </ul>
    </form>
    </div>

</body>
</html>
