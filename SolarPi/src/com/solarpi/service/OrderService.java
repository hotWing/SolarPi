package com.solarpi.service;

import java.util.List;

import com.solarpi.model.CountryStats;
import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;
import com.solarpi.model.ProductStats;

public interface OrderService {
	public List<Order> getOrders(int page, String email);
	public int countOrders(String email);
	public Order getOrder(String orderId);
	public List<OrderDetail> getOrderDetail(String orderId);
	public void addOrder(Order order);
	public void addOrderDetail(OrderDetail orderDetial);
	public List<CountryStats> getTopSalesCountry(String productName, int topNum);
	public List<ProductStats> getProductSales();
	public void emailOrderToAdmin(Order order, List<OrderDetail> orderDetails);
}
