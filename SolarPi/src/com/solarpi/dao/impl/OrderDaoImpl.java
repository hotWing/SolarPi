package com.solarpi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpi.model.Order;

@Repository
public class OrderDaoImpl implements com.solarpi.dao.OrderDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Order> getOrders(int startRow, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		List<Order> orders = sqlSession.selectList("com.solarpi.mapper.OrderMapper.getOrders", params);
		return orders;
	}

	@Override
	public int countOrders() {
		return sqlSession.selectOne("com.solarpi.mapper.OrderMapper.countOrders");
	}

}
