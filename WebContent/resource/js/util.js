

/***
 * Format a date to string with date or time
 * @param date
 * @returns {String}
 */
function formatDate(date, isDate, isTime) {

  var dd = date.getDate();
  if ( dd < 10 ) 
	  dd = '0' + dd;

  var MM = date.getMonth()+1;
  if ( MM < 10 ) 
	  MM = '0' + MM;

  var yyyy = date.getFullYear() ;
  if ( yyyy < 10 ) 
	  yyyy = "000"+yyyy;
  else if(yyyy<100)
	  yyyy = "00"+yyyy;
  else if(yyyy<1000)
	  yyyy = "0"+yyyy;
  
  var hh = date.getHours();
  if ( hh < 10 ) 
	  hh = '0' + hh;

  var mm = date.getMinutes();
  if ( mm < 10 ) 
	  mm = '0' + mm;
  
  var ss = date.getSeconds();
  if ( ss < 10 ) 
	  ss = '0' + ss;
  var sDate = "";
  if(isDate)
	  sDate += dd+'/'+MM+'/'+yyyy;
  if(isTime)
	  sDate += ((isDate)?" ":"")+hh+":"+mm+":"+ss;
  return sDate;
}


function formatDate2(date, isDate, isTime) {

	  var dd = date.getDate();
	  if ( dd < 10 ) 
		  dd = '0' + dd;

	  var MM = date.getMonth()+1;
	  if ( MM < 10 ) 
		  MM = '0' + MM;

	  var yyyy = date.getFullYear() ;
	  if ( yyyy < 10 ) 
		  yyyy = "000"+yyyy;
	  else if(yyyy<100)
		  yyyy = "00"+yyyy;
	  else if(yyyy<1000)
		  yyyy = "0"+yyyy;
	  
	  var hh = date.getHours();
	  if ( hh < 10 ) 
		  hh = '0' + hh;

	  var mm = date.getMinutes();
	  if ( mm < 10 ) 
		  mm = '0' + mm;
	  
	  var ss = date.getSeconds();
	  if ( ss < 10 ) 
		  ss = '0' + ss;
	  var sDate = "";
	  if(isDate)
		  sDate += yyyy+'/'+MM+'/'+ dd ;
	  if(isTime)
		  sDate += ((isDate)?" ":"")+hh+":"+mm+":"+ss;
	  return sDate;
	}


function parseDateFromString( dateString ){
	var reggie = /(\d{2})\/(\d{2})\/(\d{4}) (\d{2}):(\d{2}):(\d{2})/;
	var dateArray = reggie.exec(dateString); 
	var dateObj = new Date(
	    (+dateArray[3]),
	    (+dateArray[1])-1, // Careful, month starts at 0!
	    (+dateArray[2]),
	    (+dateArray[4]),
	    (+dateArray[5]),
	    (+dateArray[6])
	);
	return dateObj;
}

function parseOrderStatus(orderStatus) {
	if (orderStatus == 0){
		return "Cancelled";
	}
	else if (orderSataus == 1) {
		return "Success";
	}
	else if (orderStatus == 2) {
		return "Pending";
	}
	return "Error";
}






