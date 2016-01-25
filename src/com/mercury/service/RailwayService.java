package com.mercury.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.Station;
import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;
import com.mercury.beans.Transit;
import com.mercury.dao.OrderDao;
import com.mercury.dao.StationDao;
import com.mercury.dao.TicketDao;
import com.mercury.dao.TrainDao;
import com.mercury.dao.TransitDao;

@Service
@Transactional(readOnly=true)
public class RailwayService {
	
	private StationDao sd;
	
	private TrainDao td;
	
	private TransitDao transitd;

	private OrderDao od;
	
	private TicketDao ticketDao;
	/*******************************
	*	Train operation
	******************************/
	
	public void setTd(TrainDao td){
		System.out.println("RailwayService injection:@" + this.hashCode());
		this.td = td;
	}
	
	public TrainDao getTd(){
		return this.td;
	}
	
	public List<Train> loadTains(){
		return td.queryAll();
	}
	
	public Train loadTrainByNo(int trainNo){
		return td.findByNo(trainNo);
	}
	
	public void addTrain(Train train){
		td.save(train);
		System.out.println(train);
	}
	
	public void deleteTrain(Train train){
		transitd.deleteByTrain(train);
		td.delete(train);
		System.out.println(train);
	}
	
	public void updateTrain(Train train){
		transitd.deleteByTrain(train);
		td.update(train);
		System.out.println(train);
	}
	
	/*******************************
	*	Station operation
	******************************/
	
	public StationDao getSd() {
		return sd;
	}
	public void setSd(StationDao sd) {
		this.sd = sd;
	}
	public List<Station> getStations(){
		List<Station> list = sd.getStations();
		return list;
	}
	
	public void addStation(Station station){
		sd.addStation(station);
	}
	
	public void deleteStation(Station station){
		sd.deleteStation(station);
	}
	
	public void updateStation(Station station){
		sd.updateStation(station);
	}
	
	/*******************************
	*	Order History
	******************************/
	public OrderDao getOd() {
		return od;
	}
	public void setOd(OrderDao od) {
		this.od = od;
	}
	
			
	/*******************************
	*	Transit operation
	******************************/

	public TransitDao getTransitd() {
		return transitd;
	}

	public void setTransitd(TransitDao transitd) {
		this.transitd = transitd;
	}
	
	public List<Transit> loadTransits() {
		return this.transitd.queryAll();
	}
	
	public List<Transit> getTransitsByStationNo(int stationNo){
		return this.transitd.queryTransitsByStationNo(stationNo);
	}
	
	public List<Transit> getTransitsByTrainNo(int trainNo){
		return this.transitd.queryTransitsByTrainNo(trainNo);
	}

	public void addTransit(int trainNo, int seqNo, int stationNo,
			Timestamp arrivalTime, int stopDuration, double price) {
		// TODO Auto-generated method stub
		Train train = td.findByNo(trainNo);
		System.out.println(train);
		Station station = sd.findStationByNo(stationNo);
		Transit transit = new Transit( 0,  train,  seqNo,  station,
				 arrivalTime,  stopDuration,  price);
		System.out.println(transit);
		this.transitd.save(transit);
		//this.getTransitd().save(transit);
	}
	
	public List<Train> getTrainsByStationsAndDate(int departureStationNo, int arrivalStationNo, Date departureDate){
		return td.queryTrainsByStationsAndDate( departureStationNo,  arrivalStationNo,  departureDate);
	}
	
	public TrainSchedule getTrainAvailableTickets(TrainSchedule schedule){
		
		int count = this.td.queryCountByTrainAndDate(schedule);
		schedule.setAvailableTickets(schedule.getTrain().getTotalTicketQty()-count);
		return schedule;
	}
	
	public List<TrainSchedule> getScheduleListByTrainAndDate(int departureStationNo, int arrivalStationNo, Date departureDateTime){
		List<TrainSchedule> lSchedule = new ArrayList<TrainSchedule>();
		List<Train> lTrains = this.getTrainsByStationsAndDate(departureStationNo,arrivalStationNo,departureDateTime);
		for(Train train : lTrains){
			TrainSchedule schedule = new TrainSchedule(train, departureDateTime);
			this.getTrainAvailableTickets(schedule);
			lSchedule.add(schedule);
		}
		return lSchedule;
	}
	
	public List<TrainSchedule> getAllSchedule(){
		List<TrainSchedule> lSchedule = new ArrayList<TrainSchedule>();
		for (TrainSchedule ts:TicketContainer.getMap().keySet()){
			int avaliable = ts.getTrain().getTotalTicketQty() - this.td.queryCountByTrainAndDate(ts);
			ts.setAvailableTickets(avaliable);
			lSchedule.add(ts);
		}
		return lSchedule;
	}

	public double getTicketPriceByStationsAndTrainNo(
			int departureStation, int arrivalStation, int trainNo) {

		return  this.transitd.queryPriceByStationsAndTrainNo( departureStation,  arrivalStation,  trainNo);
	}
	
	public Transit getTransitByStationAndTrainNo(int stationNo, int trainNo){
		return this.transitd.queryTransitsByStationAndTrainNo(stationNo,trainNo);
	}
	
	public List<Station> getArrivalStationByDepartureStationId(int departureStationId){
		List<Transit> lTransits = this.transitd.queryTransitsByStationNo(departureStationId);
		List<Station> lStations = new ArrayList<Station>();
		Iterator<Transit> iter = lTransits.iterator();
		
		while(iter.hasNext()){
			lStations.add(iter.next().getStation());
		}
		return lStations;
	}

	public int queryCountByTrainAndDate(TrainSchedule trainSchedule) {
		// TODO Auto-generated method stub
		return this.td.queryCountByTrainAndDate(trainSchedule);
	}
	
}
