package Dao;

import UserInterface.User;

public interface UserDao {
	public boolean userRegister(User user);
	public User login(String username,String password);
}
