package com.g3triangle.shopthoitrang.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.g3triangle.shopthoitrang.dao.CustomerDAO;
import com.g3triangle.shopthoitrang.entity.Customer;
import com.g3triangle.shopthoitrang.service.CookieService;

@Controller
public class TaikhoanCotroller {
	@Autowired
	CustomerDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;
	
	@GetMapping("/tai-khoan/dang-nhap")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if(ckid!=null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			
			model.addAttribute("uid",uid);
			model.addAttribute("pwd",pwd);
		}
		return "taikhoan/login";
	}
	
	@PostMapping("/tai-khoan/dang-nhap")
	public String login(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw, 
			@RequestParam(value="rm",defaultValue="false") boolean rm) {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message","Tài khoản không tồn tại!");
		}else if (!pw.equals(user.getPassword())){
			model.addAttribute("message","Mật khẩu không chính xác!");
		}else if(user.getAdmin()){
			session.setAttribute("admin", user);
			String adminId = user.getId();
			session.setAttribute("adminId", adminId);
			return "redirect:/admin/trang-chu/index";
		}else{
			session.setAttribute("user", user);
			String userId = user.getId();
			session.setAttribute("userId", userId);
			if (rm == true ) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			}else {
				cookie.delete("userid");
				cookie.delete("pass");
			}
			return "redirect:/trang-chu/index";
		}
		return "taikhoan/login";
	}
	
	@RequestMapping("/tai-khoan/dang-xuat")
	public String logout(Model model) {
		session.removeAttribute("user");
		session.removeAttribute("userId");
		return "redirect:/trang-chu/index";
	}
	
	@GetMapping("/tai-khoan/dang-ky")
	public String register(Model model) {
		Customer user = new Customer();
		model.addAttribute("form",user);
		return "taikhoan/register";
	}
	
	@PostMapping("/tai-khoan/dang-ky")
	public String register(Model model, 
			@ModelAttribute("form") Customer user) {
		Customer userCheck = dao.findById(user.getId());
		if (user.getId().equals("")) {
			model.addAttribute("errorId","Không được để trống!");
		} else if (user.getFullName().equals("")) {
			model.addAttribute("errorFn","Không được để trống!");
		} else if (user.getEmail().equals("")) {
			model.addAttribute("errorEmail","Không được để trống!");
		} else if (user.getPassword().equals("")) {
			model.addAttribute("errorPw","Không được để trống!");
		} else if (user.getId().contains(" ")) {
			model.addAttribute("errorId","Tài khoản không chứa khoảng trống!");
		} else if (user.getPassword().length() < 6 ) {
			model.addAttribute("errorPw","Mật khẩu quá ngắn!");
		} else {
			if (userCheck != null) {
				model.addAttribute("message","Tài khoản đã tồn tại!");
			} else {
				user.setPhoto("user-default.jpg");
				user.setActivated(true);
				user.setAdmin(false);
				dao.create(user);
				model.addAttribute("message","Đăng ký thành công!");
			}
		}
		return "taikhoan/register";
	}
}
