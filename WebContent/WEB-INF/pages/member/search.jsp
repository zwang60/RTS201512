<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
<script src="<c:url value="/resource/js/jquery/jquery-2.1.4.js"/>"></script>
<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
<script>
	$(document).ready(function(){
		$("#searchTrain").on("click",searchTrainList);
		
	});

	
	function searchTrainList(){
		alert("btn click");
		$.ajax({
			  	type: "POST",
			  	url: "/MyRTS/resource/train/get/by-stations-date",
			  	data: { 
			  		departureStation: $("#departureStation").val(), 
				  	arrivalStation: $("#arrivalStation").val(),
				  	departureDateTime: $("#departureDateTime").val() },
				dataType: "json",
				success: displayTrainList
			});
		
	}

	
	function displayTrainList( msg ) {
	    alert( "Data get: " + msg );
	}
	
	
	angular.module("mainModule", [])
	.controller("mainController", function ($scope, $http) {
  		$scope.train = {
  			trainNo: "",
  			totalTicketQty: 0,
  			enable: true
  		};
  		
  		$scope.schedule = {
  			train: $scope.train,
  			departureDate: "",
  			availableTickets: 0
  		};
  		
  		$scope.trainSearch = {
  	  			departureStation: "",
  	  			arrivalStation: "",
  	  			departureDateTime: ""
  	  	};
  		
  		
  		$scope.trains = [];
  		$scope.schedules = [];
  		$scope.canShow = false;
  		$scope.canShowTransits = false;
  		
  		$scope.currTrain = angular.copy($scope.train);
  		$scope.currSchedule = angular.copy($scope.schedule);
  		var oriTrainSearch = angular.copy($scope.trainSearch);

  	    
  	    
  	    $scope.resetResult = function(){
  	    	$scope.canShow = false;
  	      	$scope.canShowTransits = false;
  	    };
  	    
  	  $scope.resetForm = function () {
	      	$scope.trainSearch = angular.copy(oriTrainSearch);
	      	$scope.fmSearchTrain.$setPristine();
	      	$scope.resetResult();
	    };

  	    $scope.isSearchTrainFormChanged = function () {
  	      	return !angular.equals($scope.trainSearch, oriTrainSearch);
  	    };
  	    
  	    $scope.selectSchedule = function(schedule){
  	    	//alert(schedule.train.trainNo);
  	    	//if(train.tranNo){ 
  	    		$scope.currSchedule = angular.copy(schedule);
  	    		$scope.currTrain = angular.copy(schedule.train);
  	    		$scope.canShowTransits = true;
  	    	//}
  	    		
  	    };

  	    
  		$scope.submitData = function (trainSearch, resultVarName) {
		    var params = $.param({
		    	departureStation: trainSearch.departureStation,
	        	arrivalStation: trainSearch.arrivalStation,
	        	departureDateTime: trainSearch.departureDateTime
		    });
    		$http({
    			method: "POST",
    			url: "/MyRTS/resource/schedule/get/by-stations-date",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
        		$scope[resultVarName] = data;
        		$scope.schedules = data;
        		$scope.canShow = true;
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};
	});	
</script>
</head>
<body ng-app="mainModule">
	<h1>
		<font color="blue">${title}</font>
	</h1>
	<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>

	<div ng-controller="mainController">
		<form id="fmSearchTrain" name="fmSearchTrain" ng-submit="submitData(trainSearch, 'ajaxResult')" >
			<table>
				<tbody>
					<tr>
						<td>Departure Station:</td>
						<td><input id="departureStation" ng-model="trainSearch.departureStation"  ng-change="resetResult()" required></td>
					</tr>
					<tr>
						<td>Arrival Station:</td>
						<td><input id="arrivalStation" ng-model="trainSearch.arrivalStation" ng-change="resetResult()" required></td>
					</tr>
					<tr>
						<td>Departure date &amp; time:</td>
						<td><input id="departureDateTime" ng-model="trainSearch.departureDateTime" ng-change="resetResult()" ></td>
					</tr>
					<tr>
						<td><button type="button" ng-click="resetForm()" ng-disabled="!isSearchTrainFormChanged()">Reset</button>
					</td>
						<td><button type="submit" ng-disabled="fmSearchTrain.$invalid">Search
								Trains</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<div id="divSelectTrain" ng-show="canShow">
			
			<table border="1" width="200">
				<thead>
	        		<tr>
			          <th>Train No</th>
			          <th>Total Ticket Quantity</th>
			          <th>Available Ticket Quantity</th>
	        		</tr>
	      		</thead>
	      		<tbody>
	        		<tr ng-repeat="schedule in schedules"  ng-click="selectSchedule(schedule)">
	          			<td>{{schedule.train.trainNo}}</td>
	          			<td>{{schedule.train.totalTicketQty}}</td>
	          			<td>{{schedule.availableTickets}}</td>
	        		</tr>
	      		</tbody>
			</table>
		</div>
		
		<div id="divDisplayTrainTransits"   ng-show="canShowTransits">
			<p id="currTrainNo">Selected Train: {{currSchedule.train.trainNo}}</p>
		</div>
	</div>
</body>
</html>