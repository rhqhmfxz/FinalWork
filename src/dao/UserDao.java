package dao;

import java.sql.*;

import manager.User;

//ʵ�ֶԵ�¼�û���Ϣ�Ĳ�ѯ
public class UserDao {
	//���û����������û���Ϣ��ѯ
	public User queryByName(String userName) {
		User user = null; 
		//����SQL��ѯ���
		String sql = "SELECT * FROM manager WHERE userName=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		//������������ݿ�ľ������
		try {
			 // �������ݿ� 
			 dbc = new DataBaseConnection();
			 //ִ��SQL���
			 pstmt = dbc.getConnection().prepareStatement(sql);
			 pstmt.setString(1, userName);
			 // �������ݿ��ѯ����  
	         ResultSet rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 //��ѯ�����ݣ�֮�󽫲�ѯ�������ݸ�ֵ��user����
	        	 user = new User();
	        	 user.setUserName(rs.getString(2));
	        	 user.setUserPassWord(rs.getString(3));
	         }
	         rs.close();  
             pstmt.close();
		}catch(Exception e) {
			System.out.println("���������쳣!" + e);
		}finally {
			// �ر����ݿ�����  
            dbc.close();
		}
		return user;
	}
}
