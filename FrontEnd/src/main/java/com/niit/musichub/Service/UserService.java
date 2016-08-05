package com.niit.musichub.Service;

import java.util.List;

import com.niit.musichub.model.User;

public interface UserService {

	void addUser(User user);

    User getUserById(int user_id);

    public void saveOrUpdate(User user);
    
    List<User> getAllUsers();

    User getUserByUsername(String username);
    
    public void deleteUser(User user);
}
