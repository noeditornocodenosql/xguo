<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>合肥新果文化传播有限公司</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/login/images/login.js"></script>
<link href="${pageContext.request.contextPath}/resources/back/login/css/login2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function(){
		  var activateSuccess = $("#activateSuccess").val();
		  var duplicateMessage = $("#duplicateMessage").val();
		 	 if(activateSuccess!=""){
		 		  alert(activateSuccess);
		 	  }
		 	 if(duplicateMessage!=""){
		 		  alert(duplicateMessage);
		 	  }
	 //用户名密码非空验证
	  $('#submit').click(function(){  
	      if($(".inputstyle").val()==""){
	            alert("用户名/密码不能为空！！");
	            return false;
	       }else{
	          $("#login").submit(); 
	        }
	   });  
	});
</script>
</head>
<body>
<h1>合肥新果文化传播有限公司后台管理<sup>2016</sup></h1>
<div class="login" style="margin-top:80px;">
   <input type="hidden" id="activateSuccess" value="${activateSuccess }"/>
   <input type="hidden" id="duplicateMessage" value="${duplicateMessage }"/>
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    
            <!--登录-->
            <div class="web_login" id="web_login">
               <div class="login-box">
			<div class="login_form">
				<form action="index" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label> <span><font color="red">${message }</font> </span>
                <div class="inputOuter" id="uArea">
                    <input type="text" id="u" name="aUserName" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    <input type="password" id="p" name="aPassword" class="inputstyle"/>
                </div>
                </div>
                <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" id="submit"class="button_blue"/></div>
              </form>
           </div>
            	</div>
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
    <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8" action="regMain" method="post">
      	  <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="aUserName" maxlength="16" class="inputstyle2"/>
                    </div>
                </li>
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="aPassword" maxlength="16" class="inputstyle2"/>
                    </div>
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
                    </div>
                </li>
                <li>
                 <label for="email" class="input-tips2">邮箱：</label>
                    <div class="inputOuter2">
                        <input type="text" id="aEmail" name="aEmail" maxlength="25" class="inputstyle2"/>
                    </div>
                </li>
                <li>
                    <div class="inputArea">
                        <input type="submit" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
                    </div>
                </li><div class="cl"></div>
            </ul></form>
    </div>
    </div>
    <!--注册end-->
</div>
<div class="jianyi">*推荐使用ie9或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body></html>