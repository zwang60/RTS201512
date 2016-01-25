<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>

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
  		
  		$scope.trainSearch = {
  	  			departureStation: "",
  	  			arrivalStation: "",
  	  			departureDateTime: ""
  	  	};
  		
  		
  		$scope.trains = [];
  		$scope.canShow = false;
  		$scope.canShowTransits = false;
  		$scope.currTrain = angular.copy($scope.train);
  		
  		var oriTrainSearch = angular.copy($scope.trainSearch);

  	    $scope.resetForm = function () {
  	      	$scope.trainSearch = angular.copy(oriTrainSearch);
  	      	$scope.fmSearchTrain.$setPristine();
  	      	$scope.canShow = false;
  	      	$scope.canShowTransits = false;
  	    };

  	    $scope.isSearchTrainFormChanged = function () {
  	      	return !angular.equals($scope.trainSearch, oriTrainSearch);
  	    };
  	    
  	    $scope.selectTrain = function(train){
  	    	alert(train.trainNo);
  	    	//if(train.tranNo){ 
  	    		$scope.currTrain = angular.copy(train);
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
    			url: "/MyRTS/resource/train/get/by-stations-date",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
        		$scope[resultVarName] = data;
        		$scope.trains = data;
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
						<td><input id="departureStation" ng-model="trainSearch.departureStation" required></td>
					</tr>
					<tr>
						<td>Arrival Station:</td>
						<td><input id="arrivalStation" ng-model="trainSearch.arrivalStation" required></td>
					</tr>
					<tr>
						<td>Departure date &amp; time:</td>
						<td><input id="departureDateTime" ng-model="trainSearch.departureDateTime" ></td>
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
	        		</tr>
	      		</thead>
	      		<tbody>
	        		<tr ng-repeat="train in trains"  ng-click="selectTrain(train)">
	          			<td>{{train.trainNo}}</td>
	          			<td>{{train.totalTicketQty}}</td>
	        		</tr>
	      		</tbody>
			</table>
		</div>
		
		<div id="divDisplayTrainTransits"   ng-show="canShowTransits">
			<p id="currTrainNo">Selected Train: {{currTrain.trainNo}}</p>
		</div>
	</div>
</body>
</html>