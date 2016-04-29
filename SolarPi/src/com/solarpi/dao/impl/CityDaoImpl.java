package com.solarpi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.dao.CityDao;
import com.solarpi.model.City;

@Repository
public class CityDaoImpl implements CityDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<City> getCities(String country) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", country);
		
		List<City> cities = sqlSession.selectList("com.solarpi.mapper.CityMapper.getCities",params);
		return cities;
	}

}
