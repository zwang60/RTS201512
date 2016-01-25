package com.mercury.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.ConfirmationCode;
import com.mercury.beans.CreditCard;
import com.mercury.beans.Order;
import com.mercury.beans.Train;
import com.mercury.beans.User;
import com.mercury.dao.ConfirmationCodeDao;
import com.mercury.dao.CreditCardDao;
import com.mercury.dao.OrderDao;
import com.mercury.dao.PersonDao;
import com.mercury.dao.TrainDao;

@Service
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService{
	private PersonDao pd;
	
	private TrainDao td;
	
	private CreditCardDao ccd;
	
	private OrderDao od;
	
	public PersonDao getPd() {
		return pd;
	}
	public void setPd(PersonDao pd) {
		System.out.println("CService Ref:@" + this.hashCode());
		this.pd = pd;
	}

	
	public void insertConfirm(ConfirmationCode cc){
	 ConfirmationCodeDao ccd= new ConfirmationCodeDao();
		ccd.savecode(cc);
	}
	
	
	
	public TrainDao getTd() {
		return td;
	}
	public void setTd(TrainDao td) {
		this.td = td;
	}
	public CreditCardDao getCcd() {
		return ccd;
	}
	public void setCcd(CreditCardDao ccd) {
		this.ccd = ccd;
	}
	public OrderDao getOd() {
		return od;
	}
	public void setOd(OrderDao od) {
		this.od = od;

	}

	public void saveUser(User user) {
		this.pd.addPerson(user);
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserDetails user = null;  
		try {
			User person = pd.findPersonByEmail(email);	
			if (person.getEmail() == null) {
				throw new UsernameNotFoundException("Error in retrieving user");
			}
			
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(person.getRole().getAuthority()));		
			authorities.add(new SimpleGrantedAuthority(person.getRole().getAuthority()));
			user = new org.springframework.security.core.userdetails.User(
						person.getEmail(),
						person.getPassword(),
						person.isEnable(),
						true,
						true,
						true,
						authorities 
					);
		} 
		catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		return user;
	}
	
	public void addTransit(){
		
	}
	public Train gettrain(int trainno){
		return this.td.findByNo(trainno);
	}

	public CreditCard getCreditCardsById(int cardId){
		return this.ccd.queryCardById(cardId);
	}
	
	
	public List<CreditCard> getCreditCardsByUserId(int userId){
		return this.ccd.queryCardByUserId(userId);
	}
	
	public List<Order> getOrdersByUserId(int userId){
		return this.od.queryOrdersByUserId(userId);
	}
	
	public void updateCreditCard(CreditCard card) {
		this.ccd.update(card);
	}
	
	public void deleteCreditCard(CreditCard card) {
		this.ccd.delete(card);
	}
	
	public static UserDetails currentUserDetails(){
	    SecurityContext securityContext = SecurityContextHolder.getContext();
	    Authentication authentication = securityContext.getAuthentication();
	    if (authentication != null) {
	        Object principal = authentication.getPrincipal();
	        return principal instanceof UserDetails ? (UserDetails) principal : null;
	    }
	    return null;
	}
	
	public User activeUser(String activation) {
		return this.pd.activeUser(activation);
	}
	public User findbyemail(String email){
		return this.pd.findPersonByEmail(email);
	}
	public User findbypassword(String md5){
		return this.pd.findPersonByPassword(md5);
	}
	public int checkActivationCode(String activation) {
		return this.pd.checkActivationCode(activation);
	}
	public void updateUser (User user) {
		this.pd.updatePerson(user);
	}
	
	public int countUser () {
		return this.pd.countUser();
	}
	
	public int countActivedUser () {
		return this.pd.countActivedUser();
	}
	public List<User> findAllUser(){
		return pd.findAllUser();
	}
}
