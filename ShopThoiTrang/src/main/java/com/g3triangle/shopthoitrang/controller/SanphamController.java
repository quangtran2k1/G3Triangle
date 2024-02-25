package com.g3triangle.shopthoitrang.controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.g3triangle.shopthoitrang.dao.ProductDAO;
import com.g3triangle.shopthoitrang.entity.Product;
import com.g3triangle.shopthoitrang.service.CookieService;

@Controller
public class SanphamController {
	@Autowired
	ProductDAO pDao;
	
	@Autowired
	CookieService cookie;
	
	@RequestMapping("/san-pham/tat-ca-san-pham")
	public String listByAllProduct(Model model) {
		List<Product> list = pDao.findAll();
		model.addAttribute("list",list);
		return "sanpham/list";
	}
	
	@RequestMapping("/san-pham/loai-san-pham/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pDao.findByCategoryId(categoryId);
		model.addAttribute("list",list);
		return "sanpham/list";
	}
	
	@RequestMapping("/san-pham/chi-tiet/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product prod = pDao.findById(id);
		model.addAttribute("prod",prod);
		List<Product> list = pDao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list",list);
		prod.setViewCount(prod.getViewCount() + 1);
		pDao.update(prod);
		Cookie favo = cookie.read("favo");
		if (favo != null) {
			String ids = favo.getValue();
			List<Product> favo_list = pDao.findByIds(ids);
			model.addAttribute("favo",favo_list);
		}
		
		Cookie viewed = cookie.read("viewed");
		String value = id.toString();
		if (viewed != null) {
			value = viewed.getValue();
			value += "," + id.toString();
		}
		cookie.create("viewed", value, 10);
		List<Product> viewed_list = pDao.findByIds(value);
		model.addAttribute("viewed",viewed_list);
		return "sanpham/detail";
	}
	
	@ResponseBody
	@RequestMapping("/san-pham/them-vao-yeu-thich/{id}")
	public boolean addToFavorite(Model model, @PathVariable("id") Integer id) {
		Cookie favo = cookie.read("favo");
		String value = id.toString();
		if (favo != null) {
			value = favo.getValue();
			if (!value.contains(id.toString())) {
				value += "," + id.toString();
			}
			else {	
				return false;
			}
		}
		favo = cookie.create("favo", value, 30); 
		return true;
	}
	
	@RequestMapping("/san-pham/tim-kiem")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pDao.findByKey(keywords);
		model.addAttribute("list",list);
		return "sanpham/list";
	}
}
