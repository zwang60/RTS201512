angular.module("mainModule", [])
		.controller("mainController", ['$scope','$http','$q', '$window',function ($scope, $http , $q, $window) {

				
		  		$scope.cartTicket = {
	  					departureStation: "",
	  					arrivalStation: "",
	  					departureDateTime: "",
	  					trainNo: "",
	  					qty: 0
	  			};
				
		  		
		  		$scope.cc = {
		  			firstName: "",
		  			lastName: "",
		  			userID: "",
		  			cardNo: "",
		  			cardType: "",
		  			exp: "",
		  			billingAddr: "",
		  			city: "",
		  			state: "",
		  			zip: ""
		  		};
		  		
		  		$scope.originalCC = angular.copy($scope.creditCard);
		  		
		  		
		  		
				$scope.cart = [];
				$scope.canShowCart = false;
				$scope.isSubmitOrder = false;
				$scope.cartqty = 0;
				
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
				
				
				$scope.getCart = function () {
					$scope.isSubmitOrder = true;

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
						$scope.isSubmitOrder = false;
						
						
		    		}) .error(function (data, status, headers, config) {
		        		$scope[resultVarName] = "ERROR: fail to submit order.";
		        		$scope.isSubmitOrder = false;
		      		});
		  		};
		  		
		  		
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
		  			
		  		$scope.checkout = function(resultVarName){
		  			angular.forEach($scope.cc, function(val){
		  				//alert(val);
		  			});
		  			$scope.isSubmitOrder = true;
		  			var cc = angular.copy($scope.cc);
	  		
	  				var params = $.param(cc); 
	  			    //delete $http.defaults.headers.common['X-Requested-With'];
	  	    		$http({
	  	    			method: "POST",
	  	    			url: "/MyRTS/resource/order/submit/",
	  	    			data: params,
	  	    			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
	  	    		}).success(function (data, status, headers, config) {
	  	    			$scope.isSubmitOrder = false;
	  	    			//$scope.cart.ticketsQty = data;
	  	    			$window.location.href = ("/MyRTS/main.html");  
	  	      		}) .error(function (data, status, headers, config) {
	  	        		$scope[resultVarName] = "ERROR: fail to add tickets into cart.";
	  	        		$scope.isSubmitOrder = false;
	  	      		});
		  		};
		  		
		  		$scope.checkCard = function(cardNo) {
					if (cardNo > 9999999999999999) return false;
					if (cardNo < 1000000000000000) return false;
					var i = 0;
					var sum = 0;
					for (i=0;i<16;i++){
						var temp = cardNo % 10;
						cardNo = (cardNo-temp) / 10;
						if (i%2 == 1) {
							temp = temp * 2;
						}
						if (temp > 9) {
							temp = temp - 9;
						}
						sum = sum + temp;
					}					
					if (sum % 10 == 0) {

						return true;
					}
					return false;
				};
		  		
		  		$scope.getCart();
		  		
			}
		]);