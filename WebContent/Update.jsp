<%@page import="dao.EqualsCourse"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DataBaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.CTOE"%>
<%@page import="manager.Course"%>
<%@page import="dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程信息更改</title>
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
		<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//判断是否为合法用户
		Object sess = session.getAttribute("userName");
		if(sess == null){
			//跳转回登录页面
			response.sendRedirect("login.jsp");
		}
		String courseId = request.getParameter("courseId");
		String courseName = request.getParameter("courseName");
		String courseScore = request.getParameter("courseScore");
		String courseTheory = request.getParameter("courseTheory");
		String courseTest = request.getParameter("courseTest");
		String courseTime = request.getParameter("courseTime");
		String courseKind = request.getParameter("courseKind");
		String courseNature = request.getParameter("courseNature");
		String courseExam = request.getParameter("courseExam");
		String courseCollege = request.getParameter("courseCollege");
		
		//对课程信息进行查询
		if(courseName == null || "".equals(courseName)){
			PreparedStatement pstmt = null;
			DataBaseConnection dbc = null;
			//对数据进行转化
			EqualsCourse eqlcourse = new EqualsCourse();
			//下面是针对数据库的具体操作
			try {
			  // 连接数据库 
			  dbc = new DataBaseConnection();
			  String sql = "SELECT * FROM course WHERE courseId=?";
			  pstmt = dbc.getConnection().prepareStatement(sql);
			  pstmt.setString(1, courseId);
			  // 进行数据库查询操作  
			  ResultSet rs = pstmt.executeQuery();
			  if(rs.next()) {
				  //记录下查询出内容
				  courseId = rs.getString(1);
				  courseName = rs.getString(2);
				  courseScore = rs.getString(3);
				  courseTheory = rs.getString(4);
				  courseTest = rs.getString(5);
				  courseTime = rs.getString(6);
				  courseKind = eqlcourse.equalsKind(rs.getString(7));
				  courseNature = eqlcourse.equalsNature(rs.getString(8));
				  courseExam = eqlcourse.equalsExam(rs.getString(9));
				  courseCollege = eqlcourse.equalsCollege(rs.getString(10));
			  }
			  rs.close();  
			  pstmt.close();
			}catch(Exception e){
				out.print(e);
			}
		}else{
			PreparedStatement pstmt = null;  
		    DataBaseConnection dbc = null;
		  	//对数据进行转化
			CTOE to = new CTOE();
		 	// 下面是针对数据库的具体操作  
	        try{  
	        	String sql = "UPDATE course SET courseName=?,courseScore=?,courseTheory=?,courseTest=?,courseTime=?,courseKind=?,courseNature=?,courseExam=?,courseCollege=? WHERE courseId=?;";
	            // 连接数据库  
	            dbc = new DataBaseConnection();  
	            pstmt = dbc.getConnection().prepareStatement(sql);
	            pstmt.setString(1, courseName);
	            pstmt.setString(2, courseScore);
	            pstmt.setString(3, courseTheory);
	            pstmt.setString(4, courseTest);
	            pstmt.setString(5, courseTime);
	            pstmt.setString(6, to.CTOEOfKind(courseKind));
	            pstmt.setString(7, to.CTOEOfNature(courseNature));
	            pstmt.setString(8, to.CTOEOfExam(courseExam));
	            pstmt.setString(9, to.CTOEOfCollege(courseCollege));
	            pstmt.setString(10, courseId);
	            //进行数据库更新操作 
	            if(courseId != null){
	            	int result = pstmt.executeUpdate();
	            	if(result > 0) {
		            	 out.println("<script>alert('更新成功！');history.go(-1);</script>");
		            }else{
		            	out.println("<script>alert('更新失败！');history.go(-1);</script>");
		            }
	            }
	            pstmt.close(); 
	        }catch (Exception e) {
				System.out.println("操作出现异常，" + e);
			}finally {
				 // 关闭数据库连接 
	            dbc.close();  
			}
		}
		%>
	<div class="formDiv">
		<form method="post">
			课程编号:<input type="text" name="courseId" value="<%= courseId%>"/>&nbsp;&nbsp;&nbsp;
			课程名称:<input type="text" name="courseName" value="<%= courseName%>"/><br/><br/>
			课程学分:<input type="text" name="courseScore" value="<%= courseScore%>"/>&nbsp;&nbsp;&nbsp;
			理论学时:<input type="text" name="courseTheory" value="<%= courseTheory%>"/><br/><br/>
			实验学时:<input type="text" name="courseTest" value="<%= courseTest%>"/>&nbsp;&nbsp;&nbsp;
			开课学期:<input type="text" name="courseTime" value="<%= courseTime%>"/><br/><br/>
			课程类别:<input type="text" name="courseKind" value="<%= courseKind%>"/>&nbsp;&nbsp;&nbsp;
			课程性质:<input type="text" name="courseNature" value="<%= courseNature%>"/><br/><br/>
			考核方式:<input type="text" name="courseExam" value="<%= courseExam%>"/>&nbsp;&nbsp;&nbsp;
			承担单位:<input type="text" name="courseCollege" value="<%= courseCollege%>"/><br/><br/>
			<input type="submit" value="更新数据" id="sub"/>
		</form>
	</div>
</body>
</html>