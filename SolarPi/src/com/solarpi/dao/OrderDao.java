package com.solarpi.dao;

import java.util.List;

import com.solarpi.model.Order;

public interface OrderDao {
	public List<Order> getOrders(int startRow, int pAGE_SIZE);

	public int countOrders();
}
