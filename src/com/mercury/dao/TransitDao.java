package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Train;
import com.mercury.beans.Transit;

public interface TransitDao {
	public void save(Transit transit);
	public List<Transit> queryAll();
	public void delete(Transit transit);
	public void update(Transit transit);
	public Transit findByNo(int transitNo);
	public void deleteByTrain(Train train);
	public List<Transit> queryTransitsByTrainNo(int trainNo);
	public List<Transit> queryTransitsByStationNo(int stationNo);
	public double queryPriceByStationsAndTrainNo(int departureStation,
			int arrivalStation, int trainNo);
	public Transit queryTransitsByStationAndTrainNo(int stationNo, int trainNo);
}
