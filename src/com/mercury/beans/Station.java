package com.mercury.beans;

public class Station {
	private int stationNo;
	private String name;
	private String address;
	private String city;
	private int zipCode;
	private String state;
	private int enable;
	public int getStationNo() {
		return stationNo;
	}
	public void setStationNo(int stationNo) {
		this.stationNo = stationNo;
	}
	public String getName() {
		return name;
	}
	public Station(int stationNo, String name, String address, String city,
			int zipCode, String state, int enable) {
		super();
		this.stationNo = stationNo;
		this.name = name;
		this.address = address;
		this.city = city;
		this.zipCode = zipCode;
		this.state = state;
		this.enable = enable;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public Station() {
		super();
	}
	/*
	@Override
	public String toString() {
		return "Station [stationNo=" + stationNo + ", name=" + name
				+ ", address=" + address + ", city=" + city + ", zipCode="
				+ zipCode + ", state=" + state + ", enable=" + enable + "]";
	}
	*/
	
}
