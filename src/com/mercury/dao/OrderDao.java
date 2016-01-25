package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Order;
import com.mercury.beans.Ticket;

public interface OrderDao {
	public void save(Order order);
	public List<Order> queryAllOrders();
	public void delete(Order order);
	public void update(Order order);
	public Order findByNo(int orderNo);
	public List<Order> queryOrdersByUserId(int userId);
	public double queryOrderTotalByNo(int orderId);
	public List<Ticket> queryTicketByNo(int orderId);
}
