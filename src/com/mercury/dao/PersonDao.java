package com.mercury.dao;

import java.util.List;

import com.mercury.beans.User;

public interface PersonDao {
	public User findPersonByEmail(String email);
	public void addPerson(User user);
	public User activeUser(String activation);
	public int checkActivationCode (String activation);
	public void updatePerson(User user);
	public int countUser();
	public int countActivedUser();
	public List<User> findAllUser();
	public User findPersonByPassword(String md5);
}
