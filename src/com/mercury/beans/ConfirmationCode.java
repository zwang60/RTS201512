package com.mercury.beans;

public class ConfirmationCode {
	private String code;
	private Integer userId;
		
	public ConfirmationCode(){}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
}
