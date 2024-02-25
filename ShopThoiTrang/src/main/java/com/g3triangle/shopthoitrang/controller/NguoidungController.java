package com.g3triangle.shopthoitrang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.g3triangle.shopthoitrang.dao.CustomerDAO;
import com.g3triangle.shopthoitrang.dao.OrderDAO;
import com.g3triangle.shopthoitrang.dao.OrderDetailDAO;
import com.g3triangle.shopthoitrang.entity.Customer;
import com.g3triangle.shopthoitrang.entity.Order;
import com.g3triangle.shopthoitrang.entity.OrderDetail;

@Controller
public class NguoidungController {
	@Autowired
	CustomerDAO dao;
	@Autowired
	OrderDAO oDao;
	@Autowired
	OrderDetailDAO dDao;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/nguoi-dung/{id}")
	public String User(Model model, @PathVariable("id") String id) {
		Customer user = dao.findById(id);
		model.addAttribute("user",user);
		return "nguoidung/view";
	}	
	
	@RequestMapping("/nguoi-dung/sua-thong-tin/{id}")
	public String edit() {
		return "nguoidung/edit";
	}
	
	@RequestMapping("/nguoi-dung/doi-mat-khau/{id}")
	public String changePass() {
		return "nguoidung/change";
	}
	
	@GetMapping("/nguoi-dung/don-hang")
	public String list(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		List<Order> orders = oDao.findByUser(user);
		model.addAttribute("orders",orders);
		return "nguoidung/order";
	}
	
	@GetMapping("/nguoi-dung/chi-tiet-don-hang/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = oDao.findById(id);
		List<OrderDetail> detail = dDao.findByOrder(order);
		model.addAttribute("order",order);
		model.addAttribute("detail",detail);
		return "nguoidung/detail";
	}
}
