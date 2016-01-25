<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RailwayTicketingSystem | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resource/dist/css/AdminLTE.min.css"/>">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value="/resource/plugins/iCheck/square/blue.css"/>">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<script src="<c:url value="/resource/md5.js"/>"></script>
<style>
.body-class {
	background-image: url(/MyRTS/resource/image/maintheme.jpg);
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<script type="text/javascript">
	function encode() {

		document.getElementById("j_password").value = md5(document.getElementById("raw_password").value);
		<!--alert(document.getElementById("j_password").value);-->
	}
</script>
</head>

<body class="hold-transition login-page body-class">
	<header id="top" class="header">
	<div class="login-box">
		<div class="login-logo">
			<a href="/MyRTS/main1.html" style="color: #3c8dbc"><b>Railway
					Ticketing System</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<!-- <p class="login-box-msg">Sign in to start your session</p> -->
			<form name="f" action="<c:url value='j_spring_security_check'/>"
				method="post" id="login-form">
				<div class="form-group has-feedback">
					<input type="username" name="j_username" id="j_username"
						class="form-control" placeholder="E-mail Address"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="raw_password" id="raw_password"
						class="form-control" placeholder="Password"> <input
						type="password" name="j_password" id="j_password"
						style="display: none"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox"> Remember Me
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" id="signin"
							class="btn btn-primary btn-block btn-flat" onclick="encode()">Sign
							In</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<div class="social-auth-links text-center">
				<p>- OR -</p>
				<a href="https://www.facebook.com/"
					class="btn btn-block btn-social btn-facebook btn-flat"><i
					class="fa fa-facebook"></i> Sign in using Facebook</a> <a
					href="https://myaccount.google.com/"
					class="btn btn-block btn-social btn-google btn-flat"><i
					class="fa fa-google-plus"></i> Sign in using Google+</a>
			</div>
			<div>
				Forgot your password? <a href="resetpassword.html"
					class="text-center">Reset it</a>
			</div>

			<div>
				Don't have an account? <a href="register.html" class="text-center">Create
					one</a>


			</div>
			<!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->
	</header>
	<!-- jQuery 2.1.4 -->
	<script
		src="<c:url value="/resource/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
	<!-- Bootstrap 3.3.5 -->
	<script
		src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js"/>"></script>
	<!-- iCheck -->
	<script src="<c:url value="/resource/plugins/iCheck/icheck.min.js"/>"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
