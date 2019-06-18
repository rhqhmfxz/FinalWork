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
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left.jsp"></jsp:include>
		<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
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
	            int result = pstmt.executeUpdate();
	            if(result > 0) {
	            	out.print("修改成功!");
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
	<form method="post">
		课程编号:<input type="text" name="courseId" value="<%= courseId%>"/><br/>
		课程名称:<input type="text" name="courseName" value="<%= courseName%>"/><br/>
		课程学分:<input type="text" name="courseScore" value="<%= courseScore%>"/><br/>
		理论学时:<input type="text" name="courseTheory" value="<%= courseTheory%>"/><br/>
		实验学时:<input type="text" name="courseTest" value="<%= courseTest%>"/><br/>
		开课学期:<input type="text" name="courseTime" value="<%= courseTime%>"/><br/>
		课程类别:<input type="text" name="courseKind" value="<%= courseKind%>"/><br/>
		课程性质:<input type="text" name="courseNature" value="<%= courseNature%>"/><br/>
		考核方式:<input type="text" name="courseExam" value="<%= courseExam%>"/><br/>
		承担单位:<input type="text" name="courseCollege" value="<%= courseCollege%>"/><br/>
		<input type="submit" value="更新"/>
	</form>
	
</body>
</html>