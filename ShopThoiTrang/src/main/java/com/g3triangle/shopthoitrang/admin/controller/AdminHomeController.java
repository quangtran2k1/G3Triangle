package com.g3triangle.shopthoitrang.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	@RequestMapping("/admin/trang-chu/index")
	public String index() {
		return "admin/trangchu/index";
	}
}
