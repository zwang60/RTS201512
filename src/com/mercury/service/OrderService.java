package com.mercury.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.mercury.beans.CreditCard;
import com.mercury.beans.Order;
import com.mercury.beans.Ticket;
import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;
import com.mercury.beans.User;
import com.mercury.dao.CreditCardDao;
import com.mercury.dao.OrderDao;
import com.mercury.dao.TicketDao;

public class OrderService {

	public static final int ORDER_CANCELED = 0;
	public static final int ORDER_SUCCESS = 1;
	public static final int ORDER_CREATED = 2;

	private OrderDao od;
	private TicketDao ticketd;
	private CreditCardDao ccd;

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

	public TicketDao getTicketd() {
		return ticketd;
	}

	public void setTicketd(TicketDao ticketd) {
		this.ticketd = ticketd;
	}

	public Order createOrder(User u, String firstName, String lastName,
			String cardType, String cardNo, String exp, String billingAddr,
			String city, String state, int zip) {
		CreditCard cc = this.ccd.queryCardByUserIdAndNo(u.getUserId(), cardNo);

		if (cc == null) {
			this.ccd.save(new CreditCard(-1, u, cardNo, cardType, firstName,
					lastName, exp, billingAddr, city, zip, state));
			cc = this.ccd.queryCardByUserIdAndNo(u.getUserId(), cardNo);
		}

		System.out.println("Credit Card ID:" + cc.getCardId());
		Order order = new Order(-1, u, new Date(), cardNo, ORDER_CREATED);
		this.od.save(order);
		System.out.println("New Order #:" + order.getOrderNo());
		return order;
	}

	public boolean validateCreditCardAuthorization(CreditCard cc, double total) {
		System.out
				.println("Charge: Credit Card " + cc.getCardNo()
						+ "is authorized to pay total $"
						+ String.format("%.2f", total));
		return true;
	}

	public boolean bookTickets(HashMap<Ticket, Integer> cart, Order order) {
		boolean isComplete = true;
		List<Ticket> lRemove = new ArrayList<Ticket>();
		Iterator<Map.Entry<Ticket, Integer>> iter = cart.entrySet().iterator();

		while (iter.hasNext()) {
			Map.Entry<Ticket, Integer> entry = iter.next();

			Ticket t = entry.getKey();
			TrainSchedule schedule = new TrainSchedule(t.getDepartureTransit()
					.getTrain(), t.getExecuteDate());
			int qtyBooked = TicketContainer.buyTickets(schedule,
					entry.getValue());

			// Don't have enough tickets in queue
			if (qtyBooked < entry.getValue()) {
				isComplete = false;
				if (qtyBooked > 0) {
					entry.setValue(qtyBooked);
				} else {
					lRemove.add(entry.getKey());
				}
			}
		}

		// Remove entry that didn't book ticket token from cart.
		Iterator<Ticket> iterT = lRemove.iterator();
		while (iterT.hasNext()) {
			cart.remove(iterT.next());
		}

		// Patially or all did not booked successfully.
		if (!isComplete) {
			// Return reserved ticket token back to blocking queue
			iter = cart.entrySet().iterator();

			while (iter.hasNext()) {
				Map.Entry<Ticket, Integer> entry = iter.next();
				Ticket t = entry.getKey();
				TrainSchedule schedule = new TrainSchedule(t
						.getDepartureTransit().getTrain(), t.getExecuteDate());
				TicketContainer.returnTickets(schedule, entry.getValue());
			}

			return isComplete;
		}

		// If meeting all needs of current cart, reserved enough token from
		// queue
		iter = cart.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<Ticket, Integer> entry = iter.next();
			Ticket t = entry.getKey();
			t.setOrder(order);
			createTickets(t, entry.getValue());
		}
		// Order status is changed to success
		order.setOrderStatus(ORDER_SUCCESS);
		this.od.update(order);

		return isComplete;
	}

	public void createTickets(Ticket templateTicket, int qty) {
		for (int i = 0; i < qty; i++) {
			Ticket t = new Ticket(templateTicket);
			this.createTicket(t);
		}

	}

	public void createTicket(Ticket t) {
		t.setEnable(true);
		this.ticketd.saveTicket(t);
	}

	public double getOrderTotalById(int orderId) {
		return this.od.queryOrderTotalByNo(orderId);
	}

	public List<Order> queryAll() {
		List<Order> list = od.queryAllOrders();
		return list;
	}

	public List<Ticket> listTicketsByOrderNo(int orderNo) {
		return this.ticketd.queryTicketByOrderNo(orderNo);
	}

	public int countTicketByOrderNo(int orderNo) {
		return this.ticketd.countTicketByOrderNo(orderNo);
	}

	public void cancelOrder(int orderNo) {
		Order order = this.od.findByNo(orderNo);
		if (order.getOrderStatus() == 1) {
			this.ticketd.countTicketByOrderNo(orderNo);
			for (Ticket t : this.od.queryTicketByNo(orderNo)) {
				Train train = t.getDepartureTransit().getTrain();
				Date date = t.getExecuteDate();
				TrainSchedule ts = new TrainSchedule(train, date);
				TicketContainer.returnTickets(ts, 1);
			}
		}
		order.setOrderStatus(2);
		this.od.update(order);
	}
}
