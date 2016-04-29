package com.solarpi.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.dao.UserDao;
import com.solarpi.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void add(User user) {
		sqlSession.insert("com.solarpi.mapper.UserMapper.add", user);
	}

	@Override
	public User getUser(String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		return sqlSession.selectOne("com.solarpi.mapper.UserMapper.getUser", params);
	}

	@Override
	public void update(User user) {
		sqlSession.update("com.solarpi.mapper.UserMapper.update",user);
	}


}
