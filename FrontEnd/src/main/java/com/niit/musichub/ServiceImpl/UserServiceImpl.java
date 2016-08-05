package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.UserDAO;
import com.niit.musichub.Service.UserService;
import com.niit.musichub.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	public void addUser(User user) {
		userDAO.addUser(user);
	}

	public User getUserById(int user_id) {
		return userDAO.getUserById(user_id);
	}

	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	public User getUserByUsername(String user_name) {
		return userDAO.getUserByUsername(user_name);
	}

	public void saveOrUpdate(User user) {
		userDAO.saveOrUpdate(user);
		
	}

	public void deleteUser(User user) {
		userDAO.deleteUser(user);
	}

}
