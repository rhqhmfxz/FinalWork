<%@page import="dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除课程信息</title>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left.jsp"></jsp:include>
	<div>
		<form method="post">
			请输入课程代码:<input type="text" name="courseId"/><br/>
			<input type="submit" value="删除"/>
		</form>
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			//判断是否为合法用户
			Object sess = session.getAttribute("userName");
			if(sess == null){
				response.sendRedirect("../login.jsp");
			}
			//要删除课程的课程代码
			String courseId = request.getParameter("courseId");
			if(courseId != null || !("".equals(courseId))){
				CourseDao courDao = new CourseDao();
				if(courDao.Delete(courseId)){
					out.println("<script>alert('删除成功！');history.go(-1);</script>");
				}else{
					out.println("<script>alert('删除失败！');history.go(-1);</script>");
				}
			}	
		%>
	</div>
</body>
</html>