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
 FAV AND TOUCH ICONS  
============================== -->
<link rel="shortcut icon" href="images/icons/favicon.ico">
<link rel="apple-touch-icon" href="images/icons/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="images/icons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="images/icons/apple-touch-icon-114x114.png">

<!-- =========================
     STYLESHEETS      
============================== -->
<link rel="stylesheet" href="resource/tmpl/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/tmpl/css/owl.theme.css">
<link rel="stylesheet" href="resource/tmpl/css/owl.carousel.css">
<link rel="stylesheet" href="resource/tmpl/css/jquery.vegas.min.css">
<link rel="stylesheet" href="resource/tmpl/css/animate.min.css">

<link rel="stylesheet" href="resource/tmpl/assets/icon-fonts/styles.css">
<link rel="stylesheet" href="resource/tmpl/css/pixeden-icons.css">

<!-- CUSTOM STYLES -->
<link rel="stylesheet" href="resource/tmpl/css/styles.css">
<link rel="stylesheet" href="resource/tmpl/css/responsive.css">

<!-- <link href="/resource/templates/template1/css/styles.css"
	rel="stylesheet">
<link href="/resource/js/angular-datepicker/dist/angular-datepicker.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="/resource/js/angucomplete-alt/angucomplete-alt.css" />
<link rel="stylesheet"
	href="/resource/js/font-awesome/css/font-awesome.css" /> -->

<!-- WEBFONT -->
<link
	href='http://fonts.googleapis.com/css?family=Lato:300,400,700,400italic|Montserrat:700,400|Homemade+Apple'
	rel='stylesheet' type='text/css'>


<!-- JQUERY -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- js -->
<!-- <script type="text/javascript" src="/resource/js/jquery/jquery-2.1.4.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resource/js/angular/angular.js"></script>
<script type="text/javascript" src="/resource/templates/template1/js/scripts.js"></script>


<script type="text/javascript" src="/resource/js/angucomplete-alt/angucomplete-alt.js"></script>
<script type="text/javascript"
	src="/resource/js/angular-datepicker/dist/angular-datepicker.min.js"></script>

<script type="text/javascript" src="/resource/js/angular/angular-touch.min.js"></script>
<script type="text/javascript" src="/resource/js/util.js"></script>

<script type="text/javascript" src="/resource/js/myrts/mainpage.js"></script> -->

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

<script src="<c:url value="/resource/js/myrts/mainpage.js"/>"></script>

</head>

<body ng-app="mainModule">
	<div id="wrap" ng-controller="mainController">
		<img class="vegas-background" src="resource/image/maintheme.jpg"
			style="position: fixed; left: 0px; top: -200px; width: 1920px; height: 1080px; bottom: auto; right: auto">
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
						<!-- <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button> -->
						<!-- <div class="navbar-brand"> -->
						<img src="resource/image/trainlogo.jpg" alt="rts"
							style="left: 0px; width: 70px; height: 70px">
						<!-- </div> -->
					</div>
					<nav class="navbar-collapse collapse" role="navigation"
						id="bs-navbar-collapse">
						<ul
							class="nav navbar-nav navbar-right responsive-nav main-nav-list">
							<li><a href="#home">Home</a></li>
							<li><a href="#booking">Booking</a></li>
							<li><a href="#features">Search</a></li>
							<li><a href="#testimonials">Testimonials</a></li>
							<li><a href="#contact">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- / END TOP BAR -->

			<!-- BIG HEADING WITH CALL TO ACTION BUTTONS AND SHORT MESSAGES -->
			<div class="container">

				<!-- HEADING -->
				<h1 class="intro wow fadeInLeft antimated" data-wow-offset="200"
					data-wow-duration="2.5s" data-wow-delay="0.15s">To come, to
					see, to conquer.</h1>

				<!-- CALL TO ACTION BUTTONS -->
				<!-- <div class="buttons inpage-scroll">
					<a href="#works" class="btn btn-primary custom-button red-btn">Ready
						To Go</a> <a href="#pricingtable"
						class="btn btn-primary custom-button green-btn">Join Us</a>
				</div> -->
				
				<div class="buttons rows">
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
							<i class="icon icon-fontawesome-webfont-358"></i> Find your
							destinations
						</div>
					</div>
					<div class="col-lg-4 col-sm-4">
						<div class="short-text">
							<i class="icon-fontawesome-webfont-286"></i> Experience best
							services
						</div>
					</div>
					<div class="col-lg-4 col-sm-4">
						<div class="short-text">
							<i class="icon-fontawesome-webfont-347"></i> Have nice journeys
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
					data-wow-delay="0.15s">We have 100+ happy customers in last
					few years. You can check what they're saying about us.</h3>
				<div class="wow fadeInRight animated" data-wow-offset="30"
					data-wow-duration="1.5s" data-wow-delay="0.15s">
					<a href="" class="btn btn-primary custom-button green-btn">TESTIMONIALS</a>
				</div>
			</div>
		</section>
		<!-- / END SEPARATOR -->



		<ssection class="packages" id="booking">
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
						style="padding: 20px; background-color: rgba(5, 5, 5, .8); border-radius: 25px;">
						<form id="fmSearchTrain" name="fmSearchTrain" ng-submit="submitData(trainSearch, 'ajaxResult')">
							<div class="row">
								<div class="col-sm-4 col-sm-offset-2 lead text-left">
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
								<div class="col-sm-4 col-sm-offset-2 lead text-left">
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
								<div class="col-sm-4 col-sm-offset-2 lead text-left">
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
								<input ng-click="count=count+1" type="submit" class="btn btn-primary custom-button blue-btn" role="button" value="Submit">
								<!-- <a href="#" class="btn btn-primary custom-button blue-btn">Submit
								</a> -->
							</div>
						</form>
					</div>
					
				</div>

			</div>
			<!-- / END PACKAGES -->
	</div>
	<!--END CONTAINER  -->
	</section>
	<!-- END PACKAGES SECTION -->

	<!-- =========================
   FEATURES SECTION   
============================== -->
	<section class="features" id="features"  ng-show="count">
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
			<div id="divSelectTrain">
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
				<div id="divDisplayTrainTransits"   ng-show="count>0">
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
	<!-- / END FEATURES SECTION -->



	<!-- =========================
   NEWSETTER          
============================== -->

	<section class="newsletter">
		<div class="container">
			<h3 class="white-text wow fadeInLeft animated" data-wow-offset="30"
				data-wow-duration="1.5s" data-wow-delay="0.15s">Stay in touch</h3>
			<!-- NEWSLETTER SECTION HEADING -->
			<div class="sub-heading white-text wow fadeInRight animated"
				data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s">
				Sign Up for Email Updates on on News &amp; Offers</div>

			<!-- SUBSCRIPTION FORM -->
			<form action="#" class="subscription wow fadeInLeft animated"
				data-wow-offset="30" data-wow-duration="1.5s" data-wow-delay="0.15s"
				role="form">
				<input type="email" placeholder="Enter email"
					class="form-control input-box">
				<button class="btn btn-primary custom-button red-btn">Sign
					Up</button>
			</form>
			<!-- / END SUBSCRIPTION FORM -->

		</div>
		<!-- / END CONTAINER -->
	</section>
	<!-- / END NEWSLETTER SECTION -->

	<!-- =========================
   TESTIMONIAL        
============================== -->

	<section class="testimonial" id="testimonials">
		<div class="container">

			<!-- SECTION HEADER -->
			<div class="section-header">

				<!-- SECTION TITLE -->
				<h2 class="white-text">Testimonials</h2>

				<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
				<h6 class="white-text">We have worked with hundreds of clients.
					Check what our awesome happy clients saying about us.</h6>
			</div>
			<!-- / END SECTION HEADER -->

			<!-- CLIENT FEEDBACKS -->
			<div class="row wow fadeInRight animated" data-wow-offset="30"
				data-wow-duration="1.5s" data-wow-delay="0.15s">
				<div class="col-md-12">
					<div id="client-feedbacks" class="owl-carousel owl-theme">

						<!-- SINGLE FEEDBACK BOX-->
						<div class="feedback-box">

							<!-- MESSAGE OF THE CLIENT -->
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>

							<!-- CLIENT INFORMATION -->
							<div class="client">
								<div class="quote red-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">Frank Willian</a>
									<div class="client-company">CEO, AbcD Network</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/1.jpg" alt="">
								</div>
							</div>
							<!-- / END CLIENT INFORMATION-->
						</div>
						<!-- / END SINGLE FEEDBACK BOX-->

						<div class="feedback-box">
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>
							<div class="client">
								<div class="quote green-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">David Clyne</a>
									<div class="client-company">CEO, Zyxw</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/2.jpg" alt="">
								</div>
							</div>
						</div>

						<div class="feedback-box">
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>
							<div class="client">
								<div class="quote blue-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">Keith McCarthy</a>
									<div class="client-company">Manager, XYZ Inc.</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/3.jpg" alt="">
								</div>
							</div>
						</div>

						<div class="feedback-box">
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>
							<div class="client">
								<div class="quote red-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">Frank Willian</a>
									<div class="client-company">CEO, AbcD Network</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/2.jpg" alt="">
								</div>
							</div>
						</div>

						<div class="feedback-box">
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>
							<div class="client">
								<div class="quote green-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">David Clyne</a>
									<div class="client-company">CEO, Zyxw</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/3.jpg" alt="">
								</div>
							</div>
						</div>

						<div class="feedback-box">
							<div class="message">“Called days. Image kind beginning
								have. Herb set kind herb. Wherein saying third was, every land
								moveth also bearing hath bring had give god gathered behold open
								cattle after a, from third male subdue multiply divided void
								cattle winged. Herb set kind herb. multiply divided void cattle
								winged. Herb set kind herb.”</div>
							<div class="client">
								<div class="quote blue-text">
									<i class="icon-fontawesome-webfont-294"></i>
								</div>
								<div class="client-info">
									<a class="client-name" href="">Keith McCarthy</a>
									<div class="client-company">Manager, XYZ Inc.</div>
								</div>
								<div class="client-image hidden-xs">
									<img src="images/clients-pic/1.jpg" alt="">
								</div>
							</div>
						</div>

					</div>
					<!-- / END FEEDBACKS-->
				</div>
				<!-- / END COLUMN -->
			</div>
			<!-- / END ROW -->

		</div>
		<!-- / END CONTAINER -->
	</section>
	<!-- / END TESTIMONIAL SECTION -->

	<!-- =========================
   PURCHASE NOW       
============================== -->

	<section class="purchase-now">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<h3 class="white-text wow fadeInLeft animated" data-wow-offset="30"
						data-wow-duration="1.5s" data-wow-delay="0.15s">Hey, We're at
						the finishing line. Enjoyed the template?</h3>
				</div>
				<div class="col-md-3 wow fadeInRight animated" data-wow-offset="30"
					data-wow-duration="1.5s" data-wow-delay="0.15s">
					<a href="" class="btn btn-primary custom-button red-btn">Purchase
						Now</a>
				</div>
			</div>
		</div>
	</section>
	<!-- / END PURCHASE NOW SECTION-->

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

	<!-- =========================
   FOOTER             
============================== -->

	<footer>
		<div class="container">

			<!-- COMPANY ADDRESS-->
			<div class="col-md-5 company-details">
				<div class="icon-top red-text">
					<i class="icon-fontawesome-webfont-302"></i>
				</div>
				PO Box 16122 Collins Street West, Victoria 8007 Australia
			</div>

			<!-- COMPANY EMAIL-->
			<div class="col-md-2 company-details">
				<div class="icon-top green-text">
					<i class="icon-fontawesome-webfont-329"></i>
				</div>
				contact@designlab.co
			</div>

			<!-- COMPANY PHONE NUMBER -->
			<div class="col-md-2 company-details">
				<div class="icon-top blue-text">
					<i class="icon-fontawesome-webfont-101"></i>
				</div>
				+613 0000 0000
			</div>

			<!-- SOCIAL ICON AND COPYRIGHT -->
			<div class="col-lg-3 col-sm-3 copyright">
				<ul class="social">
					<li><a href=""><i class="icon-facebook"></i></a></li>
					<li><a href=""><i class="icon-twitter-alt"></i></a></li>
					<li><a href=""><i class="icon-linkedin"></i></a></li>
					<li><a href=""><i class="icon-behance"></i></a></li>
					<li><a href=""><i class="icon-dribbble"></i></a></li>
				</ul>
				©2013 Zerif LLC
			</div>
		</div>
		</div>
		<!-- / END CONTAINER -->
	</footer>
	<!-- / END FOOOTER  -->

	<!-- SCRIPTS -->
	<script src="resource/tmpl/js/bootstrap.min.js"></script>
	<script src="resource/tmpl/js/wow.min.js"></script>
	<script src="resource/tmpl/js/jquery.nav.js"></script>
	<script src="resource/tmpl/js/jquery.knob.js"></script>
	<script src="resource/tmpl/js/owl.carousel.min.js"></script>
	<script src="resource/tmpl/js/smoothscroll.js"></script>
	<script src="resource/tmpl/js/jquery.vegas.min.js"></script>
	<script src="resource/tmpl/js/zerif.js"></script>

</body>
</html>