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

.tda{
	color:black;
	display:block;
	width:35px;
	height:20px;
	margin:auto;
}

.tda:link, .tda:visited{
	text-decoration:none; 
	background-color: #6B6854;
	color:white;
} 

.tda:hover{
	background-color: orange;
}

.left{
	width:430px;
	/*border: 3px solid blue;*/
	float:left;
}

.right{
	width:400px;
	margin-top: 20px;
	margin-bottom: 30px;
	margin-left:auto;
	margin-right:auto;
	/*border: 3px solid red;*/
}


#tabDiv{
	width: 900px;
	margin-left:450px;
	/*border: 2px solid green;*/
}
#tabDiv td{
	width: 180px;
}

table{
	border-collapse: collapse;
    margin: 0 auto;
    text-align: center;
}
table td, table th{
    border: 1px solid #cad9ea;
    color: #666;
    height: 30px;
}
table thead th{
    background-color: #CCE8EB;
    width: 100px;
}
table tr:nth-child(odd){
    background: #fff;
}
table tr:nth-child(even){
    background: #F5FAFA;
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
		
	<div class="right">
		<form method="post">
			请输入课程编号:&nbsp;&nbsp;&nbsp;<input type="text" name="info"/>
			<input type="submit" value="查询"/> 
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
			String courseId = request.getParameter("info");
			//定义课程操作对象
			CourseDao courDao = new CourseDao();
			List<Course> idSet = new ArrayList<Course>();
			//数据格式化
			EqualsCourse eqCourse = new EqualsCourse();
			idSet = courDao.queryById(courseId);
			//使用课程迭代器
			Iterator<Course> ite = idSet.iterator();
			out.print("<div id='tabDiv'><table border=1px;><tr><td>课程编号</td><td>课程名称</td><td>课程学分</td>" + 
					"<td>理论学时</td><td>实验学时</td><td>开课学期</td>" +
					"<td>课程类别</td><td>课程性质</td><td>考核方式</td><td>承办单位</td>"+
					"<td>修改</td></tr>");
			//使用迭代器进行数据的遍历
			while(ite.hasNext()){
				Course course = ite.next();
				out.print("<tr><td>"+ course.getCourseId() +"</td><td>"+ course.getCourseName() +"</td>"+
				"<td>"+ course.getCourseScore() +"</td><td>" + course.getCourseTheory() +"</td><td>"+
				course.getCourseTest() + "</td><td>" + course.getCourseTime() +"</td><td>" + 
				eqCourse.equalsKind(course.getCourseKind()) + "</td><td>" + eqCourse.equalsNature(course.getCourseNature()) +
				"</td><td>" + eqCourse.equalsExam(course.getCourseExam()) + "</td><td>" + 
				eqCourse.equalsCollege(course.getCourseCollege()) + "</td><td><a href='Update.jsp?courseId="+ course.getCourseId() +"' class='tda'/>修改</td></tr>");
			}
			out.print("</table></div>");
		%>
</body>
</html>