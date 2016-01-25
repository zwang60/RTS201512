<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User CreditCard</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
	<script>
	angular
			.module("creditcardModule", [])
			.controller(
					"creditcardController",
					function($scope, $http) {
						// Initialization
						$scope.creditcardData = [];
						$http({
							method : "GET",
							url : "/MyRTS/member/creditcarddata",
						}).success(function(data) {
							//alert(data);
							$scope.creditcardData = data;
						}).error(function(data) {
							alert("AJAX Error!");
						});

						$scope.removeCard = function(selected, index) {
							//alert(selected.cardId);		
							var params = $.param({
								cardId : selected.cardId
							});
							$http(
									{
										method : "POST",
										url : "/MyRTS/member/removecreditcard/",
										data : params,
										headers : {
											'Content-Type' : 'application/x-www-form-urlencoded'
										}
									}).success(function(status) {
								console.log(status);
								$scope.creditcardData.splice(index, 1);
								$scope.selected = null;
							}).error(function() {
								alert('ERROR');
							});

						};

						$scope.saveCard = function(selected) {
							//alert(selected.cardNo);
							var params = $.param({
								paymentBrand : selected.paymentBrand,
								cardId : selected.cardId,
								cardNo : selected.cardNo,
								firstName : selected.firstName,
								lastName : selected.lastName,
								expiration : selected.expiration,
								billingAddr : selected.billingAddr,
								city : selected.city,
								state : selected.state,
								zipCode : selected.zipCode
							});
							//alert(station.stationNo);
							$http(
									{
										method : "POST",
										url : "/MyRTS/member/editcreditcard/",
										data : params,
										headers : {
											'Content-Type' : 'application/x-www-form-urlencoded'
										}
									}).success(function(status) {
								console.log(status);
							}).error(function() {
								alert('ERROR');
							});
						};

						$scope.editCard = function(selected,$index) {
							//alert(selected.cardNo);
							$scope.editing = $scope.creditcardData.indexOf($index);
						};

						$scope.saveField = function(selected,$index) {
							if ($scope.editing !== false) {
								$scope.editing = false;
							}
						};

					});
	</script>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.html">RailwayTicketingSystem</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="dashboard.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="ticket.html"><i class="fa fa-tasks"></i> Tickets</a></li>                    
                    <li class="active"><a href="creditcard.html"><i class="fa fa-globe"></i> CreditCard</a></li>
                    <li><a href="order.html"><i class="fa fa-list-ol"></i> Order</a></li>
                    <li><a href="checkout.html"><i class="fa fa-font"></i> CheckOut</a></li>                
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown user-dropdown">
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>  ${username }<b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li><a href="/MyRTS/main.html"><i class="fa fa-user"></i> MainPage</a></li>
                           <li class="divider"></li>
                           <li><a href="/MyRTS/j_spring_security_logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                       </ul>
                   </li>
                </ul>
            </div>
        </nav>
        <div class="row">
                <div class="col-lg-12">
                    <h1>Hello, ${username } <small>CreditCard </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Please check you creditcards below! 
                        <br />
                    </div>
                </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Your Creditcards</h3>
                        </div>
                        <section class="content"> <!-- Info boxes -->
			<div ng-app="creditcardModule" ng-controller="creditcardController">
				<select class="OptionCtrl" ng-model="selected"
					ng-options="creditcard.cardNo for creditcard in creditcardData">
					<option value="">Please choose a card</option>
				</select>
				<table id="card" class="table table-bordered table-striped dataTable" role="grid";>
					<tr>
						<th>Payment Brand</th>
						<th>Card No</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Expiration Date</th>
						<th>Billing Address</th>
						<th>City</th>
						<th>State</th>
						<th>ZIP Code</th>
					</tr>
					<tr ng-hide="!selected">
						<td><span ng-hide="editMode">{{selected.paymentBrand}}</span>
							<select ng-show="editMode" ng-model="selected.paymentBrand">
								<option value="visa">Visa</option>
								<option value="master">Master Card</option>
								<option value="discover">Discover</option>
								<option value="amex">American Express</option>
						</select></td>
						<td><span ng-hide="editMode">{{selected.cardNo}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.cardNo" /></td>

						<td><span ng-hide="editMode">{{selected.firstName}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.firstName" /></td>

						<td><span ng-hide="editMode">{{selected.lastName}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.lastName" /></td>


						<td><span ng-hide="editMode">{{selected.expiration}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.expiration" /></td>


						<td><span ng-hide="editMode">{{selected.billingAddr}}</span>
							<input type="text" ng-show="editMode"
							ng-model="selected.billingAddr" /></td>


						<td><span ng-hide="editMode">{{selected.city}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.city" /></td>


						<td><span ng-hide="editMode">{{selected.state}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.state" /></td>

						<td><span ng-hide="editMode">{{selected.zipCode}}</span> <input
							type="text" ng-show="editMode" ng-model="selected.zipCode" /></td>

						<td><span>
								<button type="submit" ng-hide="editMode"
									ng-click="editMode=true;editCard(selected,$index)">Edit</button>
						</span> <span>
								<button type="submit" ng-show="editMode"
									ng-click="editMode=false;saveCard(selected,$index)">Save</button>
						</span> <span>
								<button ng-click="removeCard(selected,$index)">Remove</button>
						</span></td>
					</tr>
				</table>
			</div>
			</section>
                        <div class="panel-body">
                            <div id="shieldui-grid1"></div>
                        </div>
                    </div>
                </div>
        </div>

     </div>   
    <!-- /#wrapper -->

</body>
</html>