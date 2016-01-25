<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailwayTicketingSystem || DashBoard</title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/font-awesome/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/newSource/css/local.css" />">

    <script type="text/javascript" src="<c:url value="/resource/newSource/js/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resource/newSource/bootstrap/js/bootstrap.min.js"/>"></script>

    <!-- you need to include the shieldui css and js assets in order for the charts to work -->
    <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
   	<style>
    	.text-right {
    		float: none;
   		    margin: auto;
    		text-align: center;
    	}
    	text[text-anchor=start] tspan, text[text-anchor=end] tspan{
    		display:none;
    	}
    </style>
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
                    <li class="active"><a href="dashboard.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li><a href="order.html"><i class="fa fa-tasks"></i> Order</a></li>                    
                    <li><a href="train.html"><i class="fa fa-globe"></i> Train</a></li>
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
                    <h1>Administrator Home Page <small>DashBoard </small></h1>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Welcome to RailwayTicketingSystem  administrator dashboard! 
                        <br />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-clock-o"></i>Informations</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row alert-success">
                                <div class="col-xs-5 text-right">
                                    <p class="alerts-heading">${orders}</p>
                                    <p class="alerts-text">Orders</p>
                                </div>
                            </div>
                            <div class="row alert-success">
                                <div class="col-xs-5 text-right">
                                    <p class="alerts-heading">${trains}</p>
                                    <p class="alerts-text">Trains</p>
                                </div>
                            </div>

                            <div class="row alert-success">
                                <div class="col-xs-5 text-right">
                                    <p class="alerts-heading">${station}</p>
                                    <p class="alerts-text">Stations</p>
                                </div>
                            </div>
                            <div class="row alert-success">
                                <div class="col-xs-5 text-right">
                                    <p class="alerts-heading">${count }</p>
                                    <p class="alerts-text">TotalUsers</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Users Activation Rate</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart2"></div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>All Tickets</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart5"></div>
                        </div>

                    </div>
                </div>
	               <!--  <div class="col-lg-9">
	                    <div class="panel panel-primary">
	                        <div class="panel-heading">
	                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Traffic Estimations for last 30 days</h3>
	                        </div>
	                        <div class="panel-body">
	                            <div id="shieldui-chart1"></div>
	                        </div>
	                    </div>
	                </div> -->
            </div>
          <!--   <div class="row">
             
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Budget</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart3"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Purchases</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-chart4"></div>
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Total Orders</h3>
                        </div>
                        <div class="panel-body">
                            <div id="shieldui-grid1"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
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
    <script type="text/javascript">
        jQuery(function ($) {
        	var orderData = [];
        	$.ajax({
				url: "/MyRTS/admin/orderData",
				type: "get",
				dataType: "json",
				async: false,
				success: function(data) {
					orderData = data;
				}
			});
        	trains = ${trains};
        	station = ${station};
        	count = ${count};
        	actived = ${actived};
        	newuser = count-actived;
        	train1 = ${train1};
        	train2 = ${train2};
        	train3 = ${train3};
        	train4 = ${train4};
            var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                visit1 = [actived],
                visit2 = [newuser],
                budget = [23, 19, 11, 134, 242, 352, 435, 22, 637, 445, 555, 57],
                sales = [11, 9, 31, 34, 42, 52, 35, 22, 37, 45, 55, 57];

            $("#shieldui-chart1").shieldChart({
                primaryHeader: {
                    text: "Visitors"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                dataSeries: [{
                    seriesType: "area",
                    collectionAlias: "Q Data",
                    data: performance
                }]
            });

            $("#shieldui-chart2").shieldChart({
                primaryHeader: {
                    text: "User Activation Rate"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                seriesSettings: {
                    donut: {
                        enablePointSelection: true
                    }
                },
                dataSeries: [{
                    seriesType: "bar",
                    collectionAlias: "Activated User",
                    data: visit1
                },
                {
                    seriesType: "bar",
                    collectionAlias: "NonActivated User",
                    data: visit2
                }
                ]
            });

            $("#shieldui-chart5").shieldChart({
                primaryHeader: {
                    text: "All Train Available Tickets"
                },
                dataSeries: [{
                	seriesType: "pie",
                    data: [
                        ["train1", train1],
                        ["train2", train2],
                        { collectionAlias: "train3", y: train3, sliced: true },
                        ["train4", train4]
                       
                    ]
                }]
            });

            $("#shieldui-chart4").shieldChart({
                primaryHeader: {
                    text: "Sales"
                },
                dataSeries: [{
                    seriesType: "bar",
                    collectionAlias: "sales",
                    data: sales
                }]
            });
			
            $("#shieldui-grid1").shieldGrid({
                dataSource: {
                    data: orderData
                },
                sorting: {
                    multiple: true
                },
                paging: {
                    pageSize: 12,
                    pageLinksCount: 4
                },
                selection: {
                    type: "row",
                    multiple: true,
                    toggle: false
                },
                columns: [
                    { field: "orderNo", title: "OrderNumber" },
                    { field: "user.email", title: "Email" },
                    { field: "user.userId", title: "UserID"},
            		{ field: "date", title: "OrderDate" },
                    { field: "creditCardNo", title: "CreditCardNumber"},
                    { field: "status", title: "OrderStatus"} 
                ]
            });
        });
    </script>
    
    
</body>
</html>