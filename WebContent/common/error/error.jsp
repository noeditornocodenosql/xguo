<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
错误描述：<font color="red">${message }</font> 
<a href="${pageContext.request.contextPath}/admin">返回登录</a>|<a href="${pageContext.request.contextPath}/getAllCategorys">返回首页</a>
</body>
</html>