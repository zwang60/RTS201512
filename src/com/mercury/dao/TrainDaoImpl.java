package com.mercury.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;

@Transactional
public class TrainDaoImpl implements TrainDao {
	private HibernateTemplate template;
	private Session session;
	public void setSessionFactory (SessionFactory sessionFactory) {
		template = new HibernateTemplate (sessionFactory);
	}
	
	public Session getCurrentSession(){
		if(session==null)
			session = template.getSessionFactory().openSession();
		return session;
	}

	@Override
	public void save(Train train) {
		this.template.save(train);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Train> queryAll() {
		String hql = "from Train order by trainNo";
		List <Train> list = template.find(hql);
		return list;
	}

	@Override
	public void delete(Train train) {
		this.template.delete(train);
	}

	@Override
	public void update(Train train) {
		this.template.update(train);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Train findByNo(int trainNo) {
		String hql = "from Train t where t.trainNo=:trainNo";
		Train train = null;
		List <Train> list = template.findByNamedParam(hql,"trainNo",trainNo);
		System.out.println(list.size());
		if(list.size() != 0){
			train = list.get(0);
		}
		System.out.println(train);
		return train;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Train> queryTrainsByStationsAndDate(int departureStationNo,
			int arrivalStationNo, Date departureTime) {
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss");
		String sDate = formatter.format(departureTime);
		
		Calendar cDepartureTime = new GregorianCalendar();
		cDepartureTime.setTime(departureTime);
		cDepartureTime.set(1900, 01, 01);
		String hql = "select t1.train from Transit t1, Transit t2 "
				+ " where t1.train.trainNo=t2.train.trainNo " 
				//+ " and t1.arrivalTime>TO_TIMESTAMP(:departureDateTime, 'mm/dd/yyyy hh24:mi:ss')"
				+ " and t2.arrivalTime>t1.arrivalTime " 
				+ " and t1.station.stationNo=:departureStationNo and t2.station.stationNo=:arrivalStationNo";
		Train train = null;
		System.out.println(cDepartureTime.getTime() + " : " + departureStationNo + " : " + arrivalStationNo);
		Query query = this.getCurrentSession().createQuery(hql);
		//query.setString("departureDateTime", sDate);
		query.setInteger("departureStationNo", departureStationNo);
		query.setInteger("arrivalStationNo", arrivalStationNo);
		//System.out.println(query.getQueryString());

		List <Train> list = query.list();
		System.out.println(list.size());
		if(list.size() != 0){
			Iterator<Train> iter = list.iterator();
			while(iter.hasNext()){
				train = iter.next();
				System.out.println(train);
			}

		}
		return list;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public int queryCountByTrainAndDate(TrainSchedule tad) {
		// TODO Auto-generated method stub
		Train train = tad.getTrain();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d = tad.getDepartureDate();
		String date = format.format(d);
		System.out.println(d);
		System.out.println(date);
		//date = "2015-09-25";
	
		String hql = "select count(*) from Ticket t where to_char(t.executeDate,'yyyy-MM-dd') = :date and t.departureTransit.train = :train and t.order.orderStatus = 1";
		
		String [] params = new String[] {"date", "train"};
		Object [] values = new Object[] {date, train};
		List <Long> list = template.findByNamedParam(hql,params, values);	
		long result = list.get(0);
		System.out.println(result);
		return (int)result;

	}
}
