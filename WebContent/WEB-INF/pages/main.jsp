<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
</head>
<body>
<h1><font color="blue">${title}</font></h1>
<a href="<c:url value='/login.html'/>">Login</a>
<a href="<c:url value='/register.html'/>">Register</a>
<a href="<c:url value='/resetpassword.html'/>">Resetpassword</a>
</body>
</html>