<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.Course"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>总学时比例统计表</title>
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

.divSpan{
	margin-top: 20px;
	margin-right: 250px;
	font-size: 25px;
	letter-spacing:3px;
}

#tabDiv{
	width: 1000px;
	margin-left:260px;
	margin-top: 25px;
	/*border: 2px solid green;*/
}
#tabDiv td{
	width: 240px;
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
	<div class="divSpan"><span>总学时比例统计表</span></div>
	<div>
		<%
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			//判断是否为合法用户
			Object sess = session.getAttribute("userName");
			if(sess == null){
				//跳转回登录页面
				response.sendRedirect("login.jsp");
			}
			//定义四年通识课必修学时
			int bGeneral[] = {0,0,0,0,0,0,0,0,0};
			//定义四年通识课选修学时
			int xGeneral[] = {0,0,0,0,0,0,0,0,0};
			//定义四年学科基础课必总学时
			int bBase[] = {0,0,0,0,0,0,0,0,0};
			//定义四年专业课必修学时
			int bProfessional[] = {0,0,0,0,0,0,0,0,0};
			//定义四年专业课选修学时
			int xProfessional[] = {0,0,0,0,0,0,0,0,0};
			//定义操作对象
			CourseDao courDao = new CourseDao();
			//接收查询到的结果
			List<Course> allSet = new ArrayList<Course>();
			//对计算的数据进行格式化处理
			DecimalFormat df=new DecimalFormat("0.00");
			allSet = courDao.queryAll();
			//使用迭代器对数据进行便利
			Iterator<Course> ite = allSet.iterator();
			//遍历迭代器中的数据
			while(ite.hasNext()){
				Course course = ite.next();
				int allTime = (Integer.parseInt(course.getCourseTheory()) + Integer.parseInt(course.getCourseTest()));
				if("大一上".equals(course.getCourseTime())){
					//通识教育必修
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[0] += allTime;
						//用数组最后一位记录每学期的总学时
						bGeneral[8] += allTime;
					//通识教育选修
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[0] += allTime;
						xGeneral[8] += allTime;
					//学科基础课必修
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[0] += allTime;
						 bBase[8] += allTime;
					//专业课必修
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[0] += allTime;
						 bProfessional[8] += allTime;
					//专业课选修
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[0] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大一下".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[1] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[1] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[1] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[1] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[1] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大二上".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[2] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[2] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[2] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[2] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[2] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大二下".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[3] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[3] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[3] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[3] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[3] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大三上".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[4] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[4] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[4] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[4] += allTime; 
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[4] += allTime;
						xProfessional[8] += allTime;;
					}
				}else if("大三下".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[5] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[5] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[5] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[5] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[5] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大四上".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[6] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[6] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[6] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[6] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[6] += allTime;
						xProfessional[8] += allTime;
					}
				}else if("大四下".equals(course.getCourseTime())){
					if("A".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						bGeneral[7] += allTime;
						bGeneral[8] += allTime;
					}else if("A".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xGeneral[7] += allTime;
						xGeneral[8] += allTime;
					}else if("B".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bBase[7] += allTime;
						 bBase[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "B".equals(course.getCourseNature())){
						 bProfessional[7] += allTime;
						 bProfessional[8] += allTime;
					}else if("C".equals(course.getCourseKind()) && "C".equals(course.getCourseNature())){
						xProfessional[7] += allTime;
						xProfessional[8] += allTime;
					}
				}
			}
			//计算总的学时
			int total = bGeneral[8] + xGeneral[8] + bBase[8] + bProfessional[8] + xProfessional[8];
			//创建总学时比例表
			out.print("<div id='tabDiv'><table border='1px'><tr><td colspan='2'>类别/学期</td><td>一</td><td>二</td>" +
			"<td>三</td><td>四</td><td>五</td><td>六</td><td>七</td><td>八</td><td>合计</td><td>所占百分比(%)</td></tr><tr>" +
			"<td rowspan='2'>通识教育课</td><td>必修</td><td>" + bGeneral[0] +"</td><td>" + 
			bGeneral[1] + "</td><td>" + bGeneral[2] + "</td><td>" + bGeneral[3] + "</td><td>" + 
			bGeneral[4] + "</td><td>" + bGeneral[5] + "</td><td>" + bGeneral[6] + "</td><td>" +
			bGeneral[7] + "</td><td>" + bGeneral[8] + "</td><td>" + df.format(bGeneral[8] * 100.0 / total) + "</td></tr>" +
			"<tr><td>选修</td><td>"+ xGeneral[0] +"</td><td>" + xGeneral[1] + "</td><td>" + xGeneral[2] + "</td><td>" + 
			xGeneral[3] + "</td><td>" + xGeneral[4] + "</td><td>" + xGeneral[5] + "</td><td>" + xGeneral[6] + 
			"</td><td>" + xGeneral[7] + "</td><td>" + xGeneral[8] + "</td><td>" + df.format(xGeneral[8] * 100.0 / total) + "</td></tr>" +
			"<tr><td>学科基础课</td><td>必修</td><td>" + bBase[0] + "</td><td>" + bBase[1] + "</td><td>" + bBase[2] + 
			"</td><td>" + bBase[3] + "</td><td>" + bBase[4] + "</td><td>" + bBase[5] + "</td><td>" + bBase[6] + 
			"</td><td>" + bBase[7] + "</td><td>" + bBase[8] + "</td><td>" + df.format(bBase[8] * 100.0 / total) + "</td></tr>" +
			"<tr><td rowspan='2'>专业课</td><td>必修</td><td>" + bProfessional[0] + "</td><td>" + bProfessional[1] + "</td><td>" + 
			bProfessional[2] + "</td><td>" + bProfessional[3] + "</td><td>" + bProfessional[4] + "</td><td>" + bProfessional[5] + "</td><td>" + 
			bProfessional[6] + "</td><td>" + bProfessional[7] + "</td><td>" + bProfessional[8] + "</td><td>" + df.format(bProfessional[8] * 100.0 / total) + "</td></tr>" +
			"<tr><td>选修</td><td>" + xProfessional[0] + "</td><td>" + xProfessional[1] +"</td><td>" + xProfessional[2] +"</td><td>" + xProfessional[3] + 
			"</td><td>" + xProfessional[4] +"</td><td>" + xProfessional[5] +"</td><td>" + xProfessional[6] +"</td><td>" + xProfessional[7] + 
			"</td><td>" + xProfessional[8] +"</td><td>" + df.format(xProfessional[8] * 100.0 / total) +"</td></tr><tr><td colspan='2'>合计</td><td>" +
			(bGeneral[0] + xGeneral[0] + bBase[0] + bProfessional[0] + xProfessional[0]) + "</td><td>" + (bGeneral[1] + xGeneral[1] + bBase[1] + bProfessional[1] + xProfessional[1]) + 
			"</td><td>" + (bGeneral[2] + xGeneral[2] + bBase[2] + bProfessional[2] + xProfessional[2]) + "</td><td>" + 
			(bGeneral[3] + xGeneral[3] + bBase[3] + bProfessional[3] + xProfessional[3]) + "</td><td>" + 
			(bGeneral[4] + xGeneral[4] + bBase[4] + bProfessional[4] + xProfessional[4]) + "</td><td>" +
			(bGeneral[5] + xGeneral[5] + bBase[5] + bProfessional[5] + xProfessional[5]) + "</td><td>" +
			(bGeneral[6] + xGeneral[6] + bBase[6] + bProfessional[6] + xProfessional[6]) + "</td><td>" +
			(bGeneral[7] + xGeneral[7] + bBase[7] + bProfessional[7] + xProfessional[7]) + "</td><td>" +
			total + "</td><td>100</td></tr></table></div>");
		%>
	</div>
</body>
</html>