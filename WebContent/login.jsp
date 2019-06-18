<%@page import="manager.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<style type="text/css">
body{
    background: url("images/bg.jpg") no-repeat fixed;
    /* set background tensile */
    background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    margin: 0;
    padding: 0;
}

#content{
    background-color: rgba(255, 255, 255, 0.95);
    width: 420px;
    height: 300px;
    border: 1px solid #000000;
    border-radius: 6px;
    padding: 10px;
    margin-top: 15%;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

.login-header{
    width: 100%;
    height: 48px;
    margin-bottom: 20px;
    border-bottom: 1px solid #dcdcdc;
}

.login-header img{
    width: 100px;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

.login-input-box{
    margin-top: 12px;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
    display: inline-block;
}

.login-input-box input{
    width: 340px;
    height: 32px;
    margin-left: 18px;
    border: 1px solid #dcdcdc;
    border-radius: 4px;
    padding-left: 42px;
}

.login-input-box input:hover{
    border: 1px solid #ff7d0a;
}

.login-input-box input:after{
    border: 1px solid #ff7d0a;
}

.login-input-box .icon{
    width: 24px;
    height: 24px;
    margin: 6px 4px 6px 24px;
    background-color: #ff7d0a;
    display: inline-block;
    position: absolute;
    border-right: 1px solid #dcdcdc;
}

.login-input-box .icon.icon-user{
    background: url("images/user.png");
}

.login-input-box .icon.icon-password{
    background: url("images/password.png");
}


.login-button-box{
    margin-top: 12px;
    width: 100%;
    margin-left: auto;
    margin-right: auto;
    display: inline-block;
}

.login-button-box input{
    background-color: #ff7d0a;
    color: #ffffff;
    font-size: 16px;
    width: 386px;
    height: 40px;
    margin-left: 18px;
    border: 1px solid #ff7d0a;
    border-radius: 4px;
}

.login-button-box input:hover{
    background-color: #ee7204;
}

.login-button-box input:active{
    background-color: #ee7204;
}

.logon-box{
    margin-top: 20px;
    text-align: center;
}

.logon-box a{
    margin: 30px;
    color: #4a4744;
    font-size: 13px;
    text-decoration: none;
}

.logon-box a:hover{
    color: #ff7d0a;
}

.logon-box a:active{
    color: #ee7204;
}
</style>
</head>
<body>
<div id="content">
	<div class="login-header">
        <img src="./images/logo.png" height="40px"/>
    </div>
	<form method="post">
		<div class="login-input-box">
			<span class="icon icon-user"></span>
			<input type="text" name="userName" placeholder="Please enter your userName"/>
		</div>
		<div class="login-input-box">
			<span class="icon icon-password"></span>
			<input type="password" name="userPassWord" placeholder="Please enter your passWord"/>
		</div>
		<div class="login-button-box">
    		<input type="submit" value="Login"/>
    	</div>
	</form>
    <div class="logon-box">
        <a href="">Forgot?</a>
        <a href="">Register</a>
    </div>
</div>
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