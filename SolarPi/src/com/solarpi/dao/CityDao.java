package com.solarpi.dao;

import java.util.List;

import com.solarpi.model.City;

public interface CityDao {
	public List<City> getCities(String code);
}
