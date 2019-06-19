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
	width: 600px;
	height: 50px;
	float: left;
	margin-top: 80px;
	margin-left: 10px;
}

.formDiv input{
	margin-left: 10px;
}

#sub{
	width: 100px;
	height: 50px;
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
			课程编号:<input type="text" name="courseId" />&nbsp;&nbsp;&nbsp;
			课程名称:<input type="text" name="courseName" /><br/><br/>
			课程学分:<input type="text" name="courseScore" />&nbsp;&nbsp;&nbsp;
			理论学时:<input type="text" name="courseTheory" /><br/><br/>
			实验学时:<input type="text" name="courseTest" />&nbsp;&nbsp;&nbsp;
			开课学期:<input type="text" name="courseTime" /><br/><br/>
			课程类别:<input type="text" name="courseKind" />&nbsp;&nbsp;&nbsp;
			课程性质:<input type="text" name="courseNature" /><br/><br/>
			考核方式:<input type="text" name="courseExam" />&nbsp;&nbsp;&nbsp;
			承担单位:<input type="text" name="courseCollege" /><br/><br/>
			<input type="submit" value="添加数据" id="sub"/>
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
		if(request.getParameter("courseId") != null){
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
			if(courDao.Add(course)){
				out.println("<script>alert('增加数据成功！');history.go(-1);</script>");
			}else{
				out.println("<script>alert('增加数据失败！');history.go(-1);</script>");
			}
		}
	%>
</body>
</html>