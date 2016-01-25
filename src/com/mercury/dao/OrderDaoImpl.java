package com.mercury.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Order;
import com.mercury.beans.Ticket;

public class OrderDaoImpl implements OrderDao {
	private HibernateTemplate template;
	public void setSessionFactory (SessionFactory sessionFactory) {
		template = new HibernateTemplate (sessionFactory);
	}

	
	@Override
	public void save(Order order) {
		this.template.save(order);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> queryAllOrders() {
		String sql = "from Order";
		List<Order> list = template.find(sql);
		return list;	
	}

	@Override
	public void delete(Order order) {
		this.template.delete(order);
	}

	@Override
	public void update(Order order) {
		this.template.update(order);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Order findByNo(int orderNo) {
		String hql = "from Order o where o.orderNo=:orderNo";
		Order order = null;
		List <Order> list = template.findByNamedParam(hql,"orderNo",orderNo);
		if(list.size() != 0){
			order = list.get(0);
		}
		System.out.println(order);
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> queryOrdersByUserId(int userId) {
		String hql = "from Order o where o.user.userId=:userId";
		List<Order> list = template.findByNamedParam(hql,"userId",userId);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public double queryOrderTotalByNo(int orderNo) {
		String hql = "select sum(t.price) from Ticket t where t.order.orderNo=:orderNo";
		List<Double> list = template.findByNamedParam(hql,"orderNo",orderNo);
		double total = 0.0;
		if(list.size()>0)
			total = list.get(0);
		return total;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> queryTicketByNo(int orderNo) {
		// TODO Auto-generated method stub
		String hql = "from Ticket t where t.order.orderNo=:orderNo";
		List<Ticket> list = template.findByNamedParam(hql,"orderNo",orderNo);
		return list;
	}



}
