package com.solarpi.service;

import java.util.List;

import com.solarpi.model.City;

public interface CityService {
	public List<City> getCities(String country);
}
