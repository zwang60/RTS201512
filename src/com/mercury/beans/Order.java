package com.mercury.beans;

import java.util.Date;

public class Order {
	private int orderNo;
	private User user;
	private Date orderDate;
	private String creditCardNo;
	private int orderStatus;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getCreditCardNo() {
		return creditCardNo;
	}
	public void setCreditCardNo(String creditCardNo) {
		this.creditCardNo = creditCardNo;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Order(){
		System.out.println("Order bean is initialized.");
	}
	public Order(int orderNo, User user, Date orderDate, String creditCardNo,
			int orderStatus) {
		super();
		this.orderNo = orderNo;
		this.user = user;
		this.orderDate = orderDate;
		this.creditCardNo = creditCardNo;
		this.orderStatus = orderStatus;
	}
	
	/*
	public String toString() {
		return "Order [orderNo=" + orderNo + ", name=" + user
				+ ", orderdate=" + orderDate + ", creditcardno=" + creditCardNo + ", orderstatus="
				+ orderStatus + "]";
	}
	*/
	
	
	
}
