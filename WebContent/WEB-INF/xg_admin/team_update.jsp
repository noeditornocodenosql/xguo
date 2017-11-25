<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>团队</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/back/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/kindeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/uploadPreview.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/uploadPreview.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
	//弹出新增/修改/删除结果提示
	  var message = $("#message").val();
	 	 if(message!=""){
	 		  alert(message);
	 	  }
	//上传图片预览
	$("#up").uploadPreview({ Img: "ImgPr", Width: 240, Height: 170 });
});
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="${pageContext.request.contextPath}/indexMain">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/backstage/teamInfo">团队图片-修改</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">团队图片修改</a></li> 
  	</ul>
    </div> 
  	<div id="tab1" class="tabson">
    <div class="formtext">Hi，<b>[${currentAdmin.aNickName }]</b>，欢迎您试用团队发布功能！</div>
     <input type="hidden" id="message" value="${message }"/>   
    <form action="${pageContext.request.contextPath}/backstage/team/update/${team.tId }/${pageNow}" method="post" enctype="multipart/form-data">
	  <input type="hidden" name="tId" value="${team.tId }"/>
       <input type="hidden" name="tThumbnail" value="${team.tThumbnail }"/>
       <input type="hidden" name="tExtra2" value="${team.tExtra2 }"/>
       <c:if test="${not empty team.tThumbnail}">
    <ul class="forminfo">
     <li><label>缩略图(670x500)<b>*</b></label><img id="ImgPr" alt="" src="${pageContext.request.contextPath}/${team.tThumbnail }" name="tThumbnail" style="width: 240px;height: 170px;">
     <input name="file" type="file" class="dfinput" style="width:150px;" id="up"/><span><font style="color: red">${message }</font></span>
     </li>
    <li><label>标题<b>*</b></label><input name="tTitle" type="text" class="dfinput" value="${team.tTitle }" style="width:518px;"placeholder="注意字数不要超出页面显示(必填)"/></li>
    <li><label>概述<b>*</b></label>  <input name="tContent" type="text" class="dfinput" value="${team.tContent }" style="width:518px;"placeholder="注意字数不要超出页面显示(必填)"/></li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/team/back/${pageNow}">返回上一级</a></li>
    </ul>
    </c:if>
      <c:if test="${not empty team.tExtra2}">
    <ul class="forminfo">
     <li><label>缩略图(520x350)<b>*</b></label><img id="ImgPr" alt="" src="${pageContext.request.contextPath}/${team.tExtra2 }" name="tExtra2" style="width: 240px;height: 170px;">
     <input name="file" type="file" class="dfinput" style="width:150px;" id="up"/><span><font style="color: red">${message }</font></span>
     </li>
    <li><label>标题<b>*</b></label><input name="tExtra1" type="text" class="dfinput" value="${team.tExtra1 }" style="width:518px;"placeholder="注意字数不要超出页面显示(必填)"/></li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/team/back/${pageNow}">返回上一级</a></li>
    </ul>
    </c:if>
    </form>
    </div> 
    
	</div> 
    
    </div>

</body>
</html>
