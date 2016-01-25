package com.mercury.beans;

import java.security.MessageDigest;
import java.util.Random;

public class User {

	private int userId;
	private String firstName;
	private String password;
	private String lastName;
	private String email;
	private String gender;
	private int age;
	private String address;
	private String city;
	private int zipCode;
	private String state;
	private String activation;
	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", activation="
				+ activation + ", enable=" + enable + ", role=" + role + "]";
	}


	private boolean enable;
	private UserRole role;
	
	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
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


	public String getActivation() {
		return activation;
	}


	public void setActivation(String activation) {
		this.activation = activation;
	}


	public boolean isEnable() {
		return enable;
	}


	public void setEnable(boolean enable) {
		this.enable = enable;
	}


	public UserRole getRole() {
		return role;
	}


	public void setRole(UserRole role) {
		this.role = role;
	}


	public void geneateActivationCode(){
		Random r = new Random();
		char[] temp = new char[20]; 
		for (int i=0;i<20;i++){
			temp[i] = (char)(97 + r.nextInt(26));
		}
		this.activation = new String (temp);
		System.out.println(this.activation);
	}
	
	
	public User() {
		System.out.println("User bean initialized");
	}


	public User(int userId, String firstName, String password, String lastName,
			String email, String gender, int age, String address, String city,
			int zipCode, String state, String activation, boolean enable,
			UserRole role) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.password = password;
		this.lastName = lastName;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.city = city;
		this.zipCode = zipCode;
		this.state = state;
		this.activation = activation;
		this.enable = enable;
		this.role = role;
	}

	public String MD5Hashing(String password)throws Exception{
		MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte byteData[] = md.digest();
        
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
    	}
		
		return hexString.toString();
		
		}
	
	
	
}
