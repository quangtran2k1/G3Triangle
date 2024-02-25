package com.g3triangle.shopthoitrang.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.g3triangle.shopthoitrang.PaypalPaymentIntent;
import com.g3triangle.shopthoitrang.PaypalPaymentMethod;
import com.g3triangle.shopthoitrang.PaypalService;
import com.g3triangle.shopthoitrang.Utils;
import com.g3triangle.shopthoitrang.dao.OrderDAO;
import com.g3triangle.shopthoitrang.entity.Customer;
import com.g3triangle.shopthoitrang.entity.Order;
import com.g3triangle.shopthoitrang.entity.OrderDetail;
import com.g3triangle.shopthoitrang.entity.Product;
import com.g3triangle.shopthoitrang.service.CartService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class GiohangController {
	public static final String URL_PAYPAL_SUCCESS = "pay/success";
	public static final String URL_PAYPAL_CANCEL = "pay/cancel";
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private PaypalService paypalService;
	@Autowired
	CartService cart;
	@Autowired
	HttpSession session;
	@Autowired
	OrderDAO dao;
	
	@ResponseBody
	@RequestMapping("/gio-hang/them-vao-gio-hang/{id}")
	public Object[] add(@PathVariable("id") Integer id) {
		cart.add(id);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@ResponseBody
	@RequestMapping("/gio-hang/cap-nhat/{id}/{qty}")
	public Object[] update(@PathVariable("id") Integer id, @PathVariable("qty") Integer qty) {
		cart.update(id, qty);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@ResponseBody
	@RequestMapping("/gio-hang/xoa/{id}")
	public Object[] remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@RequestMapping("/gio-hang/chi-tiet-gio-hang")
	public String clear() {
		return "giohang/view";
	}
	
	@ResponseBody
	@RequestMapping("/gio-hang/xoa-tat-ca")
	public void view() {
		cart.clear();
	}
	
	@GetMapping("/gio-hang/dat-hang")
	public String showForm(@ModelAttribute("order") Order order) {
		Customer user = (Customer) session.getAttribute("user");
		order.setCustomer(user);
		order.setOrderDate(new Date());
		order.setAmount(cart.getAmount());
		return "giohang/order";
	}
	
	@PostMapping("/gio-hang/dat-hang")
	public String order(Model model, @ModelAttribute("order") Order order, HttpServletRequest request) {
		Collection<Product> list =  cart.getItems();
		List<OrderDetail> details = new ArrayList<>();
		for (Product product:list) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setProduct(product);
			detail.setUnitPrice(product.getUnitPrice());
			detail.setDiscount(product.getDiscount());
			detail.setQuantity(product.getQuantity());
			details.add(detail);
		}
		String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
		String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;
		double price = cart.getAmount() / 23450;
		try {
			Payment payment = paypalService.createPayment(
					price,
					"USD",
					PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale,
					"payment description",
					cancelUrl,
					successUrl);
			for(Links links : payment.getLinks()){
				if(links.getRel().equals("approval_url")){
					dao.create(order, details);
					cart.clear();
					return "redirect:" + links.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/gio-hang/don-hang";
	}
	
	@GetMapping(URL_PAYPAL_CANCEL)
	public String cancelPay(){
		return "giohang/cancel";
	}
	@GetMapping(URL_PAYPAL_SUCCESS)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if(payment.getState().equals("approved")){
				return "giohang/success";
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/";
	}
}
