angular.module("mainModule", [])
		.controller("mainController", ['$scope','$http','$q', function ($scope, $http , $q) {

				
		  		$scope.cartTicket = {
	  					departureStation: "",
	  					arrivalStation: "",
	  					departureDateTime: "",
	  					trainNo: "",
	  					qty: 0
	  			};
				
				$scope.cart = [];
				$scope.canShowCart = false;
				$scope.cartqty = 0;
				$scope.getCart = function () {
		  			
		    		$http({
		    			method: "POST",
		    			url: "/MyRTS/resource/cart/get/all",
		    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		    		}).success(function (data, status, headers, config) {
		    			//alert(data);
		    			$scope.cart = data;
		    			$scope.canShowCart = true;
						angular.forEach($scope.cart , function( ticket){
							ticket.key.departureDate = formatDate(new Date(ticket.key.executeDate), true, false);
							ticket.key.departureTime = formatDate(new Date(ticket.key.departureTransit.arrivalTime),false, true);
							ticket.key.arrivalTime = formatDate(new Date(ticket.key.arrivalTransit.arrivalTime),false,true);
						});
		    		
		    		}) .error(function (data, status, headers, config) {
		        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
		      		});
		  		};
		  		
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
		  		
		  		
		  		$scope.getTotalCount = function(){
		  			var count = 0;
		  			angular.forEach($scope.cart , function( ticket){
						count += ticket.value;
					});
		  			return count;
		  		};
		  		
		  		$scope.getTotalPrice = function(){
		  			var total = 0.0;
		  			angular.forEach($scope.cart , function( ticket){
						total += ticket.value*ticket.key.price;
					});
		  			return total;	
		  		};
		  		
		  		$scope.removeTicketFromCart = function(index){
		  			
		  			$scope.cart.splice(index , 1);
		  		};
		  		
		  		
		  		$scope.updateCart = function(ticket,resultVarName){
		  			var ct = angular.copy($scope.cartTicket);
	  				ct.departureStation = ticket.key.departureTransit.station.stationNo;
	  				ct.arrivalStation = ticket.key.arrivalTransit.station.stationNo;
	  				ct.departureDateTime = ticket.key.executeDate;
	  				ct.trainNo = ticket.key.departureTransit.train.trainNo;
	  				ct.qty = ticket.value;
	  		
	  				var params = $.param(ct); 
	  			    //delete $http.defaults.headers.common['X-Requested-With'];
	  	    		$http({
	  	    			method: "POST",
	  	    			url: "/MyRTS/resource/cart/update/ticket/",
	  	    			data: params,
	  	    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	  	    		}).success(function (data, status, headers, config) {
	  	    			//alert(data);
	  	    			//$scope.cart.ticketsQty = data;
	  	        		
	  	      		}) .error(function (data, status, headers, config) {
	  	        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
	  	      		});
		  		};
		  		
		  		
		  		$scope.removeEntry = function(ticket,index,resultVarName){
		  			var ct = angular.copy($scope.cartTicket);
	  				ct.departureStation = ticket.key.departureTransit.station.stationNo;
	  				ct.arrivalStation = ticket.key.arrivalTransit.station.stationNo;
	  				ct.departureDateTime = ticket.key.executeDate;
	  				ct.trainNo = ticket.key.departureTransit.train.trainNo;
	  		
	  				var params = $.param(ct); 
	  			    //delete $http.defaults.headers.common['X-Requested-With'];
	  	    		$http({
	  	    			method: "POST",
	  	    			url: "/MyRTS/resource/cart/remove/ticket/",
	  	    			data: params,
	  	    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	  	    		}).success(function (data, status, headers, config) {
	  	    			//alert(data);
	  	    			//$scope.cart.ticketsQty = data;
	  	        		$scope.removeTicketFromCart(index);
	  	      		}) .error(function (data, status, headers, config) {
	  	        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
	  	      		});
		  		};
		  		
		  		$scope.getCart();
			}
		]);