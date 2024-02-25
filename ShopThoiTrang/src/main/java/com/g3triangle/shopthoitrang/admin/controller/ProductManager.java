package com.g3triangle.shopthoitrang.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.g3triangle.shopthoitrang.dao.ProductDAO;
import com.g3triangle.shopthoitrang.entity.Product;

@Controller 
public class ProductManager {
	@Autowired
	ProductDAO dao;
	@Autowired
	ServletContext app;
	
	@RequestMapping("/admin/san-pham/index")
	public String index(Model model) {
		Product entity = new Product();	
		entity.setProductDate(new Date());
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/sanpham/index";
	}
	
	@RequestMapping("/admin/san-pham/chinh-sua/{id}")
	public String edit(Model model,@PathVariable("id") Integer id) {
		Product entity = dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/sanpham/index";
	}
	
	@RequestMapping("/admin/san-pham/them-moi")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Product entity, @RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if(file.isEmpty()) {
			entity.setImage("default-clothes.png");
		}else {
			entity.setImage(file.getOriginalFilename());
			String path = app.getRealPath("/static/img/Product/"+entity.getImage());
			file.transferTo(new File(path));
		}
		entity.setViewCount(1);
		entity.setProductDate(new Date());
		dao.create(entity);
		model.addAttribute("message","Thêm mới thành công!");
		return "redirect:/admin/san-pham/index";
	}
	
	@RequestMapping("/admin/san-pham/cap-nhat")
	public String update(RedirectAttributes model ,@ModelAttribute("entity") Product entity, @RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path = app.getRealPath("/static/img/Product/"+entity.getImage());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("message","Cập nhật thành công!");
		return "redirect:/admin/san-pham/chinh-sua/"+entity.getId();
	}
	
	@RequestMapping(value= {"/admin/san-pham/xoa","/admin/san-pham/xoa/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value="id", required = false) Integer id1, @PathVariable(value="id", required = false) Integer id2) {
		Integer id = (id1 != null)?id1:id2;
		dao.delete(id);
		model.addAttribute("message","Xóa thành công!");
		return "redirect:/admin/san-pham/index";
	}
}
