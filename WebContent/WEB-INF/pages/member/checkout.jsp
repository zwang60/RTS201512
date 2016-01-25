<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Checkout</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

<%--     <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script> --%>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    <script src="<c:url value="/resource/js/jquery/jquery-2.1.4.js"/>"></script>
	<script src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
	<script src="<c:url value="/resource/templates/template1/js/scripts.js"/>"></script>
	<script src="<c:url value="/resource/js/angucomplete-alt/angucomplete-alt.js"/>"></script>
	<script src="<c:url value="/resource/js/angular-datepicker/dist/angular-datepicker.min.js"/>"></script>
	<script src="<c:url value="/resource/js/angular/angular-touch.min.js"/>"></script>
	<script src="<c:url value="/resource/js/util.js"/>"></script>
	<script src="<c:url value="/resource/js/myrts/checkout.js"/>"></script>
    
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
                    <li><a href="ticket.html"><i class="fa fa-tasks"></i> Tickets</a></li>                    
                    <li><a href="creditcard.html"><i class="fa fa-globe"></i> CreditCard</a></li>
                    <li><a href="order.html"><i class="fa fa-list-ol"></i> Order</a></li>
                    <li class="active"><a href="checkout.html"><i class="fa fa-font"></i> CheckOut</a></li>                
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
                        Please check your order informations below! 
                        <br />
                    </div>
                </div>
        </div>
        <div ng-show="canShowCart" class="row">
				<div class="col-sm-10 col-sm-offset-1">
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
								<td>{{ct.value}}</td>
								<td>$ {{ct.key.price.toFixed(2)}}</td>
								<td>$ {{(ct.key.price*ct.value).toFixed(2)}}</td>
							</tr>
						</tbody>
					</table>
				</div>
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
			<div id="divCreditCard" class="row">
				<div class="col-sm-5 col-sm-offset-3  text-left">
					<form id="fmCheckout" name="fmCheckout" ng-submit="checkout()">
						<h3>Payment Method</h3>
						<br>

						<h4>Credit Card Information</h4>
						<br>
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td class="col-sm-4">First Name:</td>
									<td><input type="text" ng-model="cc.firstName"
										maxlength=50 placeholder="First Name" required /></td>
								</tr>
								<tr>
									<td>Last Name:</td>
									<td><input type="text" ng-model="cc.lastName" maxlength=50
										placeholder="Last Name" required /></td>
								</tr>
								<tr>
									<td>Credit Card Type</td>
									<td><select ng-model="cc.cardType" required>
											<option value="visa">Visa</option>
											<option value="master">Master</option>
											<option value="discover">Discover</option>
											<option value="amex">American Express</option>
									</select></td>
								</tr>
								<tr>
									<td>Credit Card No:</td>
									<td><input type="text" name="cardNo" id="cardNo"
										ng-model="cc.cardNo" maxlength=20
										placeholder="Credit Card Number" required /></td>
								</tr>
								<tr>
									<td>Expiration Date:</td>
									<td><input type="text" ng-model="cc.exp" maxlength=7
										placeholder="MM/YYYY" required /></td>
								</tr>
								<td>CVV:</td>
								<td><input type="text" ng-model="cc.cvv" maxlength=4
									placeholder="CVV" required /></td>
								</tr>
							</tbody>
						</table>
						<br>
						<h4>Billing Address</h4>
						<br>
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td class="col-sm-4">Address:</td>
									<td><input type="text" ng-model="cc.billingAddr"
										maxlength=100 placeholder="billing address" required /></td>
								</tr>
								<tr>
									<td>City:</td>
									<td><input type="text" ng-model="cc.city" maxlength=30
										placeholder="City" required /></td>
								</tr>
								<tr>
									<td>State:</td>
									<td><select ng-model="cc.state" required>
											<option value="AL">Alabama</option>
											<option value="AK">Alaska</option>
											<option value="AZ">Arizona</option>
											<option value="AR">Arkansas</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DE">Delaware</option>
											<option value="DC">District Of Columbia</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="HI">Hawaii</option>
											<option value="ID">Idaho</option>
											<option value="IL">Illinois</option>
											<option value="IN">Indiana</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
											<option value="LA">Louisiana</option>
											<option value="ME">Maine</option>
											<option value="MD">Maryland</option>
											<option value="MA">Massachusetts</option>
											<option value="MI">Michigan</option>
											<option value="MN">Minnesota</option>
											<option value="MS">Mississippi</option>
											<option value="MO">Missouri</option>
											<option value="MT">Montana</option>
											<option value="NE">Nebraska</option>
											<option value="NV">Nevada</option>
											<option value="NH">New Hampshire</option>
											<option value="NJ">New Jersey</option>
											<option value="NM">New Mexico</option>
											<option value="NY">New York</option>
											<option value="NC">North Carolina</option>
											<option value="ND">North Dakota</option>
											<option value="OH">Ohio</option>
											<option value="OK">Oklahoma</option>
											<option value="OR">Oregon</option>
											<option value="PA">Pennsylvania</option>
											<option value="RI">Rhode Island</option>
											<option value="SC">South Carolina</option>
											<option value="SD">South Dakota</option>
											<option value="TN">Tennessee</option>
											<option value="TX">Texas</option>
											<option value="UT">Utah</option>
											<option value="VT">Vermont</option>
											<option value="VA">Virginia</option>
											<option value="WA">Washington</option>
											<option value="WV">West Virginia</option>
											<option value="WI">Wisconsin</option>
											<option value="WY">Wyoming</option>
									</select></td>
								</tr>
								<tr>
									<td>Zip:</td>
									<td><input type="text" ng-model="cc.zip" maxlength=5
										placeholder="Zip" required /></td>
								</tr>
							</tbody>

						</table>
						<button type="submit"
							ng-disabled="isSubmitOrder || (!checkCard(cc.cardNo))"
							class="col-sm-3 col-sm-offset-8 btn btn-primary btn-md"
							data-toggle="modal" data-target="#myModal">Submit order</button>
					</form>
				</div>
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