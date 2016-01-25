
	angular.module("mainModule",  [ "ngTouch", "angucomplete-alt", '720kb.datepicker'])
	.controller("mainController", ['$scope','$http','$q', function ($scope, $http , $q) {
  		
		$scope.departureStation = []; 
		$scope.arrivalStation = [];
		$scope.departureDate =[];
		
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
  	  			departureStation: [],
  	  			arrivalStation: [],
  	  			departureDateTime: ""
  	  	};
  		
  		/*$scope.trainSearch = {
  	  			departureStation: $scope.departureStation,
  	  			arrivalStation: $scope.arrivalStation,
  	  			departureDateTime: $scope.departureDate
  	  	};*/
  		
  		$scope.cart = [];
  		$scope.cart.ticketsQty = 0;
  		
  		
  		$scope.trains = [];
  		$scope.schedules = [];
  		$scope.transits = [];
  		$scope.stations2 = [];
  		$scope.canShow = false;
  		$scope.canShowTransits = false;
  		$scope.canShowAddToCart = false;
  		$scope.isAddingTickets = false;
  	    
  		$scope.price = 0.0;
  		$scope.cartqty = 0;
  		$scope.currTrain = angular.copy($scope.train);
  		$scope.currSchedule = angular.copy($scope.schedule);
  		var oriTrainSearch = angular.copy($scope.trainSearch);

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
  	    
  	    
  	    $scope.resetResult = function(){
  	    	$scope.canShow = false;
  	      	$scope.canShowTransits = false;
  	      	$scope.canShowAddToCart = false;
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
  	    		
  	    		//$scope.getTransits(schedule.train.trainNo);
  	    		
  	    		$scope.promise($scope.trainSearch.departureStation , $scope.trainSearch.arrivalStation, schedule.train.trainNo);
  	    	//}
  	    		
  	    };

  	    
  		/*$scope.submitData = function (trainSearch, resultVarName) {
		    var params = $.param({
		    	departureStation: trainSearch.departureStation.originalObject.stationNo,
	        	arrivalStation:trainSearch.arrivalStation.originalObject.stationNo,
	        	departureDate: new Date(trainSearch.departureDateTime).getTime()
		    });
		    alert(trainSearch);
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
        		$scope.canShowAddToCart = true;
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};*/
  		
  		$scope.submitData = function (resultVarName) {
  			
  			
		    var params = $.param({
		    	departureStation: $scope.departureStation.originalObject.stationNo,
	        	arrivalStation: $scope.arrivalStation.originalObject.stationNo,
	        	departureDate: new Date($scope.departureDate).getTime()
		    });
		    
		    $scope.trainSearch = {
	  	  			departureStation: $scope.departureStation,
	  	  			arrivalStation: $scope.arrivalStation,
	  	  			departureDateTime: $scope.departureDate
	  	  	};
		    
		    alert($scope.departureStation.originalObject.stationNo);
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
        		$scope.canShowAddToCart = true;
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};
  		
  		
  		$scope.getTransits = function (trainNo,resultVarName) {
		    var params = $.param({
		    	trainNo: trainNo
		    }); 
		    //delete $http.defaults.headers.common['X-Requested-With'];
    		$http({
    			method: "POST",
    			url: "/MyRTS/resource/transit/get/by-train/",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
    			$scope.transits = data;
        		for(var i = 0 ; i < $scope.transits.length ; i++){
        			$scope.transits[i].arrivalTime = formatDate(new Date($scope.transits[i].arrivalTime),false,true);
        		}
        		
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};
  		
  		
  		$scope.getTicketPrice = function (departureStation, arrivalStation, trainNo) {
		    var params = $.param({
		    	departureStation: departureStation.originalObject.stationNo,
		    	arrivalStation: arrivalStation.originalObject.stationNo,
		    	trainNo: trainNo
		    }); 
		   // alert(departureStation);
		    //delete $http.defaults.headers.common['X-Requested-With'];
    		$http({
    			method: "POST",
    			url: "/MyRTS/resource/ticket/get/price/by-stations-train/",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
    			$scope.price = parseFloat(data).toFixed(2);
        		
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "SUBMIT ERROR";
      		});
  		};
  		
  		
  		$scope.promise = function(departureStation, arrivalStation, trainNo){
  			$q.all([$scope.getTransits(trainNo),$scope.getTicketPrice(departureStation, arrivalStation, trainNo)])
  			.then(function () {
    			//alert("done");
    			$scope.canShowTransits = true;
      		}) ;
  		};
  		
  		
  		
  		$scope.addTicketToCart = function ( cartTicket ) {
  			$scope.isAddingTickets = true;
  			
		    var params = $.param(cartTicket); 
		    //delete $http.defaults.headers.common['X-Requested-With'];
    		$http({
    			method: "POST",
    			url: "/MyRTS/resource/cart/add/ticket/",
    			data: params,
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    		}).success(function (data, status, headers, config) {
    			//alert(data);
    			$scope.cart.ticketsQty = data;
        		
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
      		});
  		};
  		
  		
  		$scope.cartTicket = {
  					departureStation: "",
  					arrivalStation: "",
  					departureDateTime: "",
  					trainNo: "",
  					qty: 0
  		};
  	
  		
  		$scope.addTicketsToCart  = function(){
  			var promiseAddTickets = [];
  			
  			var paramList = [];
  			for(var i = 0 ; i<$scope.schedules.length ; i++){
  				//alert($scope.schedules[i].bookingQty);
  				//alert(new Date($scope.schedules[i].departureDate));
  				var ct = angular.copy($scope.cartTicket);
  				ct.departureStation = $scope.trainSearch.departureStation.originalObject.stationNo;
  				ct.arrivalStation = $scope.trainSearch.arrivalStation.originalObject.stationNo;
  				//alert($scope.schedules[i].departureDate);
  				ct.departureDateTime = $scope.schedules[i].departureDate;
  				ct.trainNo = $scope.schedules[i].train.trainNo;
  				ct.qty = $scope.schedules[i].bookingQty;
  				if( !ct.qty || ct.qty <=0)
  					continue;
  				paramList.push(ct);
  			}
  			
  			angular.forEach(paramList, function(ct){
  				promiseAddTickets.push($scope.addTicketToCart(ct));
  			});

  			$q.all(promiseAddTickets).then(function(){
  				//alert("all tickets added to cart.");
  				angular.forEach($scope.schedules, function(schedule){
  					schedule.bookingQty = '';
  				}); 
  				$scope.fmAddCart.$setPristine();
  				$scope.isAddingTickets = false;
  				$scope.getCartQty();
  			});
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
        			if($scope.a1 && $scope.a1==val.stationNo){
        				//$scope.arrivalInit = val.display;
        				$scope.trainSearch.arrivalStation.originalObject = val;
        			}
        			if($scope.d1 && $scope.d1==val.stationNo){
        				//$scope.departureInit = val.display;
        				$scope.trainSearch.departureStation.originalObject = val;
        			}
        			
        		});

    			$scope.$broadcast('angucomplete-alt:changeInput', 'ex14', $scope.trainSearch.departureStation.originalObject);
    			$scope.$broadcast('angucomplete-alt:changeInput', 'ex15', $scope.trainSearch.arrivalStation.originalObject);

        		//$scope.addStation()
      		}) .error(function (data, status, headers, config) {
        		$scope[resultVarName] = "CANNOT LOAD STATIONS";
      		});
  		};

  		$scope.getStations();
  		
  		
  		$scope.findStation = function (val){
  			console.log("init st:"+val);

	  			angular.forEach($scope.stations2, function(st){
	  				if(st.originalObject.stationNo == val){
	  					$scope.trainSearch.departureStation = st;
	  					return;
	  				}
	  			});
  			
  		};
  		
  		
  		

	}]);	