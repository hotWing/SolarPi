package com.solarpi.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.dao.CountryDao;
import com.solarpi.model.Country;

@Repository
public class CountryDaoImpl implements CountryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Country> getCountries() {
		List<Country> countries = sqlSession.selectList("com.solarpi.mapper.CountryMapper.getCountries");
		return countries;
	}

}
