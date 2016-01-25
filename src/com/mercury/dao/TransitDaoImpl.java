package com.mercury.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Train;
import com.mercury.beans.Transit;

public class TransitDaoImpl implements TransitDao {
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
	public void save(Transit transit) {
		this.template.save(transit);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transit> queryAll() {
		String hql = "from Transit order by trainNo";
		List <Transit> list = template.find(hql);
		return list;	
	}

	@Override
	public void delete(Transit transit) {
		template.delete(transit);
	}

	@Override
	public void update(Transit transit) {
		template.update(transit);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Transit findByNo(int transitNo) {
		String hql = "from Transit t where t.transitNo=:transitNo";
		Transit transit = null;
		List <Transit> list = template.findByNamedParam(hql,"transitNo",transitNo);
		if(list.size() != 0){
			transit = list.get(0);
		}
		System.out.println(transit);
		return transit;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transit> queryTransitsByTrainNo(int trainNo) {
		String hql = "from Transit t where t.train.trainNo=:trainNo order by t.seqNo";
		List <Transit> list = template.findByNamedParam(hql,"trainNo", trainNo);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Transit> queryTransitsByStationNo(int stationNo) {
		String hql = "from Transit t where t.station.stationNo=:stationNo order by t.seqNo";
		List <Transit> list = template.findByNamedParam(hql,"stationNo", stationNo);
		return list;
	}

	@Override
	public void deleteByTrain(Train train) {
		// TODO Auto-generated method stub
		int trainNo = train.getTrainNo();
		List <Transit> list = queryTransitsByTrainNo(trainNo);
		for (Transit t:list) {
			delete(t);
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public double queryPriceByStationsAndTrainNo(int departureStationNo,
			int arrivalStationNo, int trainNo) {
		String hql="select sum(t.price) from Transit t where t.train.trainNo=:trainNo and t.seqNo > " +
				"(select f.seqNo from Transit f where f.train.trainNo=:trainNo and f.station.stationNo=:departureStation) and t.seqNo<= " +
				"(select g.seqNo from Transit g where g.train.trainNo=:trainNo and g.station.stationNo=:arrivalStation)";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setInteger("departureStation", departureStationNo);
		query.setInteger("arrivalStation", arrivalStationNo);
		query.setInteger("trainNo", trainNo);
		List<Double> lPrice = query.list();
		double ticketPrice = 0.0;
		if(lPrice.size()>=0)
			ticketPrice = lPrice.get(0);
		return ticketPrice;
		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public Transit queryTransitsByStationAndTrainNo(int stationNo, int trainNo) {
		String hql = "from Transit t where t.station.stationNo=:stationNo and t.train.trainNo=:trainNo";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setInteger("stationNo", stationNo);
		query.setInteger("trainNo", trainNo);
		List<Transit> lTransit = query.list();
		Transit transit = null;
		if(lTransit.size()>=0)
			transit = lTransit.get(0);
		return transit;
	}
	
	

}
