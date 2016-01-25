

angular.module("mainModule", [ "ngTouch", "angucomplete-alt", '720kb.datepicker'])
	.controller("mainController",[ '$scope', '$http' , '$window', 
	                               function ($scope, $http , $window) {
		$scope.selectedStation = [];
		$scope.departureStation = []; 
		$scope.arrivalStation = [];
		$scope.stations = [];
		$scope.stations2 = [];
		$scope.data = [];
		$scope.departureDate =[];
		$scope.cartqty = 0;
		
		$scope.dateMin =  "" ;
		var orival  = [];
		
		$scope.getCartQty = function () {
  			
    		$http({
    			method: "POST",
    			url: "/MyRTS/resource/cart/get/qty",
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
    			$scope.cartqty = data;
    			    		
    		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
        		$scope.cartqty = "?";
      		});
  		};
  		$scope.getCartQty();
		
		$scope.getCoStations = function(val){
			if(val == orival){
				return;
			}else{
				orival = val;
			};
			console.log("Suggestion selected: " + val );
		};
		
  		$scope.getStations = function (resultVarName) {

    		$http({
    			method: "GET",
    			url: "/MyRTS/resource/station/get/all",
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
        		$scope[resultVarName] = data;
        		$scope.data = data;
        		$scope.stations2 = data;
        		//$scope.stations = data;
        		angular.forEach($scope.stations2 , function(val){
        			//$scope.stations.push("#"+val.stationNo + " - " + val.name + ", " + val.city + ", " +val.state);
        			val.display = "#"+val.stationNo + " - " + val.name + ", " + val.city + ", " +val.state;
        		});
        		//$scope.addStation()
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "CANNOT LOAD STATIONS";
      		});
  		};

  		$scope.getStations();
  		
  		$scope.bookTicket = function(resultVarName){
  			//alert($scope.departureStation.originalObject.stationNo);
  			$window.location.href = ("/MyRTS/search/" + $scope.departureStation.originalObject.stationNo
  					+ "/" +  $scope.arrivalStation.originalObject.stationNo
  					+ "/" + new Date($scope.departureDate).getTime() + ".html");
  			
  		};
  		
	}]);	