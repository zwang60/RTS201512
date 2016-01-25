<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailwayTicketingSystem || Station</title>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
	<style>
	#add{
		margin-left:50px;
	}
	</style>
	<script>
	angular
			.module("stationModule", [])
			.controller(
					"stationController",
					function($scope, $http) {
						// Initialization
						$scope.stationData = [];
						$http({
							method : "GET",
							url : "/MyRTS/resource/station/get/all",
						}).success(function(data) {
							// 			alert(data);
							$scope.stationData = data;
						}).error(function(data) {
							alert("AJAX Error!");
						});

						$scope.removeStation = function(index) {
							var station = $scope.stationData[index];
							var params = $.param({
								stationNo : station.stationNo
							});
							//alert(station.stationNo);
							$http(
									{
										method : "POST",
										url : "/MyRTS/admin/removeStation/",
										data : params,
										headers : {
											'Content-Type' : 'application/x-www-form-urlencoded'
										}
									}).success(function(status) {
								console.log(status);
								$scope.stationData.splice(index, 1);
							}).error(function() {
								alert('ERROR');
							});
						};

						$scope.saveStation = function(station) {
							var params = $.param({
								stationNo : station.stationNo,
								name : station.name,
								address : station.address,
								city : station.city,
								zipCode : station.zipCode,
								state : station.state,
								enable : station.enable
							});
							//alert(station.stationNo);
							$http(
									{
										method : "POST",
										url : "/MyRTS/admin/editStation/",
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

						$scope.editStation = function(index) {
							$scope.editing = $scope.stationData.indexOf(index);
						};

						$scope.saveField = function(index) {
							if ($scope.editing !== false) {
								$scope.editing = false;
							}
						};

						$scope.addStation = function(s) {
							var params = $.param({
								name : s.name,
								address : s.address,
								city : s.city,
								zipCode : s.zipCode,
								state : s.state,
								enable : s.enable
							});
							//alert(station.stationNo);
							$http(
									{
										method : "POST",
										url : "/MyRTS/admin/addStation/",
										data : params,
										headers : {
											'Content-Type' : 'application/x-www-form-urlencoded'
										}
									}).success(function(status) {
								console.log(status);
								s.stationNo = status;
								$scope.stationData.push(s);
							}).error(function() {
								alert('ERROR');
							});

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
                <a class="navbar-brand" href="dashboard.html">Administrator Page</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                  <!--   <li><a href="index.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="portfolio.html"><i class="fa fa-tasks"></i> Portfolio</a></li>
                    <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
                    <li><a href="forms.html"><i class="fa fa-list-ol"></i> Forms</a></li>
                    <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                    <li class="active"><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                    <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i> Bootstrap Grid</a></li> -->
                    <li><a href="dashboard.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="order.html"><i class="fa fa-tasks"></i> Order</a></li>                    
                    <li><a href="train.html"><i class="fa fa-globe"></i> Train</a></li>
                    <li><a href="schedule.html"><i class="fa fa-list-ol"></i> Schedule</a></li>
                    <li class="active"><a href="station.html"><i class="fa fa-font"></i> Station</a></li> 
                    <li><a href="userTable.html"><i class="fa fa-list-ul"></i> UserTable</a></li>  
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Administrator<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/MyRTS/main.html"><i class="fa fa-user"></i> MainPage</a></li>
                            <li class="divider"></li>
                            <li><a href="/MyRTS/j_spring_security_logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper">
       	  	<div class="row">
                <div class="col-lg-12">
                    <h1>Administrator Station Page <small>Stations </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Welcome to RailwayTicketingSystem  administrator station operation page! 
                        <br />
                    </div>
                </div>
            </div>
         	<div class="content-wrapper">
			<section class="content">
			<div ng-app="stationModule" ng-controller="stationController">
				<!-- Station -->
				<table  class="table table-bordered table-hover">
					<tr>
						<td>Name:</td>
						<td><input type="text" ng-model="s.name" /></td>
					</tr>
					<tr>
						<td>Address:</td>
						<td><input type="text" ng-model="s.address" /></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" ng-model="s.city" /></td>
					</tr>
					<tr>
						<td>ZipCode:</td>
						<td><input type="text" ng-model="s.zipCode" /></td>
					</tr>
					<tr>
						<td>State:</td>
						<td><input type="text" ng-model="s.state" /></td>
					</tr>
					<tr>
						<td>Enable:</td>
						<td><input type="text" ng-model="s.enable" /></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button id="add" type="submit" name="add"
								ng-click="addStation(s)">Add</button>
						</td>
					</tr>
				</table>
				<div>
					<h3>All Stations</h3>
					<table id="stationList"  class="table table-bordered table-striped dataTable" role="grid";>
						<tr>
							<th>Station ID</th>
							<th>Station name</th>
							<th>Station address</th>
							<th>Station city</th>
							<th>Station zipCode</th>
							<th>Station state</th>
							<th>Station enable</th>
							<th>Station controller</th>
						</tr>
						<tr ng-repeat="station in stationData">
							<td>{{station.stationNo}}</td>
							<td><span ng-hide="editMode">{{station.name}}</span> <input
								type="text" ng-show="editMode" ng-model="station.name" /></td>
							<td><span ng-hide="editMode">{{station.address}}</span> <input
								type="text" ng-show="editMode" ng-model="station.address" /></td>
							<td><span ng-hide="editMode">{{station.city}}</span> <input
								type="text" ng-show="editMode" ng-model="station.city" /></td>
							<td><span ng-hide="editMode">{{station.zipCode}}</span> <input
								type="number" ng-show="editMode" ng-model="station.zipCode" /></td>
							<td><span ng-hide="editMode">{{station.state}}</span> <input
								type="text" ng-show="editMode" ng-model="station.state" /></td>
							<td><span ng-hide="editMode">{{station.enable}}</span> <input
								type="number" ng-show="editMode" ng-model="station.enable" /></td>

							<td><span>
									<button type="submit" ng-hide="editMode"
										ng-click="editMode=true;editStation(station)">Edit</button>
							</span> <span>
									<button type="submit" ng-show="editMode"
										ng-click="editMode=false;saveStation(station)">Save</button>
							</span> <span>
									<button ng-click="removeStation($index)">Remove</button>
							</span></td>
						</tr>
					</table>
				</div>
			</div>
			</section>

			<!-- /. tools -->
		</div>

        </div>
        

    </div>
</body>
</html>