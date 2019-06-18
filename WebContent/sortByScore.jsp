<%@page import="manager.User"%>
<%@page import="dao.EqualsCourse"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseDao"%>
<%@page import="manager.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程查询</title>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left.jsp"></jsp:include>
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//判断是否为合法用户
		Object sess = session.getAttribute("userName");
		if(sess == null){
			response.sendRedirect("../login.jsp");
		}
		//定义课程操作对象
		CourseDao courDao = new CourseDao();
		List<Course> scoreSet = new ArrayList<Course>();
		EqualsCourse eqCourse = new EqualsCourse();
		scoreSet = courDao.sortByScore();
		//使用课程迭代器
		Iterator<Course> ite = scoreSet.iterator();
		out.print("<table border='1'><tr><td>课程编号</td><td>课程名称</td><td>课程学分</td>" + 
				"<td>理论学时</td><td>实验学时</td><td>开课学期</td>" +
				"<td>课程类别</td><td>课程性质</td><td>考核方式</td><td>承办单位</td></tr>");
		//使用迭代器进行数据的遍历
		while(ite.hasNext()){
			Course course = ite.next();
			out.print("<tr><td>"+ course.getCourseId() +"</td><td>"+ course.getCourseName() +"</td>"+
			"<td>"+ course.getCourseScore() +"</td><td>" + course.getCourseTheory() +"</td><td>"+
			course.getCourseTest() + "</td><td>" + course.getCourseTime() +"</td><td>" + 
			eqCourse.equalsKind(course.getCourseKind()) + "</td><td>" + eqCourse.equalsNature(course.getCourseNature()) +
			"</td><td>" + eqCourse.equalsExam(course.getCourseExam()) + "</td><td>" + 
			eqCourse.equalsCollege(course.getCourseCollege()) + "</td></tr>");
		}
		out.print("</table>");
	%>
</body>
</html>