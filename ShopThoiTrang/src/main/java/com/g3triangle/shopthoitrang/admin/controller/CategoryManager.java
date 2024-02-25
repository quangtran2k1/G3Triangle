package com.g3triangle.shopthoitrang.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.g3triangle.shopthoitrang.dao.CategoryDAO;
import com.g3triangle.shopthoitrang.entity.Category;

@Controller 
public class CategoryManager {
	@Autowired
	CategoryDAO dao;
	
	@RequestMapping("/admin/loai-san-pham/index")
	public String index(Model model) {
		Category entity = new Category();
		
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/loaisanpham/index";
	}
	
	@RequestMapping("/admin/loai-san-pham/chinh-sua/{id}")
	public String edit(Model model,@PathVariable("id") Integer id) {
		Category entity = dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/loaisanpham/index";
	}
	
	@RequestMapping("/admin/loai-san-pham/them-moi")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		dao.create(entity);
		model.addAttribute("message","Thêm mới thành công!");
		return "redirect:/admin/loai-san-pham/index";
	}
	
	@RequestMapping("/admin/loai-san-pham/cap-nhat")
	public String update(RedirectAttributes model ,@ModelAttribute("entity") Category entity) {
		dao.update(entity);
		model.addAttribute("message","Cập nhật thành công!");
		return "redirect:/admin/loai-san-pham/chinh-sua/"+entity.getId();
	}
	
	@RequestMapping(value= {"/admin/loai-san-pham/xoa","/admin/loai-san-pham/xoa/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value="id", required = false) Integer id1, @PathVariable(value="id", required = false) Integer id2) {
		Integer id = (id1 != null)?id1:id2;
		dao.delete(id);
		model.addAttribute("message","Xóa thành công!");
		return "redirect:/admin/loai-san-pham/index";
	}
}
