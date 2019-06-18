<%@page import="dao.CTOE"%>
<%@page import="dao.CourseDao"%>
<%@page import="manager.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加课程信息</title>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left.jsp"></jsp:include>
	<form method="post">
		课程编号:<input type="text" name="courseId" /><br/>
		课程名称:<input type="text" name="courseName" /><br/>
		课程学分:<input type="text" name="courseScore" /><br/>
		理论学时:<input type="text" name="courseTheory" /><br/>
		实验学时:<input type="text" name="courseTest" /><br/>
		开课学期:<input type="text" name="courseTime" /><br/>
		课程类别:<input type="text" name="courseKind" /><br/>
		课程性质:<input type="text" name="courseNature" /><br/>
		考核方式:<input type="text" name="courseExam" /><br/>
		承担单位:<input type="text" name="courseCollege" /><br/>
		<input type="submit" value="更新"/>
	</form>
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//判断是否为合法用户
		Object sess = session.getAttribute("userName");
		if(sess == null){
			response.sendRedirect("../login.jsp");
		}
		//定义课程对象
		Course course = new Course();
		//定义课程操作对象
		CourseDao courDao = new CourseDao();
		//数据转换对象
		CTOE to = new CTOE();
		course.setCourseId(request.getParameter("courseId"));
		course.setCourseName(request.getParameter("courseName"));
		course.setCourseScore(request.getParameter("courseScore"));
		course.setCourseTheory(request.getParameter("courseTheory"));
		course.setCourseTest(request.getParameter("courseTest"));
		course.setCourseTime(request.getParameter("courseTime"));
		course.setCourseKind(request.getParameter("courseKind"));
		course.setCourseNature(request.getParameter("courseNature"));
		course.setCourseExam(request.getParameter("courseExam"));
		course.setCourseCollege(request.getParameter("courseCollege"));
		if(course.getCourseId() != null){
			if(courDao.Add(course)){
		    	 out.println("<script>alert('插入成功！');history.go(-1);</script>");
			}else{
				out.println("<script>alert('插入失败！');history.go(-1);</script>");
			}
		}
	%>
</body>
</html>