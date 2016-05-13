package com.solarpi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.model.Order;
import com.solarpi.model.OrderDetail;

@Repository
public class OrderDaoImpl implements com.solarpi.dao.OrderDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Order> getOrders(int startRow, int pageSize, String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		params.put("email", email);
		
		List<Order> orders = sqlSession.selectList("com.solarpi.mapper.OrderMapper.getOrders", params);
		return orders;
	}

	@Override
	public int countOrders(String email) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		
		return sqlSession.selectOne("com.solarpi.mapper.OrderMapper.countOrders",params);
	}

	@Override
	public Order getOrder(String orderId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		return sqlSession.selectOne("com.solarpi.mapper.OrderMapper.getOrder",params);
	}

	@Override
	public List<OrderDetail> getOrderDetail(String orderId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		return sqlSession.selectList("com.solarpi.mapper.OrderMapper.getOrderDetail",params);
	}

}
