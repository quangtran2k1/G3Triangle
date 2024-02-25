package com.g3triangle.shopthoitrang.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.g3triangle.shopthoitrang.dao.CustomerDAO;
import com.g3triangle.shopthoitrang.entity.Customer;

@Controller 
public class CustomerManager {
	@Autowired
	CustomerDAO dao;
	
	@RequestMapping("/admin/nguoi-dung/index")
	public String index(Model model) {
		Customer entity = new Customer();
		
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/nguoidung/index";
	}
	
	@RequestMapping("/admin/nguoi-dung/chinh-sua/{id}")
	public String edit(Model model,@PathVariable("id") String id) {
		Customer entity = dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/nguoidung/index";
	}
	
	@RequestMapping("/admin/nguoi-dung/them-moi")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Customer entity) {
		Customer user = dao.findById(entity.getId());
		if (entity.getId().equals("")) {
			model.addAttribute("errorId","Không được để trống!");
		} else if (entity.getFullName().equals("")) {
			model.addAttribute("errorFn","Không được để trống!");
		} else if (entity.getEmail().equals("")) {
			model.addAttribute("errorEmail","Không được để trống!");
		} else if (entity.getPassword().equals("")) {
			model.addAttribute("errorPw","Không được để trống!");
		} else if (entity.getId().contains(" ")) {
			model.addAttribute("errorId","Tài khoản không chứa khoảng trống!");
		} else {
			if (user != null) {
				model.addAttribute("errorId","Tài khoản đã tồn tại!");
			} else {
				if(entity.getActivated()==null) {
					entity.setActivated(false);
				}
				if(entity.getAdmin()==null) {
					entity.setAdmin(false);
				}
				if(entity.getAdmin()) {
					entity.setPhoto("admin.png");
				}else {
					entity.setPhoto("user-default.jpg");
				}
				dao.create(entity);
				model.addAttribute("message","Thêm mới thành công!");
			}
		}
		return "redirect:/admin/nguoi-dung/index";
	}
	
	@RequestMapping("/admin/nguoi-dung/cap-nhat")
	public String update(RedirectAttributes model ,@ModelAttribute("entity") Customer entity) {
		if(entity.getAdmin()) {
			entity.setPhoto("admin.jpg");
		}else {
			entity.setPhoto("user-default.jpg");
		}
		dao.update(entity);
		model.addAttribute("message","Cập nhật thành công!");
		return "redirect:/admin/nguoi-dung/chinh-sua/"+entity.getId();
	}
	
	@RequestMapping(value= {"/admin/nguoi-dung/xoa","/admin/nguoi-dung/xoa/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value="id", required = false) String id1, @PathVariable(value="id", required = false) String id2) {
		String id = (id1 != null)?id1:id2;
		dao.delete(id);
		model.addAttribute("message","Xóa thành công!");
		return "redirect:/admin/nguoi-dung/index";
	}
}
