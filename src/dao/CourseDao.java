package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import manager.Course;

public class CourseDao {
	//根据课程编号进行数据查询
	public List<Course> queryById(String courseId){
		//定义接受查询到的数据的载体
		List<Course> idSet = new ArrayList<Course>();
		//定义SQL查询语句
		String sql = "SELECT * FROM course WHERE courseId LIKE ?";
		PreparedStatement pstmt = null;  
        DataBaseConnection dbc = null;
        //下面是针对数据库的具体操作
        try {
        	// 连接数据库  
            dbc = new DataBaseConnection();  
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,"%" + courseId + "%");
            // 进行数据库查询操作  
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	//查询出内容，之后将查询出的内容赋值给user对象 
            	Course course = new Course();
            	course.setCourseId(rs.getString(1));
            	course.setCourseName(rs.getString(2));
            	course.setCourseScore(rs.getString(3));
            	course.setCourseTheory(rs.getString(4));
            	course.setCourseTest(rs.getString(5));
            	course.setCourseTime(rs.getString(6));
            	course.setCourseKind(rs.getString(7));
            	course.setCourseNature(rs.getString(8));
            	course.setCourseExam(rs.getString(9));
            	course.setCourseCollege(rs.getString(10));
            	//将查询出来的数据加入到List对象之中  
            	idSet.add(course);  
            }
            rs.close();  
            pstmt.close();
        }catch(Exception e) {
        	System.out.println("操作出现异常!" + e);
        }finally {
        	//关闭数据库连接  
            dbc.close(); 
		}
		return idSet;
	}	
	
	//根据课程名称进行数据查询
	public List<Course> queryByName(String courseName){
		//定义接受查询到的数据的载体
		List<Course> nameSet = new ArrayList<Course>();
		//定义SQL查询语句
		String sql = "SELECT * FROM course WHERE courseName LIKE ?";
		PreparedStatement pstmt = null;  
        DataBaseConnection dbc = null;
        //下面是针对数据库的具体操作
        try {
        	// 连接数据库  
            dbc = new DataBaseConnection();  
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,"%" + courseName + "%");
            // 进行数据库查询操作  
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	//查询出内容，之后将查询出的内容赋值给user对象 
            	Course course = new Course();
            	course.setCourseId(rs.getString(1));
            	course.setCourseName(rs.getString(2));
            	course.setCourseScore(rs.getString(3));
            	course.setCourseTheory(rs.getString(4));
            	course.setCourseTest(rs.getString(5));
            	course.setCourseTime(rs.getString(6));
            	course.setCourseKind(rs.getString(7));
            	course.setCourseNature(rs.getString(8));
            	course.setCourseExam(rs.getString(9));
            	course.setCourseCollege(rs.getString(10));
            	//将查询出来的数据加入到List对象之中  
            	nameSet.add(course);  
            }
            rs.close();  
            pstmt.close();
        }catch(Exception e) {
        	System.out.println("操作出现异常!" + e);
        }finally {
        	//关闭数据库连接  
            dbc.close(); 
		}
		return nameSet;
	}
	
	//根据课程开课时间进行数据排序
	public List<Course> sortByTime(){
		//定义接受查询到的数据的载体
		List<Course> timeSet = new ArrayList<Course>();
		//定义SQL查询语句并根据courseTime列进行数据排序
		String sql = "SELECT * FROM course ORDER BY courseTime";
		PreparedStatement pstmt = null;  
        DataBaseConnection dbc = null;
        //下面是针对数据库的具体操作
        try {
        	// 连接数据库  
            dbc = new DataBaseConnection();  
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作  
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	//查询出内容，之后将查询出的内容赋值给user对象 
            	Course course = new Course();
            	course.setCourseId(rs.getString(1));
            	course.setCourseName(rs.getString(2));
            	course.setCourseScore(rs.getString(3));
            	course.setCourseTheory(rs.getString(4));
            	course.setCourseTest(rs.getString(5));
            	course.setCourseTime(rs.getString(6));
            	course.setCourseKind(rs.getString(7));
            	course.setCourseNature(rs.getString(8));
            	course.setCourseExam(rs.getString(9));
            	course.setCourseCollege(rs.getString(10));
            	//将查询出来的数据加入到List对象之中  
            	timeSet.add(course);  
	           }
	           rs.close();  
	           pstmt.close();
	       }catch(Exception e) {
	       	System.out.println("操作出现异常!" + e);
	       }finally {
	       	//关闭数据库连接  
            dbc.close(); 
           }
		return timeSet;
	}
	
	//根据课程开课时间进行数据排序
	public List<Course> sortByScore(){
		//定义接受查询到的数据的载体
		List<Course> scoreSet = new ArrayList<Course>();
		//定义SQL查询语句并根据courseTime列进行数据排序
		String sql = "SELECT * FROM course ORDER BY courseScore";
		PreparedStatement pstmt = null;  
        DataBaseConnection dbc = null;
        //下面是针对数据库的具体操作
        try {
        	// 连接数据库  
            dbc = new DataBaseConnection();  
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作  
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	//查询出内容，之后将查询出的内容赋值给user对象 
            	Course course = new Course();
            	course.setCourseId(rs.getString(1));
            	course.setCourseName(rs.getString(2));
            	course.setCourseScore(rs.getString(3));
            	course.setCourseTheory(rs.getString(4));
            	course.setCourseTest(rs.getString(5));
            	course.setCourseTime(rs.getString(6));
            	course.setCourseKind(rs.getString(7));
            	course.setCourseNature(rs.getString(8));
            	course.setCourseExam(rs.getString(9));
            	course.setCourseCollege(rs.getString(10));
            	//将查询出来的数据加入到List对象之中  
            	scoreSet.add(course);  
	           }
	           rs.close();  
	           pstmt.close();
	       }catch(Exception e) {
	       	System.out.println("操作出现异常!" + e);
	       }finally {
	       	//关闭数据库连接  
            dbc.close(); 
           }
		return scoreSet;
	}
	
	//根据课程开课时间进行数据排序
	public List<Course> sortByExam(){
		//定义接受查询到的数据的载体
		List<Course> examSet = new ArrayList<Course>();
		//定义SQL查询语句并根据courseTime列进行数据排序
		String sql = "SELECT * FROM course ORDER BY courseExam";
		PreparedStatement pstmt = null;  
	    DataBaseConnection dbc = null;
	    //下面是针对数据库的具体操作
	    try {
	    	// 连接数据库  
	    	dbc = new DataBaseConnection();  
	        pstmt = dbc.getConnection().prepareStatement(sql);
	        // 进行数据库查询操作  
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
	       	//查询出内容，之后将查询出的内容赋值给user对象 
         	Course course = new Course();
          	course.setCourseId(rs.getString(1));
            course.setCourseName(rs.getString(2));
	        course.setCourseScore(rs.getString(3));
	        course.setCourseTheory(rs.getString(4));
	        course.setCourseTest(rs.getString(5));
	        course.setCourseTime(rs.getString(6));
	        course.setCourseKind(rs.getString(7));
	        course.setCourseNature(rs.getString(8));
	        course.setCourseExam(rs.getString(9));
	        course.setCourseCollege(rs.getString(10));
	        //将查询出来的数据加入到List对象之中  
	        examSet.add(course);  
		    }
		    rs.close();  
		    pstmt.close();
		}catch(Exception e) {
		    System.out.println("操作出现异常!" + e);
		}finally {
		    //关闭数据库连接  
	        dbc.close(); 
	    }
			return examSet;
	}
/*------------------------------------------------------------------------------------*/
	
}
