package dao;

public class User {
	//定义用户的昵称
	private String userName;
	//定义用户的密码
	private String userPassWord;
	//构造方法初始化用户
	public User(String userName,String userPassWord)
	{
		this.userName = userName;
		this.userPassWord = userPassWord;
	}
	//User类的Getters和Setters方法
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassWord() {
		return userPassWord;
	}
	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}
	
}
