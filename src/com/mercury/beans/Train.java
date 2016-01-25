package com.mercury.beans;

public class Train {
	@Override
	public String toString() {
		return "Train [trainNo=" + trainNo + ", totalTicketQty="
				+ totalTicketQty + ", enable=" + enable + "]";
	}

	private int trainNo;
	private int totalTicketQty;
	private boolean enable;
	
	public int getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(int trainNo) {
		this.trainNo = trainNo;
	}
	public int getTotalTicketQty() {
		return totalTicketQty;
	}
	public void setTotalTicketQty(int totalTicketQty) {
		this.totalTicketQty = totalTicketQty;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	
	public Train(){
		System.out.println("Train bean is initialized.");
	}
	
	public Train(int trainNo, int totalTicketQty, boolean enable) {
		this.trainNo = trainNo;
		this.totalTicketQty = totalTicketQty;
		this.enable = enable;
	}
	
	
}
