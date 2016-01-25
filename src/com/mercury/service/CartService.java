package com.mercury.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.mercury.beans.Cart;
import com.mercury.beans.Order;
import com.mercury.beans.Ticket;
import com.mercury.beans.Transit;
import com.mercury.utils.JavaUtil;

public class CartService {
	private HttpSession session;
	private Cart cart;
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public CartService(HttpSession session) {
		super();
		this.session = session;
		this.cart = Cart.getCart(session);
	}
	
	public boolean isEmpty(){
		return this.cart.getHpTickets().size() == 0;
	}
	
	public CartService addTicket(Transit departureTransit, Transit arrivalTransit, int trainNo, 
			double price, Date departureDateTime, int qty){
		Date departureDate = JavaUtil.convertDateTimeWithoutTime(departureDateTime);
		System.out.println(departureDate);
		Ticket t = new Ticket(-1, departureDate, new Order(),
				departureTransit,
				arrivalTransit, 
				price,
				false);
		this.cart.addTicket(t, qty);
		return this;
	}
	
	
	
	public CartService updateTicketQty(Transit departureTransit, Transit arrivalTransit, int trainNo, 
			double price, Date departureDateTime, int qty){
		Date departureDate = JavaUtil.convertDateTimeWithoutTime(departureDateTime);
		System.out.println(departureDate);
		
		Ticket t = new Ticket(-1, departureDate, new Order(),
				departureTransit,
				arrivalTransit, 
				price,
				false);
		this.cart.updateTicket(t, qty);
		return this;
	}
	
	public HashMap<Ticket,Integer> getCartTickets(){
		return this.cart.getHpTickets();
	}
	
	
	public int getCartTicketsQty(){
		int qty = 0;
		Iterator<Map.Entry<Ticket,Integer>> iter = this.getCart().getHpTickets().entrySet().iterator();
		while(iter.hasNext()){
			qty += iter.next().getValue();
		}
		return qty;
	}
	public void removeTicketEntry(Transit departureTransit,
			Transit arrivalTransit, int trainNo,
			Date departureDate) {
		Ticket t = new Ticket(-1, departureDate, new Order(),
				departureTransit,
				arrivalTransit, 
				0,
				false);
		this.cart.removeTicket(t);
	}
	
}
