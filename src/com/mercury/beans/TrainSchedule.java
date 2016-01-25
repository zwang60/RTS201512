package com.mercury.beans;

import java.util.Date;

public class TrainSchedule {
	Train train;
	Date departureDate;
	int availableTickets;
	
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public TrainSchedule(Train train, Date departureDate) {
		super();
		this.train = train;
		this.departureDate = departureDate;
		this.availableTickets = 0;
	}

	public int getAvailableTickets() {
		
		return availableTickets;
	}
	public void setAvailableTickets(int availableTickets) {
		this.availableTickets = availableTickets;
	}
	@Override
	public String toString() {
		return "TrainSchedule [train=" + train + ", departureDate="
				+ departureDate + ", availableTickets=" + availableTickets
				+ "]";
	}
	public TrainSchedule() {
		super();
	}
	@Override
	public int hashCode() {
		int result = 0;
		int prime = 31;
		int trainNo = this.getTrain().getTrainNo();
		int year = this.getDepartureDate().getYear();
		int month = this.getDepartureDate().getMonth();
		int date = this.getDepartureDate().getDate();
		result = year*prime*prime*prime + month*prime*prime + date*prime + trainNo;
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof TrainSchedule)){	
			return false;
		}
		TrainSchedule td = (TrainSchedule) obj;
		if (this.getTrain().getTrainNo() != td.getTrain().getTrainNo()){
			return false;
		}
		if (this.getDepartureDate().getYear() != td.getDepartureDate().getYear()){
			return false;
		}
		if (this.getDepartureDate().getMonth() != td.getDepartureDate().getMonth()){
			return false;
		}
		if (this.getDepartureDate().getDate()!= td.getDepartureDate().getDate()){
			return false;
		}
		return true;
	}
	
}
