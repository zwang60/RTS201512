<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Railway Ticketing System</title>

<link
	href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link
	href="<c:url value="/resource/templates/template1/css/styles.css"/>"
	rel="stylesheet">
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


<script
	src="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.js"/>"></script>
<script
	src="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.js"/>"></script>

<script src="<c:url value="/resource/js/angular/angular-touch.min.js"/>"></script>
<script src="<c:url value="/resource/js/util.js"/>"></script>


<script src="<c:url value="/resource/js/myrts/cart.js"/>"></script>


</head>
<body ng-app="mainModule">
	<!-- Wrap all page content here -->
	<div id="wrap" ng-controller="mainController">
		<header class="masthead">
		    <div class="container">
		    <div class="row">
		      <div class="col-sm-6">
		        <h1><a href="#" title="Bootstrap Template">MyRTS </a>
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
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container -->
		</div>
		<!--/.navbar -->


		<div class="row">
			<h3 class="col-sm-10 col-sm-offset-1 text-left">Here is your
				shopping cart:</h3>
			<br> <br>
		</div>
		<br>
		<div class="row">
			<div ng-show="canShowCart"
				class="col-sm-10 col-sm-offset-1 text-left">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Sequence</th>
							<th>Departure Date</th>
							<th>Train No</th>
							<th>Departure Station</th>
							<th>Departure Time</th>
							<th>Arrival Station</th>
							<th>Arrival Time</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Sub Total</th>
							<th>Edit</th>
							<th>Remove</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="ct in cart ">
							<td>{{$index+1}}</td>
							<td>{{ct.key.departureDate}}</td>
							<td># {{ct.key.departureTransit.train.trainNo}}</td>
							<td>{{ct.key.departureTransit.station.name+',
								'+ct.key.departureTransit.station.city +',
								'+ct.key.departureTransit.station.state}}</td>
							<td>{{ct.key.departureTime}}</td>
							<td>{{ct.key.arrivalTransit.station.name+',
								'+ct.key.arrivalTransit.station.city +',
								'+ct.key.arrivalTransit.station.state}}</td>
							<td>{{ct.key.arrivalTime}}</td>
							<td><span ng-hide="editMode">{{ct.value}}</span> <span
								ng-show="editMode"><input type="number" min=1 max=100
									width=100 ng-model="ct.value" /></span></td>
							<td>$ {{ct.key.price.toFixed(2)}}</td>
							<td>$ {{(ct.key.price*ct.value).toFixed(2)}}</td>
							<td>
								<button ng-click="editMode=true;" ng-show="!editMode">Edit</button>
								<button ng-click="editMode=false;updateCart(ct)"
									ng-show="editMode">Update</button>
							</td>
							<td>
								<button ng-click="removeEntry(ct,$index)">Remove</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="divTotal" class="row">
				<div class="col-sm-3 col-sm-offset-8 lead text-left">
					<table class="table table-striped table-bordered">
						<tbody>
							<tr>
								<td>Quantity:</td>
								<td>{{getTotalCount()}}</td>
							</tr>
							<tr>
								<td>Total Charge:</td>
								<td>$ {{getTotalPrice().toFixed(2)}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="divCheckout">
				<form id="fmCheckout" name="fmCheckout"
					action="<c:url value="/member/checkout.html"/>" method="POST">
					<button type="submit"
						class="col-sm-3 col-sm-offset-8 btn btn-primary btn-md">Check
						Out</button>
				</form>
			</div>
		</div>

	</div>
	<!--/wrap-->

	<!-- Begin footer -->
	<div id="footer">
		<div class="container">
			<p class="text-muted">MyRTS Railway Ticketing System</p>
			<p class="text-muted">Design & Managed by Mercury System .Inc</p>
		</div>
	</div>
	<!-- End footer -->

	<!-- Begin of Nav-->
	<ul class="nav pull-right scroll-top">
		<li><a href="#" title="Scroll to top"><i
				class="glyphicon glyphicon-chevron-up"></i></a></li>
	</ul>
	<!-- End of nav -->

</body>
</html>