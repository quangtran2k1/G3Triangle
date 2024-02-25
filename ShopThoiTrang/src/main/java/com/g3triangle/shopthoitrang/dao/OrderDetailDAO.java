package com.g3triangle.shopthoitrang.dao;

import java.util.List;

import com.g3triangle.shopthoitrang.entity.Order;
import com.g3triangle.shopthoitrang.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);
	List<OrderDetail> findAll();
	OrderDetail create(OrderDetail entity);
	void update(OrderDetail entity);
	OrderDetail delete(Integer id);
	List<OrderDetail> findByOrder(Order order);
}
