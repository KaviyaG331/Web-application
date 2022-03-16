package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import UserInterface.User;

public class UserDaoImplement implements UserDao{
	
	private Connection connection;

	public UserDaoImplement(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean userRegister(User user) {
		boolean status=false;
		try {
			String userquery="insert into user(name,email,phonenumber,password,repassword) values(?,?,?,?,?)";
			PreparedStatement preparestatement=connection.prepareStatement(userquery);
			preparestatement.setString(1,user.getUsername());
			preparestatement.setString(2,user.getEmail());
			preparestatement.setString(3,user.getPhonenumber());
			preparestatement.setString(4,user.getPassword());
			preparestatement.setString(5,user.getRepassword());
			
			int index=preparestatement.executeUpdate();
			if(index==1) {
				status=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public User login(String username, String password) {
		User user=null;
		try {
			String userquery="select * from user where name=? and password=?";
			PreparedStatement preparestatement=connection.prepareStatement(userquery);
			preparestatement.setString(1,username);
			preparestatement.setString(2,password);
			ResultSet resultset=preparestatement.executeQuery();
			while(resultset.next()) {
				user=new User();
				user.setUsername(resultset.getString(1));
				user.setEmail(resultset.getString(2));
				user.setPassword(resultset.getString(3));
				user.setRepassword(resultset.getString(4));
				user.setPhonenumber(resultset.getString(5));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}