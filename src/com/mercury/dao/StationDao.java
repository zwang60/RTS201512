package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Station;

public interface StationDao {
	public List<Station> getStations();
	public Station findStationByNo(int stationNo);
	public void addStation(Station station);
	public void deleteStation(Station station);
	public void updateStation(Station station);
}
