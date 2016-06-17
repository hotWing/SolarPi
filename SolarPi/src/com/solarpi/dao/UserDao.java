package com.solarpi.dao;

import com.solarpi.model.User;

public interface UserDao {
	public void add(User user);

	public User getUser(String email);

	public void update(User user);

	public int getIsActived(String email);

}
