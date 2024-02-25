package com.g3triangle.shopthoitrang.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="Customers")
public class Customer {
	@Id
    String id;
	String password;
	String fullName;
	String email;
	String photo;
	Boolean activated;
	Boolean admin;

    
    @OneToMany(mappedBy = "customer")
    List<Order> orders;


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public Boolean getActivated() {
		return activated;
	}


	public void setActivated(Boolean activated) {
		this.activated = activated;
	}


	public Boolean getAdmin() {
		return admin;
	}


	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}


	public List<Order> getOrders() {
		return orders;
	}


	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
    
}
