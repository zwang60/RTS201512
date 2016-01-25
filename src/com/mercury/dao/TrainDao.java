package com.mercury.dao;

import java.util.Date;
import java.util.List;

import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;


public interface TrainDao {
	public void save(Train train);
	public List<Train> queryAll();
	public void delete(Train train);
	public void update(Train train);
	public Train findByNo(int trainNo);
	public List<Train> queryTrainsByStationsAndDate(int departureStationNo, int arrivalStationNo, Date departureTime);
	public int queryCountByTrainAndDate(TrainSchedule tad);

}
