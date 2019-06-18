<%@page import="dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除课程信息</title>
<style type="text/css">
body{
    background: url("images/sbg.jpg") no-repeat fixed;
    /* set background tensile */
    background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    margin: 0;
    padding: 0;
    text-align: center;
}

.left{
	width:430px;
	/*border: 3px solid blue;*/
	float:left;
}

.formDiv{
	width: 400px;
	height: 50px;
	float: left;
	margin-top: 80px;
	margin-left: 130px;
}
</style>
</head>
<body>
	<div style="margin-top: 30px;">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	<div class="formDiv">
		<form method="post">
			请输入课程代码:<input type="text" name="courseId"/>
			<input type="submit" value="删除"/>
		</form>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//判断是否为合法用户
		Object sess = session.getAttribute("userName");
		if(sess == null){
			//跳转回登录页面
			response.sendRedirect("login.jsp");
		}
		//要删除课程的课程代码
		String courseId = request.getParameter("courseId");
		if(courseId != null){
			CourseDao courDao = new CourseDao();
			if(courDao.Delete(courseId)){
				out.println("<script>alert('删除成功！');history.go(-1);</script>");
			}else{
				out.println("<script>alert('删除失败！');history.go(-1);</script>");
			}
		}	
	%>
</body>
</html>