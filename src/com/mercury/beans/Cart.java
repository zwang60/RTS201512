package com.mercury.beans;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class Cart {
	private HttpSession session;
	private HashMap<Ticket,Integer> hpTickets;
	public static final String CART_NAME = "cart";
	public static Cart getCart(HttpSession session){
		Cart cart = (Cart)session.getAttribute(CART_NAME);
		if(cart==null){
			cart = new Cart(session);
			session.setAttribute(CART_NAME, cart);
		}
		return cart;
	}

	public Cart(HttpSession session) {
		super();
		this.session = session;
		this.hpTickets = new HashMap<Ticket,Integer>();
	}

	public HttpSession getSession() {
		return session;
	}

	public HashMap<Ticket, Integer> getHpTickets() {
		return hpTickets;
	}

	public static String getCartName() {
		return CART_NAME;
	}

	public void addTicket(Ticket t, int qty){
		if(this.hpTickets.containsKey(t))
			this.hpTickets.put(t, this.hpTickets.get(t)+qty);
		else{
			this.hpTickets.put(t,qty);
			System.out.println(t.getDepartureTransit().getTrain().getTrainNo());
			System.out.println(this.hpTickets.size());
			printCart();
		}
	}
	
	public void printCart(){
		Iterator<Map.Entry<Ticket,Integer>> iter = this.hpTickets.entrySet().iterator();
		while(iter.hasNext()){
			Map.Entry<Ticket, Integer> entry = iter.next();
			System.out.println("ticket in cart: " + 
					entry.getKey().getDepartureTransit().getTrain().getTrainNo() +
					"  Qty:" + entry.getValue());
		}
	}
	
	public void updateTicket(Ticket t, int qty){
		if(this.hpTickets.containsKey(t))
			this.hpTickets.put(t,qty);
		else
			this.hpTickets.put(t,qty);
	}
	
	public void decreaseTicket(Ticket t, int qty){
		if(this.hpTickets.containsKey(t)){
			int currQty = this.hpTickets.get(t);
			if(currQty<=qty)
				this.hpTickets.remove(t);
			else
				this.hpTickets.put(t, currQty-qty);
		}
		else
			this.hpTickets.put(t,qty);
	}
	
	public void removeTicket(Ticket t){
		if(this.hpTickets.containsKey(t)){
			this.hpTickets.remove(t);
		}
	}
	
}
