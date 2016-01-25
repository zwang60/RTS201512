package com.mercury.beans;

public class CreditCard {
	private int cardId;
	@Override
	public String toString() {
		return "CreditCard [cardId=" + cardId + ", user=" + user + ", cardNo="
				+ cardNo + ", paymentBrand=" + paymentBrand + ", firstName="
				+ firstName + ", lastName=" + lastName + ", expiration="
				+ expiration + ", billingAddr=" + billingAddr + ", city="
				+ city + ", zipCode=" + zipCode + ", state=" + state + "]";
	}

	private User user;
	private String cardNo;
	private String paymentBrand;
	private String firstName;
	private String lastName;
	private String expiration;
	private String billingAddr;
	private String city;
	private int zipCode;
	private String state;
	
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getPaymentBrand() {
		return paymentBrand;
	}
	public void setPaymentBrand(String paymentBrand) {
		this.paymentBrand = paymentBrand;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getExpiration() {
		return expiration;
	}
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	public String getBillingAddr() {
		return billingAddr;
	}
	public void setBillingAddr(String billingAddr) {
		this.billingAddr = billingAddr;
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
	
	
	public CreditCard(int cardId, User user, String cardNo,
			String paymentBrand, String firstName, String lastName,
			String expiration, String billingAddr, String city, int zipCode,
			String state) {
		this.cardId = cardId;
		this.user = user;
		this.cardNo = cardNo;
		this.paymentBrand = paymentBrand;
		this.firstName = firstName;
		this.lastName = lastName;
		this.expiration = expiration;
		this.billingAddr = billingAddr;
		this.city = city;
		this.zipCode = zipCode;
		this.state = state;
	}
	
	public CreditCard() {
		System.out.println("CreditCard bean is initialized.");
	}
	
	
}
