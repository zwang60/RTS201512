<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailwayTicketingSystem || Schedule</title>
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resource/js/jquery/jquery-2.1.4.js"/>"></script>
	<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
	<script src="<c:url value="/resource/js/util.js"/>"></script>
    
	<script>
	angular
			.module("scheduleModule", [])
			.controller(
					"scheduleController",
					function($scope, $http) {
						// Initialization
						$scope.scheduleData = [];
						$http({
							method : "GET",
							url : "/MyRTS/admin/scheduleData",
						})
								.success(
										function(data) {
											//alert(data);
											$scope.scheduleData = data;
											for ( var i = 0; i < $scope.scheduleData.length; i++) {
												$scope.scheduleData[i].date = formatDate(
														new Date(
																$scope.scheduleData[i].departureDate),
														true, false);
												//alert($scope.scheduleData[i].date);
											}
										}).error(function(data) {
									alert("AJAX Error!");
								});

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
                    <li><a href="dashboard.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="order.html"><i class="fa fa-tasks"></i> Order</a></li>                    
                    <li><a href="train.html"><i class="fa fa-globe"></i> Train</a></li>
                    <li class="active"><a href="schedule.html"><i class="fa fa-list-ol"></i> Schedule</a></li>
                    <li><a href="station.html"><i class="fa fa-font"></i> Station</a></li> 
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
      	<div class="content-wrapper">
      		 <div class="row">
                <div class="col-lg-12">
                    <h1>Administrator Schedule Page <small>Schedules </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Welcome to RailwayTicketingSystem  schedule page! 
                        <br />
                    </div>
                </div>
            </div>
			<!-- Main content -->
			<section class="content">
			<div ng-app="scheduleModule" ng-controller="scheduleController">
				<h3>All Orders</h3>
				<table id="scheduleList" class="table table-bordered table-striped dataTable" role="grid";>
					<tr>
						<th>Train Number</th>
						<th>Date</th>
						<th>Sold</th>
						<th>Available</th>
						<th>Total</th>

					</tr>
					<tr ng-repeat="schedule in scheduleData">
						<td>{{schedule.train.trainNo}}</td>
						<td>{{schedule.date}}</td>
						<td>{{(schedule.train.totalTicketQty) -
							(schedule.availableTickets)}}</td>
						<td>{{schedule.availableTickets}}</td>
						<td>{{schedule.train.totalTicketQty}}</td>
				</table>
			</div>
			</section>
		</div>
      </div>

</div>
</body>
</html>