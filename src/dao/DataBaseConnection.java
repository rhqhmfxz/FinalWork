package dao;

import java.sql.*;

//实现数据库的连接与打开
public class DataBaseConnection {
	//定义数据库驱动类 
    private final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriverriver";
    //定义数据库连接URL  
    private final String DBURL = "jdbc:sqlserver://localhost:1433;Database=courseSystem";
    //定义数据库连接用户名
    private final String DBUSER = "sa" ;  
    //定义数据库连接密码  
    private final String DBPASSWORD = "sa" ;  
    //定义数据库连接对象  
    private Connection conn = null ;
    //构造方法，加载驱动 
    public DataBaseConnection(){  
        try{ 
        	//加载驱动
            Class.forName(DBDRIVER) ; 
            //建立与数据库的连接
            this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;    
        }  
        catch (Exception e){ 
        	//若加载驱动失败,进行异常处理
            System.out.println("加载驱动失败," + e);  
        }  
    }  
    // 取得数据库连接  
    public Connection getConnection(){  
        return conn ;  
    }  
    // 关闭数据库连接  
    public void close(){  
        try{  
        	//将连接关闭
            conn.close() ;  
        }catch (Exception e){
        	//若连接关闭失败,进行异常处理
            System.out.println("数据库连接关闭失败," + e);  
        }         
    }  
}  
