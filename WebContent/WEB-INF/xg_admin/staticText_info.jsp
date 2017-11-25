<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>静态文字修改</title>
<link href="${pageContext.request.contextPath}/resources/back/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});
  
  $("#save").click(function(){
	  location.href = "#";
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
			  location.href = "#?str="+str[0];
		  });
		}else{
		alert("请选择一条需要修改的数据");
		return false;
		}
  });

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});
  
//弹出新增/修改/删除结果提示
  var message = $("#message").val();
 	 if(message!=""){
 		  alert(message);
 	  }
});
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${pageContext.request.contextPath}/indexMain">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/constant">联系方式</a></li>
    </ul>
    </div>
      <input type="hidden" id="message" value="${message }"/>
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
    <form name="form1"action="${pageContext.request.contextPath}/backstage/updateStaticText" method="post">
    <input type="hidden" name="id" value="${staticText.id }"/>
    <ul class="forminfo">
      <li><label>轮播1span：<b>*</b></label><input type="text" class="dfinput" name="carouselSpan1"  value="${staticText.carouselSpan1 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播1p：<b>*</b></label><input type="text" class="dfinput" name="carouselP1"  value="${staticText.carouselP1 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播2span：<b>*</b></label><input type="text" class="dfinput" name="carouselSpan2"  value="${staticText.carouselSpan2 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播2p：<b>*</b></label><input type="text" class="dfinput" name="carouselP2"  value="${staticText.carouselP2 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播3span：<b>*</b></label><input type="text" class="dfinput" name="carouselSpan3"  value="${staticText.carouselSpan3 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播3p：<b>*</b></label><input type="text" class="dfinput" name="carouselP3"  value="${staticText.carouselP3 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播4span：<b>*</b></label><input type="text" class="dfinput" name="carouselSpan4"  value="${staticText.carouselSpan4 }"style="width:1000px;" placeholder=""/></li>
      <li><label>轮播4p：<b>*</b></label><input type="text" class="dfinput" name="carouselP4"  value="${staticText.carouselP4 }"style="width:1000px;" placeholder=""/></li>
   <!-- 业务 -->
   	<li><label>业务：<b>*</b></label><input type="text" class="dfinput" name="businessSpan"  value="${staticText.businessSpan }"style="width:1000px;" placeholder=""/></li>
   	<li><label>业务分类1：<b>*</b></label><input type="text" class="dfinput" name="businessStrong1"  value="${staticText.businessStrong1 }"style="width:1000px;" placeholder=""/></li>
   	<li><label>业务分类2：<b>*</b></label><input type="text" class="dfinput" name="businessStrong2"  value="${staticText.businessStrong2 }"style="width:1000px;" placeholder=""/></li>
   	<li><label>业务分类3：<b>*</b></label><input type="text" class="dfinput" name="businessStrong3"  value="${staticText.businessStrong3 }"style="width:1000px;" placeholder=""/></li>
   	<li><label>业务分类4：<b>*</b></label><input type="text" class="dfinput" name="businessStrong4"  value="${staticText.businessStrong4 }"style="width:1000px;" placeholder=""/></li>
   	<li><label>业务分类5：<b>*</b></label><input type="text" class="dfinput" name="businessStrong5"  value="${staticText.businessStrong5 }"style="width:1000px;" placeholder=""/></li>
     <!-- 案例 -->
    <li><label>案例：<b>*</b></label><input type="text" class="dfinput" name="casesSpan"  value="${staticText.casesSpan }"style="width:1000px;" placeholder=""/></li>
     <!-- 客户 -->
    <li><label>客户：<b>*</b></label><input type="text" class="dfinput" name="clientsCaption"  value="${staticText.clientsCaption }"style="width:1000px;" placeholder=""/></li>
     <!-- 团队 -->
    <li><label>团队：<b>*</b></label><input type="text" class="dfinput" name="teamCaption"  value="${staticText.teamCaption }"style="width:1000px;" placeholder=""/></li>
     <!-- 动态 -->
    <li><label>动态：<b>*</b></label><input type="text" class="dfinput" name="dynamicCaption"  value="${staticText.dynamicCaption }"style="width:1000px;" placeholder=""/></li>
     <!-- 我们 -->
     <li><label>我们左菜单1：<b>*</b></label><input type="text" class="dfinput" name="aboutusMenuLi1"  value="${staticText.aboutusMenuLi1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>我们左菜单2：<b>*</b></label><input type="text" class="dfinput" name="aboutusMenuLi2"  value="${staticText.aboutusMenuLi2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>我们左菜单3：<b>*</b></label><input type="text" class="dfinput" name="aboutusMenuLi3"  value="${staticText.aboutusMenuLi3 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单1strong：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivStrong1"  value="${staticText.aboutusDivStrong1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单1p：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivP1"  value="${staticText.aboutusDivP1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单1u：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivU1"  value="${staticText.aboutusDivU1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单2strong：<b>*</b></label><input type="text" class="dfinput" name=aboutusDivStrong2  value="${staticText.aboutusDivStrong2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单2p2_1：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivP2_1"  value="${staticText.aboutusDivP2_1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单2p2_2：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivP2_2"  value="${staticText.aboutusDivP2_2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3strong：<b>*</b></label><input type="text" class="dfinput" name="aboutusDivStrong3"  value="${staticText.aboutusDivStrong3 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3ul1：<b>*</b></label><input type="text" class="dfinput" name="aboutusUlL1"  value="${staticText.aboutusUlL1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3ul2：<b>*</b></label><input type="text" class="dfinput" name="aboutusUlL2"  value="${staticText.aboutusUlL2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3ul3：<b>*</b></label><input type="text" class="dfinput" name="aboutusUlL3"  value="${staticText.aboutusUlL3 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3ul4：<b>*</b></label><input type="text" class="dfinput" name="aboutusUlL4"  value="${staticText.aboutusUlL4 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3ul5：<b>*</b></label><input type="text" class="dfinput" name="aboutusUlL5"  value="${staticText.aboutusUlL5 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3exp1：<b>*</b></label><input type="text" class="dfinput" name="aboutusTableTd1"  value="${staticText.aboutusTableTd1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3exp2：<b>*</b></label><input type="text" class="dfinput" name="aboutusTableTd2"  value="${staticText.aboutusTableTd2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3exp3：<b>*</b></label><input type="text" class="dfinput" name="aboutusTableTd3"  value="${staticText.aboutusTableTd3 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3exp4：<b>*</b></label><input type="text" class="dfinput" name="aboutusTableTd4"  value="${staticText.aboutusTableTd4 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左菜单3exp5：<b>*</b></label><input type="text" class="dfinput" name="aboutusTableTd5"  value="${staticText.aboutusTableTd5 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左toolbar url1：<b>*</b></label><input type="text" class="dfinput" name="headerUlL1"  value="${staticText.headerUlL1 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左toolbar url2：<b>*</b></label><input type="text" class="dfinput" name="headerUlL2"  value="${staticText.headerUlL2 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左toolbar url3：<b>*</b></label><input type="text" class="dfinput" name="headerUlL3"  value="${staticText.headerUlL3 }"style="width:1000px;" placeholder=""/></li>
     <li><label>左toolbar底部：<b>*</b></label><input type="text" class="dfinput" name="footerName"  value="${staticText.footerName }"style="width:1000px;" placeholder=""/></li>
     <li><label>左toolbar公司：<b>*</b></label><input type="text" class="dfinput" name="footerUrlName"  value="${staticText.footerUrlName }"style="width:1000px;" placeholder=""/></li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认修改"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
