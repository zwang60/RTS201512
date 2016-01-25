<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Beautiful Responsive Animated OnePage Template" />
<meta name="keywords"
	content="Zerif, responsive, html, template, creative" />
<meta name="author" content="Mizanur Rahman" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyRTS</title>

<!-- =========================
     STYLESHEETS      
============================== -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/bootstrap.min.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/owl.theme.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/owl.carousel.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/jquery.vegas.min.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/animate.min.css">

<link rel="stylesheet" href="<c:url value="/resource/tmpl/assets/icon-fonts/styles.css"/>">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/pixeden-icons.css">

<!-- CUSTOM STYLES -->
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/styles.css">
<link rel="stylesheet" href="/MyRTS/resource/tmpl/css/responsive.css">


<!-- WEBFONT -->
<link
	href='http://fonts.googleapis.com/css?family=Lato:300,400,700,400italic|Montserrat:700,400|Homemade+Apple'
	rel='stylesheet' type='text/css'>


<!-- JQUERY -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- js -->
<%-- <link
	href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet"> --%>
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<%-- <link
	href="<c:url value="/resource/templates/template1/css/styles.css"/>"
	rel="stylesheet"> --%>
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

<script src="<c:url value="/resource/js/myrts/mainpage.js"/>"></script>
<script src="<c:url value="/resource/js/myrts/search.js"/>"></script>

</head>

<body ng-app="mainModule">
	<div id="wrap" ng-controller="mainController">
		<!-- <img class="vegas-background" src="/MyRTS/resource/image/maintheme.jpg"
			style="position: fixed; left: 0px; top: -200px; width: 1600px; height: 1100px; bottom: auto; right: auto"> -->
		<!-- =========================
   PRE LOADER       
============================== -->
		<div class="preloader">
			<div class="status">&nbsp;</div>
		</div>
		<!-- =========================
   HOME SECTION       
============================== -->
		<header id="home" class="header">

			<!-- TOP BAR -->
			<div id="main-nav" class="navbar navbar-inverse bs-docs-nav"
				role="banner">

				<div class="container">

					<div class="navbar-header responsive-logo">
						
						<!-- <div class="navbar-brand"> -->
						<img src="/MyRTS/resource/image/trainlogo.jpg" alt="rts"
							style="left: 0px; width: 70px; height: 70px">
						<!-- </div> -->
					</div>
					<nav class="navbar-collapse collapse" role="navigation"
						id="bs-navbar-collapse">
						<ul
							class="nav navbar-nav navbar-right responsive-nav main-nav-list">
							<li><a href="#home">Home</a></li>
							<li><a href="#booking">Booking</a></li>
							<!-- <li><a href="#features">Features</a></li> -->
							<li><a href="#contact">Contact</a></li>
							<sec:authorize access="isAnonymous()">
								<li>
		              				<a href="<c:url value="/member/dashboard.html"/>"> 
		              					<span class="ion-log-in"></span>Sign In
								</a>
								</li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_USER')">
								<li>
									<a href="<c:url value="/member/dashboard.html"/>">
										Profile
									</a>
								</li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li>
									<a href="<c:url value="/admin/dashboard.html"/>">
										Profile
									</a>
								</li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
								<li>
			              			<a href="<c:url value='/j_spring_security_logout'/>"/>
			              				<span class="ion-log-out"></span>Log Out
			              			</a>
			            		</li>
							</sec:authorize>
						</ul>
					</nav>
				</div>
			</div>
			<!-- / END TOP BAR -->

			<!-- BIG HEADING WITH CALL TO ACTION BUTTONS AND SHORT MESSAGES -->
			<div class="container">

				<!-- HEADING -->
				<h1 class="intro wow fadeInLeft antimated" data-wow-offset="500"
					data-wow-duration="4s" data-wow-delay="0.15s">TO TRAVEL IS TO LIVE</h1>
				<h3 class="wow fadeInRight antimated white-text" data-wow-offset="500"
					data-wow-duration="4s" data-wow-delay="0.15s">You Don't Need Magic To Disappear.
					All You Need Is A Destination.</h3>
				
				<div class="row buttons inpage-scroll wow fadeInRight animated"
					data-wow-offset="30" data-wow-duration="1.5s"
						data-wow-delay="0.15s">
					
						<a href="#booking" class="btn btn-primary custom-button red-btn">
							Ready To Go
						</a>
					
					<sec:authorize access="isAnonymous()">
		              		<a href="<c:url value="/login.html"/>" class="btn btn-primary custom-button green-btn">
		              			Sign In
							</a>							
					</sec:authorize>
				</div>

				<!-- 3 SHORT MESSAGE ABOUT COMPANY -->
				<div class="row bottom-message-section">
					<div class="col-lg-4 col-sm-4">
						<div class="short-text">
							<span class="ion-android-favorite red-text"></span> Find your
							destinations
						</div>
					</div>
					<div class="col-lg-4 col-sm-4">
						<div class="short-text">
							<span class="ion-android-favorite red-text"></span> Experience best
							services
						</div>
					</div>
					<div class="col-lg-4 col-sm-4">
						<div class="short-text">
							<span class="ion-android-favorite red-text"></span> Have nice journeys
						</div>
					</div>
				</div>
			</div>
			<!-- / END BIG HEADING WITH CALL TO ACTION BUTTONS AND SHORT MESSAGES  -->

		</header>
		<!-- / END HOME SECTION  -->

		<!-- =========================
   SEPARATOR ONE      
============================== -->

		<section class="separator-one">
			<div class="color-overlay">
				<h3 class="container text wow fadeInLeft animated"
					data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">Adventurous life lies ahead.</h3>
				<h3 class="container text wow fadeInRight animated"
					data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">What are you still waiting for?</h3>
			</div>
		</section>
		<!-- / END SEPARATOR -->


		<!-- /START BOOKING -->
		<section class="booking" id="booking">
			<div class="container">

				<!-- SECTION HEADER -->
				<div class="section-header">

					<!-- SECTION TITLE -->
					<h2 class="white-text">Plan your trip</h2>

					<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
					<h6 class="white-text">Check availables, and start your
						journey here.</h6>
				</div>
				<!-- / END SECTION HEADER -->

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
								<input ng-click="count=count+1" type="submit" class="btn btn-primary custom-button blue-btn" 
								role="button" value="Submit" ng-disabled="fmSearchTrain.$invalid" onclick="window.location='<c:url value="/main.html#search"/>';">
								<!-- <a href="#" class="btn btn-primary custom-button blue-btn">Submit
								</a> -->
							</div>
						</form>
					</div>
					
				</div>

			</div>
	<!--END CONTAINER  -->
	</section>
	<!-- END PACKAGES SECTION -->

	<!-- =========================
   SEARCH SECTION   
============================== -->
	<section class="search" id="search" ng-show="count>0">
		<div class="container">

			<!-- SECTION HEADER -->
			<div class="section-header">

				<!-- SECTION TITLE -->
				<h2 class="dark-text">Search Result</h2>

				
			</div>
			<!-- / END SECTION HEADER -->
		
		
		<!-- add -->
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
						<button type="submit" class="col-sm-2 col-sm-offset-8 btn btn-primary btn-md"  ng-disabled="fmAddCart.$invalid || isAddingTickets" ><a href="/MyRTS/login.html">Add Tickets to Cart</a></button>
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
				<div  ng-show="count>0">
					
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
		<!-- add end -->
			
		</div>
		<!-- / END CONTAINER -->
	</section>
	<!-- / END SEARCH SECTION -->

	<!-- =========================
   SEPARATOR TWO     
============================== -->

		<section class="separator-two">
			<div class="color-overlay">
				<h3 class="container text wow fadeInLeft animated"
					data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">Adventurous life waits ahead.</h3>
				<h3 class="container text wow fadeInRight animated"
					data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">What are you still looking for?</h3>
			</div>
		</section>
		<!-- / END SEPARATOR -->
	

	<!-- =========================
   CONTACT US         
============================== -->

	<section class="contact-us" id="contact">
		<div class="container">

			<!-- SECTION HEADER -->
			<div class="section-header">

				<!-- SECTION TITLE -->
				<h2 class="white-text">Get in touch</h2>

				<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
				<h6 class="white-text">Have any question? Drop us a message. We
					will get back to you in 24 hours.</h6>
			</div>
			<!-- / END SECTION HEADER -->

			<!-- CONTACT FORM-->
			<div class="row">
				<form role="form" class="contact-form" id="contact-form">
					<div class="wow fadeInLeft animated" data-wow-offset="30"
						data-wow-duration="1.5s" data-wow-delay="0.15s">
						<div class="col-lg-4 col-sm-4">
							<input type="text" name="name" placeholder="Your Name"
								class="form-control input-box" id="name">
						</div>
						<div class="col-lg-4 col-sm-4">
							<input type="email" name="email" placeholder="Your Email"
								class="form-control input-box" id="email">
						</div>
						<div class="col-lg-4 col-sm-4">
							<input type="text" name="subject" placeholder="Subject"
								class="form-control input-box" id="subject">
						</div>
					</div>

					<div class="col-md-12 wow fadeInRight animated"
						data-wow-offset="30" data-wow-duration="1.5s"
						data-wow-delay="0.15s">
						<textarea name="message" class="form-control textarea-box"
							placeholder="Your Message" id="message"></textarea>
					</div>
					<!-- IF MAIL SENT SUCCESSFULLY -->
					<h4 class="success pull-left white-text">Your message has been
						sent successfully.</h4>

					<!-- IF MAIL SENDING UNSUCCESSFULL -->
					<h4 class="error pull-left white-text">E-mail must be valid
						and message must be longer than 1 character.</h4>
					<button
						class="btn btn-primary custom-button red-btn wow fadeInLeft animated"
						id="submit" data-wow-offset="30" data-wow-duration="1.5s"
						data-wow-delay="0.15s" type="submit">Send Message</button>
				</form>
			</div>
			<!-- / END CONTACT FORM-->
		</div>
		<!-- / END CONTAINER -->
	</section>
	<!-- / END CONTACT US SECTION-->
	</div>

	<!-- =========================
   FOOTER             
============================== -->

	<footer>
		<div class="container">

			<!-- COMPANY ADDRESS-->
			<div class="col-md-5 company-details">
				<div>
					<span class="ion-android-pin red-text"></span>
				</div>
				Mercury Systems, Inc.
				<br>
				5 Independence Way, Suite 140
				<br>
				Princeton, NJ 08540 USA 
			</div>

			<!-- COMPANY EMAIL-->
			<div class="col-md-2 company-details">
				<div>
					<span class="ion-email green-text"></span>
				</div>
				rtsmailsender@gmail.com
			</div>

			<!-- COMPANY PHONE NUMBER -->
			<div class="col-md-2 company-details">
				<div>
					<div class="ion-android-call blue-text"></div>
				</div>
				+201 0000 0000
			</div>

			<!-- SOCIAL ICON AND COPYRIGHT -->
			<div class="col-lg-3 col-sm-3 copyright">
				<ul class="social">
					<li><a href=""><i class="ion-social-facebook-outline"></i></a></li>
					<li><a href=""><i class="ion-social-twitter-outline"></i></a></li>
					<li><a href=""><i class="ion-social-linkedin-outline"></i></a></li>
					<li><a href=""><i class="ion-social-googleplus-outline"></i></a></li>
					<li><a href=""><i class="ion-social-rss-outline"></i></a>
				</ul>
				Mercury
			</div>
		</div>
		<!-- / END CONTAINER -->
	</footer>
	<!-- / END FOOOTER  -->

	<!-- SCRIPTS -->
	<script src="/MyRTS/resource/tmpl/js/bootstrap.min.js"></script>
	<script src="/MyRTS/resource/tmpl/js/wow.min.js"></script>
	<script src="/MyRTS/resource/tmpl/js/jquery.nav.js"></script>
	<script src="/MyRTS/resource/tmpl/js/jquery.knob.js"></script>
	<script src="/MyRTS/resource/tmpl/js/owl.carousel.min.js"></script>
	<script src="/MyRTS/resource/tmpl/js/smoothscroll.js"></script>
	<script src="/MyRTS/resource/tmpl/js/jquery.vegas.min.js"></script>
	<script src="/MyRTS/resource/tmpl/js/zerif.js"></script>

</body>
</html>