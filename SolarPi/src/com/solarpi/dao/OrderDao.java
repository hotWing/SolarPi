package com.solarpi.dao;

import java.util.List;

import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;

public interface OrderDao {
	public List<Order> getOrders(int startRow, int pAGE_SIZE, String email);

	public int countOrders(String email);

	public Order getOrder(String orderId);

	public List<OrderDetail> getOrderDetail(String orderId);
}
