package com.mercury.beans;

import java.sql.Timestamp;

public class Transit {
	private int transitNo;
	private Train train;
	private int seqNo;
	private Station station;
	private Timestamp arrivalTime;
	private int stopDuration;
	private double price;
	
	
	public int getTransitNo() {
		return transitNo;
	}
	public void setTransitNo(int transitNo) {
		this.transitNo = transitNo;
	}
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	public int getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	public Station getStation() {
		return station;
	}
	public void setStation(Station station) {
		this.station = station;
	}
	public Timestamp getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Timestamp arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public int getStopDuration() {
		return stopDuration;
	}
	public void setStopDuration(int stopDuration) {
		this.stopDuration = stopDuration;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Transit(int transitNo, Train train, int seqNo, Station station,
			Timestamp arrivalTime, int stopDuration, double price) {
		super();
		this.transitNo = transitNo;
		this.train = train;
		this.seqNo = seqNo;
		this.station = station;
		this.arrivalTime = arrivalTime;
		this.stopDuration = stopDuration;
		this.price = price;
	}
	
	/*
	@Override
	public String toString() {
		return "Transit [transitNo=" + transitNo + ", train=" + train
				+ ", seqNo=" + seqNo + ", station=" + station
				+ ", arrivalTime=" + arrivalTime + ", stopDuration="
				+ stopDuration + ", price=" + price + "]";
	}
	*/
	public Transit(){
		System.out.println("Transit bean is initialized.");
	}
}
