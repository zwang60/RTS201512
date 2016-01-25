<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Railway Ticketing System</title>
		
		<link href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="<c:url value="/resource/templates/template1/css/styles.css"/>" rel="stylesheet">
		<link rel="stylesheet" href="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.css"/>" rel="stylesheet">
		
	    <link rel="stylesheet" href="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resource/js/font-awesome/css/font-awesome.css"/>" />

		
		<!-- script references -->
		<script src="<c:url value="/resource/js/jquery/jquery-2.1.4.js"/>" ></script>
		<script src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
		<script src="<c:url value="/resource/templates/template1/js/scripts.js"/>"></script>
             
             
        <script src="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.js"/>"></script>
      	<script src="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.js"/>"></script>
      	
      	<script src="<c:url value="/resource/js/angular/angular-touch.min.js"/>"></script>
        <script src="<c:url value="/resource/js/util.js"/>"></script>
        <script src="<c:url value="/resource/js/myrts/search.js"/>"></script>

        
</head>
<body ng-app="mainModule">
	<!-- Wrap all page content here -->
	<div id="wrap"  ng-controller="mainController">
		<header class="masthead">
		    <div class="container">
		    <div class="row">
		      <div class="col-sm-6">
		        <h1><a href="#" title="MyRTS">MyRTS </a>
		          <p class="lead">Railway Ticketing System</p></h1>
		      </div>
		      <div class="col-sm-6">
		        <div class="pull-right  hidden-xs">    
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><h3><i class="glyphicon glyphicon-cog"></i></h3></a>
		          <ul class="dropdown-menu">
		              	<li>
		              		<a href="<c:url value="/index.html"/>">
		              			<i class="glyphicon glyphicon-home"></i>Home Page
		              		</a>
		              	</li>
		              	<li>
		              		<a href="<c:url value="/viewcart.html"/>">
		              			<i class="glyphicon glyphicon-shopping-cart"></i>Shopping Cart
		              		</a>
		              	</li>
		              	<li>
		              		<a href="<c:url value="/searchbydate.html"/>">
		              			<i class="glyphicon glyphicon-search"></i>Book Tickets
		              		</a>
		              	</li>
		              	<sec:authorize access="isAnonymous()">
						<li>
		              		<a href="<c:url value="/login.html"/>">
		              			<i class="glyphicon glyphicon-log-in"></i>Sign In
							</a>
						</li>
						</sec:authorize>
		              
		              	<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
		              	<li>
		              		<a href="<c:url value="/profile.html"/>">
		              			<i class="glyphicon glyphicon-user"></i>My Profile
		              		</a>
		              	</li>
		              	<li>
		              		<a href="<c:url value="/member/order.html"/>">
		              			<i class="glyphicon glyphicon-menu-hamburger"></i>Order History
		              		</a>
		              	</li>
		              	<li>
			              	<a href="<c:url value='/j_spring_security_logout'/>"/>
			              		<i class="glyphicon glyphicon-log-out"></i>Log Out
			              	</a>
			            </li>
		              	</sec:authorize>
		          </ul>
		        </div>
		      </div>
		    </div>
		    </div>
		</header>
		<!-- Fixed navbar -->
		<div class="navbar navbar-custom navbar-inverse navbar-static-top" id="nav">
		    <div class="container">
		      <div class="navbar-header">
		        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>
		        </button>
		      </div>
		      <div class="collapse navbar-collapse">
		        <ul class="nav navbar-nav nav-justified">
		          <li><a href="<c:url value="/index.html#"/>"/>Home</a></li>
		          <li><a href="<c:url value="/index.html#section1"/>">Book Ticket</a></li>
		          <li><a href="<c:url value="/index.html#section2"/>">Plan Trip</a></li>
		          <li><a href="<c:url value="/index.html#section3"/>"/>Check Stock</a></li>
		          <li><a href="<c:url value="/index.html#section4"/>"/>Contact</a></li>
		          <li>
		          	<a href="<c:url value="/viewcart.html"/>">
		              			<i class="glyphicon glyphicon-shopping-cart"></i>Shopping Cart
		              			<div class="numberCircle">{{cartqty}}</div>
		            </a> 
		          </li>
		          <!--  
		          <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More <b class="caret"></b></a>
		            <ul class="dropdown-menu">
		              <li><a href="#">Action</a></li>
		              <li><a href="#">Another action</a></li>
		              <li><a href="#">Something else here</a></li>
		              <li><a href="#">Separated link</a></li>
		              <li><a href="#">One more separated link</a></li>
		            </ul>
		          </li>
		          -->
		        </ul>
		      </div><!--/.nav-collapse -->
		    </div><!--/.container -->
		</div><!--/.navbar -->
		
	
		<!-- Page Content -->
	<div class="container" id="section1" style="padding-top:0px">
		<h2 class="text-center">
		Search Tickets
		</h2>
		<div class="col-sm-8 col-sm-offset-2 text-center" style="padding:20px;background-color:rgba(5,5,5,.8);border-radius: 25px;color: #ffffff;">
		
			<form id="fmSearchTrain" name="fmSearchTrain" ng-submit="submitData(trainSearch, 'ajaxResult')" >
					
					<div class="row">
						<p></p>
					  	<div class="col-sm-4 col-sm-offset-1 lead text-left">
					  	Departure Station:
					  	</div>
					  	<div class="col-sm-4">
							<div angucomplete-alt
					          id="ex14"
					          placeholder="Input Departure Station"
					          pause="100" selected-object="trainSearch.departureStation"
					          local-data="stations2"
					          search-fields="stationNo,name,city,state"
					          title-field="display"
					          minlength="1"
					          input-class="form-control form-control-small"
					          match-class="highlight"
					          field-required="true"
					          ng-init="d1=${departureStation}"
					          initial-value="departureInit"
					          ></div>
						</div>	
					</div>
						
						
					<div class="row">
					  	<div class="col-sm-4 col-sm-offset-1 lead text-left">
					  	Arrival Station:
					  	</div>
						<div class="col-sm-4">
							<div angucomplete-alt
					          id="ex15"
					          placeholder="Input Arrival Station"
					          pause="100" selected-object="trainSearch.arrivalStation"
					          local-data="stations2"
					          search-fields="stationNo,name,city,state"
					          title-field="display"
					          minlength="1"
					          input-class="form-control form-control-small"
					          match-class="highlight"
					          field-required="true"
					          ng-init="a1=${arrivalStation}"
					          initial-value="arrivalInit"
					          ></div>		
					    </div>	
					</div>
					
					<div class="row">
					  	<div class="col-sm-4 col-sm-offset-1 lead text-left">
					  	Departure Date:
					  	</div>
						<div class="col-sm-4 dropdown text-left">
						    <datepicker date-min-limit="2015/10/07"  date-format="{{'MM/dd/yyyy HH:mm'}}"
								button-prev="<i class='fa fa-arrow-left'></i>" button-next="<i class='fa fa-arrow-right'></i>" required>
			  					<input ng-init="trainSearch.departureDateTime='${departureDate}'" 
			  					ng-model="trainSearch.departureDateTime" type="text" placeholder="Input Departure Date" style="width:300px" class="form-control form-control-small" readonly />
							</datepicker>
					    </div>
					</div>
					
					<div class="row">
						<input class="col-sm-3 col-sm-offset-1 btn btn-primary btn-md"
							type="reset" ng-click="resetForm()" 
		  					ng-disabled="!isSearchTrainFormChanged()" 
		  					role="button" />
						<button class="col-sm-3 col-sm-offset-3 btn btn-primary btn-md" 
							type="submit" ng-disabled="fmSearchTrain.$invalid">Search
								Trains</button>
					</div>
			</form>
		</div>
		</div> <!-- End of Container -->
		
		<br>
		
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
						<button type="submit" class="col-sm-2 col-sm-offset-8 btn btn-primary btn-md"  ng-click="" ng-disabled="fmAddCart.$invalid || isAddingTickets" >Add Tickets to Cart</button>
					</div>
				</form>
			</div>
		</div>
		</div> <!-- End of Row -->
		
		<br>
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1 text-left">
				<div id="divDisplayTrainTransits"   ng-show="canShowTransits">
					<h3> Current Selected Train Schedule Detail </h3>
					<h4 id="ticketPrice">Ticket Unit Price:<span> $ {{price}} </span></h4>
					<h4 id="currTrainNo">Train Schedule: <span> # {{currSchedule.train.trainNo}}</span></h4>
				</div>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-sm-10 col-sm-offset-1 text-left">
				<div  ng-show="canShowTransits">
					
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
		
	</div><!--/wrap-->
	
	<!-- Begin footer -->
	<div id="footer">
	  <div class="container">
	    <p class="text-muted">MyRTS Railway Ticketing System</p>
	    <p class="text-muted">Design & Managed by Mercury System .Inc</p>
	  </div>
	</div><!-- End footer -->
	
	<!-- Begin of Nav-->
	<ul class="nav pull-right scroll-top">
	  <li><a href="#" title="Scroll to top"><i class="glyphicon glyphicon-chevron-up"></i></a></li>
	</ul>
	<!-- End of nav -->
	
</body>
</html>