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
        
        <script src="<c:url value="/resource/js/myrts/mainpage.js"/>"></script>
        
</head>
<body ng-app="mainModule">
	<!-- Wrap all page content here -->
	<div id="wrap"  ng-controller="mainController">
		<header class="masthead">
		    <div class="container">
		    <div class="row">
		      <div class="col-sm-6">
		        <h1><a href="#" title="Bootstrap Template">RTS </a>
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
		          <li><a href="#"/>Home</a></li>
		          <li><a href="#section1">Book Ticket</a></li>
		          <li><a href="#section2">Plan Trip</a></li>
		          <li><a href="#section3"/>Check Stock</a></li>
		          <li><a href="#section4"/>Contact</a></li>
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
		<!-- Begin page content -->
	<div class="container" id="section1" style="padding-top:0px">
	  <div class="col-sm-10 col-sm-offset-1">
	  	<hr>
	    <div class="page-header text-center">
	      <h1>Booking Your Railway Tickets Now</h1>
	    </div>
	    <p class="lead text-center">
			MyRTS - Most efficient ticketing solution for your commuting 
	    </p>
	  </div>
	</div>
	<section class="bg-1">
	  <div class="col-sm-8 col-sm-offset-2 text-center" style="padding:20px;background-color:rgba(5,5,5,.8);border-radius: 25px;">
	  	<form ng-submit="bookTicket()">
	  	<div class="row">
		  	<div class="col-sm-4 col-sm-offset-2 lead text-left">
		  	Departure Station:
		  	</div>
		  	<div class="col-sm-4">
				<div angucomplete-alt
		          id="ex14"
		          placeholder="Input Departure Station"
		          pause="100" selected-object="departureStation"
		          local-data="stations2"
		          search-fields="stationNo,name,city,state"
		          title-field="display"
		          minlength="1"
		          input-class="form-control form-control-small"
		          match-class="highlight"
		          field-required="true"
		          ></div>
			</div>	
		</div>
		<div class="row">
		  	<div class="col-sm-4 col-sm-offset-2 lead text-left">
		  	Arrival Station:
		  	</div>
			<div class="col-sm-4">
				<div angucomplete-alt
		          id="ex14"
		          placeholder="Input Arrival Station"
		          pause="100" selected-object="arrivalStation"
		          local-data="stations2"
		          search-fields="stationNo,name,city,state"
		          title-field="display"
		          minlength="1"
		          input-class="form-control form-control-small"
		          match-class="highlight"
		          field-required="true"
		          ></div>		
		    </div>	
		</div>
		
		<div class="row">
		  	<div class="col-sm-4 col-sm-offset-2 lead text-left">
		  	Departure Date:
		  	</div>
			<div class="col-sm-4 dropdown text-left">
			    <datepicker date-min-limit="2015/10/07"  date-format="{{'MM/dd/yyyy HH:mm'}}"
					button-prev="<i class='fa fa-arrow-left'></i>" button-next="<i class='fa fa-arrow-right'></i>" required>
  					<input ng-model="departureDate" type="text" placeholder="Input Departure Date" style="width:300px" class="form-control form-control-small" readonly />
				</datepicker>
		    </div>
		</div>
		<div class="row">
		  	<input type="submit" class="col-sm-2 col-sm-offset-8 btn btn-primary btn-md" role="button" />
		</div>
		</form> 
	  </div>
	</section>
	
	<div class="divider" ></div>
	<div class="container" id="section2">
	  	<div class="col-sm-8 col-sm-offset-2 text-center">
	  		<hr>
	      	<h1>Plan Your Trip Now</h1>
	      	<hr>
			<p class="lead text-center">
			Simply input your departure station and see where you can go!
			</p>
	  	</div><!--/col-->
	</div><!--/container-->
	<section class="bg-2">
	  <div class="col-sm-6 col-sm-offset-3 text-center">
	  	<h4 style="padding:20px;background-color:rgba(5,5,5,.8)">
	  	Press and see where you can reach.
	  	</h4>
	  </div>
	</section>
	
	<div class="divider" ></div>
	<div class="container" id="section3">
		<div class="col-sm-8 col-sm-offset-2 text-center">
	  		<hr>
	  		<h1 class="text-center">Check ticket stock now!</h1>
	 		<hr>
	      	<p class="lead text-center">
			Check the tickets stock for your upcoming trip.
	      	</p>
	  	</div><!--/col-->
  	</div>
	<section class="bg-3">
	  <div class="col-sm-6 col-sm-offset-3 text-center">
	  	<div style="padding:20px;background-color:rgba(5,5,5,.8)">
			<div class="row">
		  	<div class="col-sm-4 col-sm-offset-2 lead text-left">
		  	Train No:
		  	</div>
			<div class="col-sm-4">
				<div angucomplete-alt
		          id="ex16"
		          placeholder="Input Train #"
		          pause="100" selected-object="selectedTrain"
		          local-data="trains"
		          search-fields="trainNo"
		          title-field="display"
		          minlength="1"
		          input-class="form-control form-control-small"
		          match-class="highlight"
		          field-requiered="true"
		          ></div>		
		    </div>	
		</div>
		
		<div class="row">
		  	<div class="col-sm-4 col-sm-offset-2 lead text-left">
		  	Departure Date:
		  	</div>
			<div class="col-sm-4 dropdown text-left">
			    <datepicker date-min-limit="2015/10/07"  date-format="{{'MM/dd/yyyy HH:mm'}}"
					button-prev="<i class='fa fa-arrow-left'></i>" button-next="<i class='fa fa-arrow-right'></i>" required>
  					<input ng-model="departureDate2" type="text" placeholder="Input Departure Date" style="width:300px" class="form-control form-control-small" readonly />
				</datepicker>
		    </div>
		</div>

	  	</div> <!-- End of row -->
	  </div><!-- End of bg -->
	</section>



	<div class="divider" ></div>
	<div class="container" id="section4">
		<hr>
	  		<h1 class="text-center">Contact</h1>
	 	<hr>
	    <p class="lead text-center">
			Contact us if you have any question.
	    </p>
  		<div class="col-sm-8 col-sm-offset-1" >
			<div class="row form-group">
				<div class="col-xs-3">
					<input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required="">
				</div>
				<div class="col-xs-3">
					<input type="text" class="form-control" id="middleName" name="firstName" placeholder="Middle Name" required="">
				</div>
				<div class="col-xs-4">
					<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required="">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-xs-5">
					<input type="email" class="form-control" name="email" placeholder="Email" required="">
				</div>
				<div class="col-xs-5">
					<input type="email" class="form-control" name="phone" placeholder="Phone" required="">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-xs-10">
					<input type="homepage" class="form-control" placeholder="Website URL" required="">
				</div>
			</div>
			<div class="row form-group">
				<div class="col-xs-10">
					<button class="btn pull-right btn-primary btn-md">Contact Us</button>
				</div>
			</div>
  		</div>
  		<div class="col-sm-3 pull-right">
		
			      <address>
			        <strong>Mercury System Inc.</strong><br>
			       5 Independence Way Ste 140 <br/>
			       Princeton, NJ 08540 <br/>
					Phone: (609) 243-0230
			      </address>
			    
			      <address>
			        <a><strong>Email Us</strong><br></a>
			      </address>          
		  </div>
  	</div>
		
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