package com.solarpi.service;

import java.util.List;

import com.solarpi.model.Order;

public interface OrderService {
	public List<Order> getOrders(int page);
	public int countOrders();
}
