package com.solarpi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solarpi.controller.OrderController;
import com.solarpi.dao.OrderDao;
import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<Order> getOrders(int page, String email) {
		int startRow = (page - 1 ) * OrderController.PAGE_SIZE;
		return orderDao.getOrders(startRow, OrderController.PAGE_SIZE, email);
	}

	@Override
	public int countOrders(String email) {
		return orderDao.countOrders(email);
	}


	@Override
	public Order getOrder(String orderId) {
		return orderDao.getOrder(orderId);
	}

	@Override
	public List<OrderDetail> getOrderDetail(String orderId) {
		return orderDao.getOrderDetail(orderId);
	}

}
