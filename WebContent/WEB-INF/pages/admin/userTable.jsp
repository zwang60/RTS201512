<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailwayTicketingSystem || UserTable</title>
    
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resource/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
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
                    <li><a href="schedule.html"><i class="fa fa-list-ol"></i> Schedule</a></li>
                    <li><a href="station.html"><i class="fa fa-font"></i> Station</a></li> 
                    <li class="active"><a href="userTable.html"><i class="fa fa-list-ul"></i> UserTable</a></li>  
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
                    <h1>Administrator UserTable Page <small>Usertable </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Please check blow users!
                        <br />
                    </div>
                </div>
            </div>
			<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				<div ng-app="orderModule" ng-controller="OrderController">
					<table id="order"
						class="table table-bordered table-striped dataTable" role="grid" >
						<thead>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Password</th>
							</tr>
						</thead>
						
						<tbody>
						<c:forEach var="user" items="${userTable}">
						<tr>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>
							<td>${user.password}</td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</section>

			<!-- /. tools -->
		</div>

      </div>

</div>
</body>
</html>