<%@page import="manager.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
</head>
<body>
<!-- 设置下面的CSS -->
	<div>欢迎登录</div>
	<form method="post">
		用户名:<input type="text" name="userName"/><br/>
		密&nbsp;码:<input type="password" name="userPassWord"/><br/>
		<input type="submit" value="登录"/>
	</form>
	<%
		//获取用户输入的用户名
		String userName = request.getParameter("userName");
		//获取用户输入的用户密码
		String userPassWord = request.getParameter("userPassWord");
		//判断用户输入的用户名或密码是否为空
		if(userName != null && userPassWord != null){
			//定义用户对象
			User user = new User();
			//定义用户操作对象
			UserDao userDao = new UserDao();
			//根据用户输入的用户名对数据库的数据进行查询
			user = userDao.queryByName(userName);
			//对用户输入的信息进行登录判断
			if(userName.equals(user.getUserName()) && userPassWord.equals(user.getUserPassWord())){
				//保存登录信息
				session.setAttribute("userName", userName);
				response.sendRedirect("QueryById.jsp");
			}else{
				response.sendRedirect("login.jsp");
			}
		}
	%>
</body>
</html>