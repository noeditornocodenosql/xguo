<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <table class="tablelist" id="tableId">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value=""/></th>
        <th>编号<i class="sort"><img src="${pageContext.request.contextPath}/resources/back/images/px.gif" /></i></th>
        <th>地址</th>
        <th>固话</th>
        <th>手机</th>
        <th>邮箱</th>
        <th>QQ</th>
        <th>微信</th>
        <th>网址</th>
        <th>邮编</th>
        <th>logo旁边文字</th>
        <th>在线咨询电话</th>
        <th>在线咨询QQ</th>
         <th>电话图标旁电话</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input type="checkbox" name="test" value="${ constant.cId}"/></td>
        <td>${ constant.cId}</td>
        <td>${ constant.cAddress}</td>
        <td>${ constant.cTelephone}</td>
        <td>${ constant.cPhone}</td>
        <td>${ constant.cEmail}</td>
        <td>${ constant.cTencent}</td>
        <td>${ constant.cWechat}</td>
        <td>${ constant.cWebsite}</td>
        <td>${ constant.cPostcode}</td>
        <td>${ constant.cExtra1}</td>
        <td>${ constant.cExtra2}</td>
        <td>${ constant.cExtra3}</td>
         <td>${ constant.cExtra4}</td>
        <td><a href="${pageContext.request.contextPath}/updateConstant/${ constant.cId}" class="tablelink">修改</a> | <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        </tbody>
    </table>
    
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
