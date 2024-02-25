package com.g3triangle.shopthoitrang.dao;

import java.util.List;

import com.g3triangle.shopthoitrang.entity.Customer;
import com.g3triangle.shopthoitrang.entity.Order;
import com.g3triangle.shopthoitrang.entity.OrderDetail;

public interface OrderDAO {
	Order findById(Integer id);
	List<Order> findAll();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(Customer user);
}
