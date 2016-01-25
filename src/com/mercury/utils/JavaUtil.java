package com.mercury.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class JavaUtil {
	public static Date convertDateTimeWithoutDate(Date datetime){
		Calendar cal = new GregorianCalendar();
		cal.setTime(datetime);
		cal.set(Calendar.YEAR, 1970);
		cal.set(Calendar.MONTH, 1);
		cal.set(Calendar.DATE, 1);
		return cal.getTime();
	}
	
	public static Date convertDateTimeWithoutTime(Date datetime){
		Calendar cal = new GregorianCalendar();
		cal.setTime(datetime);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	public static boolean compareDateOnlyWithoutTime(Date datetime1 ,Date datetime2){
		Date dt1 = convertDateTimeWithoutTime(datetime1);
		Date dt2 = convertDateTimeWithoutTime(datetime2);
		
		return dt1 == dt2;
		
	}
	
	
	public static boolean compareTimeOnlyWithoutDate(Date datetime1 ,Date datetime2){
		Date dt1 = convertDateTimeWithoutDate(datetime1);
		Date dt2 = convertDateTimeWithoutDate(datetime2);
		
		return dt1 == dt2;
		
	}
	
	
}
