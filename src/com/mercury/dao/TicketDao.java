package com.mercury.dao;

import java.util.Date;
import java.util.List;

import com.mercury.beans.Order;
import com.mercury.beans.Ticket;
import com.mercury.beans.Train;
import com.mercury.beans.User;

public interface TicketDao {
	public List<Ticket> queryAll();
	public List<Ticket> findByUser(User user);
	public List<Ticket> findByTrain(Train train);
	public List<Ticket> findByDate(Date date);
	public void saveTicket(Ticket ticket);
	public List<Ticket> queryTicketByOrderNo(int orderNo);
	public int countTicketByOrderNo(int orderNo);
}
