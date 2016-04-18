package com.solarpi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solarpi.dao.CountryDao;
import com.solarpi.model.Country;
import com.solarpi.service.CountryService;

@Service
public class CountryServiceImpl implements CountryService {

	@Autowired
	private CountryDao countryDao;
	
	@Override
	public List<Country> getCountries() {
		return countryDao.getCountries();
	}

}
