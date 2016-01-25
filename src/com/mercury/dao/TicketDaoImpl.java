package com.mercury.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Ticket;
import com.mercury.beans.Train;
import com.mercury.beans.User;

public class TicketDaoImpl implements TicketDao {
	private HibernateTemplate template;
	public void setSessionFactory (SessionFactory sessionFactory) {
		template = new HibernateTemplate (sessionFactory);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> queryAll() {
		// TODO Auto-generated method stub
		String hql = "from Ticket";
		List <Ticket> list = template.find(hql);
		return list;	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> findByUser(User user) {
		// TODO Auto-generated method stub
				
		String hql = "from Ticket t where t.order.user = :user";
		List <Ticket> list = template.findByNamedParam(hql,"user",user);		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> findByTrain(Train train) {
		// TODO Auto-generated method stub
		String hql = "from Ticket t where t.departureTransit.train = :train";
		List <Ticket> list = template.findByNamedParam(hql,"train",train);		
		return list;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> findByDate(Date date) {
		// TODO Auto-generated method stub
		String hql = "from Ticket t where t.date = :date";
		List <Ticket> list = template.findByNamedParam(hql,"date",date);		
		return list;

	}

	@Override
	public void saveTicket(Ticket ticket) {
		System.out.println("Ticket:" + ticket.toString());
		this.template.save(ticket);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> queryTicketByOrderNo(int orderNo) {
		// TODO Auto-generated method stub
		String hql = "from Ticket t where t.order.orderNo = :orderNo";
		List <Ticket> list = template.findByNamedParam(hql, "orderNo", orderNo);
		return list;
	}

	@Override
	public int countTicketByOrderNo(int orderNo) {
		// TODO Auto-generated method stub
		return queryTicketByOrderNo(orderNo).size();
	}

	

}
