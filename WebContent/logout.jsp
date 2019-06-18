<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退出登录</title>
</head>
<body>
	<h4>您已退出登录，10秒钟后页面将自动跳转！</h4>
	<%
		Object sess = session.getAttribute("userName");
		if(sess != null){
			//销毁session对象
			session.invalidate();
			//跳转回登录页面
			response.setHeader("refresh", "10;URL=login.jsp");
		}
	%>
</body>
</html>