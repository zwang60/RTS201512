package com.mercury.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;

import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;
import com.mercury.dao.TicketDao;
import com.mercury.dao.TicketDaoImpl;
import com.mercury.dao.TrainDao;
import com.mercury.dao.TrainDaoImpl;
import com.mercury.utils.JavaUtil;

public class TicketContainer {
	static TicketDao ticketDao;
	static TrainDao trainDao;
	static List<Train> list;
	private static HashMap<TrainSchedule, ArrayBlockingQueue<Object>> map;

	static {
		System.out.println("here");
		map = new HashMap<TrainSchedule, ArrayBlockingQueue<Object>>();

	}

	public TicketDao getTicketDao() {
		return ticketDao;
	}

	public static List<Date> getDates() {
		ArrayList<Date> dates = new ArrayList<Date>();
		Date today = JavaUtil.convertDateTimeWithoutTime(new Date());
		for (int i = 0; i < 7; i++) {
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(today);
			calendar.add(calendar.DATE, i);
			Date date = calendar.getTime();
			dates.add(date);
		}
		return dates;
	}

	public static void setTicketDao(TicketDao ticketDao) {
		TicketContainer.ticketDao = ticketDao;
		for (Train train : list) {
			System.out.println(train);
			update(train);
		}
	}

	public static void update(Train train) {
		list = trainDao.queryAll();
		int count = train.getTotalTicketQty();
		for (Date date : getDates()) {
			TrainSchedule tad = new TrainSchedule(train, date);
			int sold = trainDao.queryCountByTrainAndDate(tad);
			tad.setAvailableTickets(count - sold);
			ArrayBlockingQueue<Object> queue = new ArrayBlockingQueue<Object>(
					count);
			for (int i = 0; i < tad.getAvailableTickets(); i++) {
				Object o = new Object();
				queue.add(o);
			}
			map.put(tad, queue);
		}

	}

	public TrainDao getTrainDao() {
		return trainDao;
	}

	public static void setTrainDao(TrainDao trainDao) {
		TicketContainer.trainDao = trainDao;
		list = trainDao.queryAll();
	}

	public static HashMap<TrainSchedule, ArrayBlockingQueue<Object>> getMap() {
		return map;
	}

	public static void setMap(HashMap<TrainSchedule, ArrayBlockingQueue<Object>> map) {
		TicketContainer.map = map;
	}

	public static void tomorrow() {
		Date today = JavaUtil.convertDateTimeWithoutTime(new Date());
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(today);
		calendar.add(calendar.DATE, -1);
		Date yesterday = calendar.getTime();
		for (TrainSchedule tad : map.keySet()) {
			if ((tad.getDepartureDate().getYear() == yesterday.getYear())
					&& (tad.getDepartureDate().getMonth() == yesterday
							.getMonth())
					&& (tad.getDepartureDate().getDate() == yesterday.getDate()))
				map.remove(tad);
		}

		calendar.setTime(today);
		calendar.add(calendar.DATE, 6);
		Date next = calendar.getTime();

		for (Train train : trainDao.queryAll()) {
			TrainSchedule tad = new TrainSchedule(train, next);
			add(tad);
		}
	}

	public static void add(TrainSchedule tad) {
		int count = tad.getTrain().getTotalTicketQty();
		ArrayBlockingQueue<Object> queue = new ArrayBlockingQueue<Object>(count);
		for (int i = 0; i < count; i++) {
			Object o = new Object();
			queue.add(o);
		}
		map.put(tad, queue);
	}

	public static ArrayBlockingQueue<Object> getQueue(TrainSchedule tad) {
		return map.get(tad);
	}

	public static synchronized int buyTickets(TrainSchedule tad, int num) {
		List<Object> list = new ArrayList<Object>();
		ArrayBlockingQueue<Object> queue = getQueue(tad);
		System.out.println("Queue: "+queue);
		int count = queue.drainTo(list, num);
		
		if (count < num) {
			count = 0;
			queue.addAll(list);
		}
		
		System.out.println("Reserve ticket token: " + count);
		return count;
	}
	
	public static synchronized int returnTickets(TrainSchedule tad, int num) {
		
//		List<Object> list = new ArrayList<Object>();
//		ArrayBlockingQueue<Object> queue = getQueue(tad);
//		for (int i=0;i<num;i++){
//			list.add(new Object());
//		}
//		int count = list.size();
//		queue.addAll(list);
		update(tad.getTrain());
		System.out.println("Return ticket token: " + num);
		//return count;
		return num;
	}
}
