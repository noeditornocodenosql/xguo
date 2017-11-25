<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>动态</title>
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
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
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
    <li><a href="${pageContext.request.contextPath}/backstage/news/1">动态修改</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">修改动态</a></li> 
  	</ul>
    </div> 
  	<div id="tab1" class="tabson">
    <div class="formtext">Hi，<b>[${currentAdmin.aNickName }]</b>，欢迎您试用动态修改功能！</div>
    <form action="${pageContext.request.contextPath}/backstage/news/update/${news.nId }/${pageNow}" method="post" enctype="multipart/form-data">
  	<c:if test="${news.nId!=null && news.nThumbnail && news.eCreateTime}">
	  <input type="hidden" name="nId" value="${news.nId }"/>
      <input type="hidden" name="nOnlookerNum" value="${news.eCreateTime }"/>
      </c:if>
       <input type="hidden" name="nThumbnail" value="${news.nThumbnail }"/>
    <ul class="forminfo">
     <li><label>缩略图<b>*</b></label><img id="ImgPr" alt="" src="${pageContext.request.contextPath}/${news.nThumbnail }" name="nThumbnail" style="width: 240px;height: 170px;">
     <input name="file" type="file" class="dfinput" style="width:150px;" id="up"/><span><font style="color: red">${message }</font></span>
     </li>
    <li><label>标题<b>*</b></label><input name="nTitle" type="text" class="dfinput" value="${news.nTitle }" style="width:518px;"placeholder="限32字(必填)"/></li>
    <li><label>概述<b>*</b></label>  <input name="nOutline" type="text" class="dfinput" value="${news.nOutline }" style="width:518px;"placeholder="限60字(必填)"/></li>
        <li><label>子类别<b>*</b></label>
    <div class="vocation">
    <select class="select2" name="nChildType">
    <option value="1">新果新闻</option>
    <option value="2">新果动态</option>
    <option value="3">新果生活</option>
    </select>
    </div>
    </li>
     <li><label>一级类别<b>*</b></label><input name="nType" type="text" class="dfinput"style="width:344px;" value="${ news.nType}" placeholder="限6字(必填)"/></li>
      <li><label>二级类别<b>*</b></label>
    <div class="usercity">
    <div class="cityleft">
    <input name="nLabel1" type="text" class="dfinput" value="${ news.nLabel1}" placeholder="限6字(必填)"/>
    </div>
    
    <div class="cityright">
     <input name="nLabel2" type="text" class="dfinput"  value="${ news.nLabel2}"placeholder="限6字(选填)"/>
    </div>
    
    </div>
    </li>
    <li><label>通知内容<b>*</b></label>
    <textarea id="content7" name="nContent"  style="width:700px;height:250px;">${ news.nContent}</textarea>
    </li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/news/back/${pageNow}">返回上一级</a></li>
    </ul>
    </form>
    </div> 
    
	</div> 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    </div>

</body>
</html>
