<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
</head>
<body>
	<h1>
		<font color="blue">${title}</font>
	</h1>
	<a href="<c:url value='/admin/dashboard.html'/>">Dashboard</a>
	<a href="<c:url value='/admin/schedule.html'/>">Schedule</a>	
	<a href="<c:url value='/admin/order.html'/>">Order</a>
	<a href="<c:url value='/admin/station.html'/>">Station</a>
	<a href="<c:url value='/admin/train.html'/>">Train</a>
	<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
</body>
</html>