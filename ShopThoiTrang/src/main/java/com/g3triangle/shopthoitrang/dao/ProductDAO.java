package com.g3triangle.shopthoitrang.dao;

import java.util.List;

import com.g3triangle.shopthoitrang.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);
	List<Product> findAll();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	List<Product> findByCategoryId(Integer categoryId);
	List<Product> findByKey(String keywords);
	List<Product> findByIds(String ids);
}
