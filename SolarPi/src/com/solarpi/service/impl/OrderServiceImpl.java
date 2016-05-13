package com.solarpi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solarpi.controller.OrderController;
import com.solarpi.dao.OrderDao;
import com.solarpi.model.Order;
import com.solarpi.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<Order> getOrders(int page) {
		int startRow = (page - 1 ) * OrderController.PAGE_SIZE;
		return orderDao.getOrders(startRow, OrderController.PAGE_SIZE);
	}

	@Override
	public int countOrders() {
		return orderDao.countOrders();
	}

}
