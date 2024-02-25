package com.g3triangle.shopthoitrang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.g3triangle.shopthoitrang.interceptor.AdminInterceptor;
import com.g3triangle.shopthoitrang.interceptor.AuthorizeInterceptor;
import com.g3triangle.shopthoitrang.interceptor.ShareInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	ShareInterceptor share;
	@Autowired
	AuthorizeInterceptor auth;
	@Autowired
	AdminInterceptor admin;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(share).addPathPatterns("/**");
		registry.addInterceptor(admin).addPathPatterns("/admin/**");
		registry.addInterceptor(auth).addPathPatterns("/tai-khoan/dang-xuat","/gio-hang/**","/nguoi-dung/**","/pay/**");
	}
}
