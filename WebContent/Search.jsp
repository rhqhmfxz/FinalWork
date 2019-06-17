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
	<!-- 设置下面的CSS -->
	<form method="post">
		请输入信息:<input type="text"/>
		<input type="submit" value="按课程代码查询"/>
		<input type="submit" value="按课程名称查询"/><br/>
		查看方式:<input type="submit" value="按开课学期查看"/>
		<input type="submit" value="按课程学分查看"/>
		<input type="submit" value="按考核方式查看"/> 
	</form>
	<%=session.getAttribute("userName") %>
</body>
</html>