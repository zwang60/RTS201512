<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailwayTicketingSystem || Trains</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

     <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>
    
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script>
	$(document).ready(function() {
		$("#f").on("submit", validateForm);
	});
	function validateForm() {
		if ($("#trainNo").val() == 0) {
			return false;
		} else if ($("#totalTicketQty").val() == 0) {
			return false;
		} else if ($("#enable").val() != 1) {
			return false;
		}
		return true;
	}
	</script>

	<script>
	angular.module("trainModule", []).controller("trainController",
			function($scope, $http) {
				// Initialization
				$scope.trainData = [];
				$http({
					method : "GET",
					url : "/MyRTS/resource/train/get/all",
				}).success(function(data) {
					//alert(data);
					$scope.trainData = data;
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
 <!--                <a class="navbar-brand" href="index.html"> -->
                <a class="navbar-brand" href="dashboard.html">Administrator Page</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="dashboard.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="order.html"><i class="fa fa-tasks"></i> Order</a></li>
    <!--                 <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li> -->
                    <li class="active"><a href="train.html"><i class="fa fa-globe"></i> Train</a></li>
                    <!-- <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                    <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                    <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i> Bootstrap Grid</a></li> -->
                    <li><a href="schedule.html"><i class="fa fa-list-ol"></i> Schedule</a></li>
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
       	  	<div class="row">
                <div class="col-lg-12">
                    <h1>Administrator Train Page <small>Trains </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Welcome to RailwayTicketingSystem  administrator train operation page! 
                        <br />
                    </div>
                </div>
            </div>
       
        <div class="row">
          <section class="content">
			<div>
				<!-- Station -->
				<form id="f" action="submitTrain.html" method="POST">
					<table class="table table-bordered table-hover">
						<tr>
							<td>TrainNo:</td>
							<td><input type="text" name="trainNo" id="trainNo" size="24"/></td>
						</tr>
						<tr>
							<td>TotalTicketQty:</td>
							<td><input type="text" name="totalTicketQty"
								id="totalTicketQty" size="24"/></td>
						</tr>
						<tr>
							<td>Enable:</td>
							<td><input type="text" name="enable" id="enable" size="24"/></td>
						</tr>

						<tr>
							<td></td>
							<td><span>
								<button id="add" type="submit" name="add">Add</button>
								<button id="delete" type="submit" name="delete">Delete</button>
								<button id="update" type="submit" name="update">Update</button>
							</span></td>

						</tr>
					</table>
				</form>


				<div ng-app="trainModule" ng-controller="trainController">
					<h3>All Stations</h3>
					<table id="stationList" class="table table-bordered table-striped dataTable" role="grid";>
						<tr>
							<th>Train ID</th>
							<th>Total Ticket Quantity</th>
							<th>Train enable</th>


						</tr>
						<tr ng-repeat="train in trainData">
							<td>{{train.trainNo}}</td>
							<td>{{train.totalTicketQty}}</td>
							<td>{{train.enable}}</td>
					</table>
				</div>

			</div>
			</section>
          
        </div>

      </div>

    </div>
</body>
</html>