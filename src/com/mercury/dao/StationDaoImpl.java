package com.mercury.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.Station;

public class StationDaoImpl implements StationDao{
	private HibernateTemplate template;
	public void setSessionFactory (SessionFactory sessionFactory) {
		template = new HibernateTemplate (sessionFactory);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Station> getStations(){
		// TODO Auto-generated method stub		
		String hql = "from Station order by stationNo";
		List <Station> list = template.find(hql);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Station findStationByNo(int stationNo){
		// TODO Auto-generated method stub	
		String hql = "from Station s where s.stationNo = :stationNo";
		List <Station> list = template.findByNamedParam(hql,"stationNo",stationNo);
		if (list ==null) {
			return null;
		}
		for (Station s:list){
			System.out.println(s);
		}
		return list.get(0);
	}


	@Override
	public void addStation(Station station) {
		// TODO Auto-generated method stub
		template.save(station);
	}


	@Override
	public void updateStation(Station station) {
		// TODO Auto-generated method stub
		template.update(station);		
	}


	@Override
	public void deleteStation(Station station) {
		// TODO Auto-generated method stub
		template.delete(station);
	}


}
