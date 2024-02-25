package com.g3triangle.shopthoitrang.dao;

import java.util.List;

import com.g3triangle.shopthoitrang.entity.Customer;

public interface CustomerDAO {
	Customer findById(String id);
	List<Customer> findAll();
	Customer create(Customer entity);
	void update(Customer entity);
	Customer delete(String id);
}
