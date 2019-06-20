package dao;

import java.sql.*;

import manager.User;

//实现对登录用户信息的查询
public class UserDao {
	//按用户姓名进行用户信息查询
	public User queryByName(String userName) {
		User user = null; 
		//定义SQL查询语句
		String sql = "SELECT * FROM manager WHERE userName=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		//下面是针对数据库的具体操作
		try {
			 // 连接数据库 
			 dbc = new DataBaseConnection();
			 //执行SQL语句
			 pstmt = dbc.getConnection().prepareStatement(sql);
			 pstmt.setString(1, userName);
			 // 进行数据库查询操作  
	         ResultSet rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 //查询出内容，之后将查询出的内容赋值给user对象
	        	 user = new User();
	        	 user.setUserName(rs.getString(2));
	        	 user.setUserPassWord(rs.getString(3));
	         }
	         rs.close();  
             pstmt.close();
		}catch(Exception e) {
			System.out.println("操作出现异常!" + e);
		}finally {
			// 关闭数据库连接  
            dbc.close();
		}
		return user;
	}
}
