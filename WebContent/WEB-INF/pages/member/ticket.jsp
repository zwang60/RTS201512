<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Tickets</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

	<link rel="stylesheet"
	href="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.css"/>"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.css"/>" />

<link rel="stylesheet"
	href="<c:url value="/resource/js/font-awesome/css/font-awesome.css"/>" />


<!-- script references -->
<script src="<c:url value="/resource/js/jquery/jquery-2.1.4.js"/>"></script>
<script
	src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
<script
	src="<c:url value="/resource/templates/template1/js/scripts.js"/>"></script>

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    
    <script
	src="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.js"/>"></script>
<script
	src="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.js"/>"></script>

<script src="<c:url value="/resource/js/angular/angular-touch.min.js"/>"></script>
<script src="<c:url value="/resource/js/util.js"/>"></script>

<script src="<c:url value="/resource/js/myrts/mainpage.js"/>"></script>
<script src="<c:url value="/resource/js/myrts/search.js"/>"></script>

</head>
<body ng-app="mainModule">
    <div id="wrapper" ng-controller="mainController">
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
                    <li class="active"><a href="ticket.html"><i class="fa fa-tasks"></i> Tickets</a></li>                    
                    <li><a href="creditcard.html"><i class="fa fa-globe"></i> CreditCard</a></li>
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
                    <h1>Hello,  ${username } <small>Ticket </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Please check you tickets below! 
                        <br />
                    </div>
                </div>
        </div>

		<div class="wow fadeInLeft animated" data-wow-offset="30"
					data-wow-duration="1.5s" data-wow-delay="0.15s">
					<div class="col-sm-8 col-sm-offset-2 text-center"
						style="padding: 20px; background-color: rgba(248, 236, 236, .2); border-radius: 10px;">
						<form id="fmSearchTrain" name="fmSearchTrain" ng-submit="submitData('ajaxResult')">
							<div class="row">
								<div class="col-sm-4 col-sm-offset-1 lead text-left white-text">
									Departure Station:</div>
								<div class="col-sm-4">
									<div angucomplete-alt id="ex14"
										placeholder="Input Departure Station" pause="100"
										selected-object="departureStation" local-data="stations2"
										search-fields="stationNo,name,city,state"
										title-field="display" minlength="1"
										input-class="form-control form-control-small"
										match-class="highlight" field-required="true"></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-sm-offset-1 lead text-left white-text">
									Arrival Station:</div>
								<div class="col-sm-4">
									<div angucomplete-alt id="ex14"
										placeholder="Input Arrival Station" pause="100"
										selected-object="arrivalStation" local-data="stations2"
										search-fields="stationNo,name,city,state"
										title-field="display" minlength="1"
										input-class="form-control form-control-small"
										match-class="highlight" field-required="true"></div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-4 col-sm-offset-1 lead text-left white-text">
									Departure Date:</div>
								<div class="col-sm-4 dropdown text-left">
									<datepicker date-min-limit="2015/10/08"
										date-format="{{'MM/dd/yyyy HH:mm'}}"
										button-prev="<i class='fa fa-arrow-left'></i>"
										button-next="<i class='fa fa-arrow-right'></i>" required>
									<input ng-model="departureDate" type="text"
										placeholder="Input Departure Date" style="width: 300px"
										class="form-control form-control-small" readonly /> </datepicker>
								</div>
							</div>
							<div class="row">
								<input ng-click="resetForm()" type="reset" class="btn btn-primary custom-button red-btn"
								role="button" value="Reset" ng-disabled="!isSearchTrainFormChanged()" >
								<input ng-click="" type="submit" class="btn btn-primary custom-button blue-btn" 
								role="button" value="Submit" ng-disabled="fmSearchTrain.$invalid">
								<!-- <a href="#" class="btn btn-primary custom-button blue-btn">Submit
								</a> -->
							</div>
						</form>
					</div>
					</div>
			
			<div class="row">
		<div class="col-sm-10 col-sm-offset-1 text-left">
			<div id="divSelectTrain" ng-show="canShow">
				<form id="fmAddCart" name="fmAddCart"  ng-submit="addTicketsToCart()" >
					<table width="200" class="table table-striped table-bordered">
						<thead>
			        		<tr>
					          <th>Train No</th>
					          <th>Total Ticket Quantity</th>
					          <th>Available Ticket Quantity</th>
					          <th>Booking Quantity</th>
			        		</tr>
			      		</thead>
			      		<tbody>
			        		<tr ng-repeat="schedule in schedules track by $index"  ng-click="selectSchedule(schedule)">
			          			<td># {{schedule.train.trainNo}}</td>
			          			<td>{{schedule.train.totalTicketQty}}</td>
			          			<td>{{schedule.availableTickets}}</td>
			          			<td><input id="bookingQty" name="bookingQty" type="number" max=100 width=30 placeholder="quantity" ng-model="schedule.bookingQty" /></td>
			        		</tr>
			      		</tbody>
					</table>
					<div id="divAddToCart" ng-show="canShowAddToCart">
						<a href="checkout.html"><button type="submit" class="col-sm-2 col-sm-offset-8 btn btn-primary btn-md"  ng-disabled="fmAddCart.$invalid || isAddingTickets">Checkout</button></a>
					</div>
				</form>
			</div>
		</div>
		</div> <!-- End of Row -->
		
		<br>
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1 text-left">
				<div id="divDisplayTrainTransits"   ng-show="canShow">
					<h3> Current Selected Train Schedule Detail </h3>
					<h4 id="ticketPrice">Ticket Unit Price:<span> $ {{price}} </span></h4>
					<h4 id="currTrainNo">Train Schedule: <span> # {{currSchedule.train.trainNo}}</span></h4>
				</div>
			</div>
		</div>
		
		<div class="row">
				
			<div class="col-sm-10 col-sm-offset-1 text-left">
				<div  ng-show="canShow">
					
					<table  width="200" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Sequence</th>
								<th>Transit No</th>
								<th>Station Name</th>
								<th>Arrival Time</th>
								<th>Stop Duration (min)</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="transit in transits">
								<td>{{transit.seqNo}}</td>
								<td>{{transit.transitNo}}</td>
								<td>{{transit.station.name}}</td>
								<td>{{transit.arrivalTime}}</td>
								<td>{{transit.stopDuration}}</td>
							</tr>
						</tbody>
					
					</table>					
				</div>
		</div>
		</div> <!-- End of Row -->

     </div>   
    <!-- /#wrapper -->

    <!--
        This section initializes the chart widgets and a grid component, 
        which visualize records and allow sorting and paging. 
        For more information visit: 
        http://www.shieldui.com/documentation/javascript.chart/getting.started
        http://www.shieldui.com/documentation/grid/javascript/getting.started
        http://www.shieldui.com/documentation/datasource/javascript/getting.started
    -->
  
</body>
</html>