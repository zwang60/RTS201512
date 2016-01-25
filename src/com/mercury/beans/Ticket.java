package com.mercury.beans;

import java.util.Date;

import com.mercury.utils.JavaUtil;

public class Ticket {
	private int ticketNo;
	private Date executeDate;
	private Order order;
	private Transit departureTransit;
	private Transit arrivalTransit;
	private double price;
	private boolean enable;
	
	public Ticket(Ticket t){
		this.ticketNo = t.ticketNo;
		this.executeDate = t.executeDate;
		this.order = t.order;
		this.departureTransit = t.departureTransit;
		this.arrivalTransit = t.arrivalTransit;
		this.price = t.price;
		this.enable = t.enable;
	}
	
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public Date getExecuteDate() {
		return executeDate;
	}
	public void setExecuteDate(Date executeDate) {
		this.executeDate = executeDate;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Transit getDepartureTransit() {
		return departureTransit;
	}
	public void setDepartureTransit(Transit departureTransit) {
		this.departureTransit = departureTransit;
	}
	public Transit getArrivalTransit() {
		return arrivalTransit;
	}
	public void setArrivalTransit(Transit arrivalTransit) {
		this.arrivalTransit = arrivalTransit;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	
	
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public Ticket(int ticketNo, Date executeDate, Order order,
			Transit departureTransit, Transit arrivalTransit, double price,
			boolean enable) {
		super();
		this.ticketNo = ticketNo;
		this.executeDate = executeDate;
		this.order = order;
		this.departureTransit = departureTransit;
		this.arrivalTransit = arrivalTransit;
		this.price = price;
		this.enable = enable;
	}
	
	
	public Ticket() {
		super();
	}
	
	
	@Override
	public String toString() {
		return "Ticket [ticketNo=" + ticketNo + ", executeDate=" + executeDate
				+ ", order=" + order + ", departureTransit=" + departureTransit
				+ ", arrivalTransit=" + arrivalTransit + ", price=" + price
				+ ", enable=" + enable + "]";
	}
	
	
	@Override
	public boolean equals(Object obj){
		if(obj == null)
			return false;
		if(this==obj)	
			return true;
		if(! (obj instanceof Ticket))
			return false;
		Ticket t = (Ticket)obj;
		if( (this.ticketNo == t.ticketNo && this.ticketNo!=-1) ||
				JavaUtil.compareDateOnlyWithoutTime(this.executeDate, t.executeDate) ||
				//this.order != t.order ||
				this.departureTransit.getTransitNo() == t.departureTransit.getTransitNo() ||
				this.arrivalTransit.getTransitNo() == t.arrivalTransit.getTransitNo() 
				)
			return true;
		
		return false;
	}
	
	@Override
	public int hashCode(){
		String s = "" + this.ticketNo + " " + this.executeDate.toString() + " " 
	+ this.departureTransit.getTransitNo() + " " + this.departureTransit.getTransitNo();
		return s.hashCode();
	}
	
}
