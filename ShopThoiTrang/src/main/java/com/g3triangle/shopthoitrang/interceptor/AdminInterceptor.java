package com.g3triangle.shopthoitrang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.g3triangle.shopthoitrang.entity.Customer;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("admin");
		if (user == null) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/tai-khoan/dang-nhap");
			return false;
		}
		return true;
	}
}
