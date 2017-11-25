<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>团队-添加</title>
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
    <li><a href="${pageContext.request.contextPath}/backstage/news/1">动态添加</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">发布动态</a></li> 
  	</ul>
    </div> 
  	<div id="tab1" class="tabson">
    <div class="formtext">Hi，<b>[${currentAdmin.aNickName }]</b>，欢迎您试用团队发布功能！</div>
    <form name="form1"action="${pageContext.request.contextPath}/backstage/team/save" method="post" enctype="multipart/form-data">
    <ul class="forminfo">
    <li><label>缩略图(520x350)<b>*</b></label><img id="ImgPr"style="width: 240px;height: 170px;">
    <input name="file" type="file" class="dfinput" style="width:518px;" id="up"/><span><font style="color: red">${message }</font></span></li>
    <li><label>标题<b>*</b></label><input name="tExtra1" type="text" class="dfinput" style="width:518px;"placeholder="注意字数不要超出页面显示(选填)"/></li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="马上添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/team/back/${pageNow}">返回上一级</a></li>
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
