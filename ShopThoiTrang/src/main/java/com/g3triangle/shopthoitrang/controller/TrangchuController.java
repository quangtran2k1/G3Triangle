package com.g3triangle.shopthoitrang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrangchuController {
	@RequestMapping("/trang-chu/index")
	public String index() {
		return "trangchu/index";
	}
	
	@RequestMapping("/trang-chu/blog")
	public String blog() {
		return "trangchu/blog";
	}
	
	@RequestMapping("/trang-chu/lien-he")
	public String contact() {
		return "trangchu/contact";
	}
}
