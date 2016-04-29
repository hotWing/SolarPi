package com.solarpi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solarpi.dao.CityDao;
import com.solarpi.model.City;
import com.solarpi.service.CityService;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityDao cityDao;
	
	@Override
	public List<City> getCities(String country) {
		return cityDao.getCities(country);
	}
}
