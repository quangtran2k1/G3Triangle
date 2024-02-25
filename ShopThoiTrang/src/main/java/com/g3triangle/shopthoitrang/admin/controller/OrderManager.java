package com.g3triangle.shopthoitrang.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.g3triangle.shopthoitrang.dao.OrderDAO;
import com.g3triangle.shopthoitrang.dao.OrderDetailDAO;
import com.g3triangle.shopthoitrang.entity.Order;

@Controller 
public class OrderManager {
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO dDao;
	
	@RequestMapping("/admin/don-hang/index")
	public String index(Model model) {
		Order entity = new Order();
		
		model.addAttribute("entity",entity);
		model.addAttribute("detail",dDao.findByOrder(entity));
		model.addAttribute("list",dao.findAll());
		return "admin/donhang/index";
	}
	
	@RequestMapping("/admin/don-hang/chi-tiet/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order entity = dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("detail",dDao.findByOrder(entity));
		model.addAttribute("list",dao.findAll());
		return "admin/donhang/index";
	}
	
	
	@RequestMapping(value= {"/admin/don-hang/xoa","/admin/don-hang/xoa/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value="id", required = false) Integer id1, @PathVariable(value="id", required = false) Integer id2) {
		Integer id = (id1 != null)?id1:id2;
		dao.delete(id);
		model.addAttribute("message","Xóa thành công!");
		return "redirect:/admin/don-hang/index";
	}
}
