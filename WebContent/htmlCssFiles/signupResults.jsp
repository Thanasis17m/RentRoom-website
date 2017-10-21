<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Successful Sign Up</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>

  <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>
  <link rel="stylesheet" type="text/css" href="signup.css"></link>

  <!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>

</head>

<body>

	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	<div class="successful_sign_up">

		<h3>Congratulations, you signed up successfully!!!</h3>
		<p>If you signed up as a host,your role as a host has to be verified by the admin. This may take a few hours.</p>
		<p>Thank you for becoming part of our community.</p>
		<a href="index.jsp">Rent a room anywhere now...</a>

	</div>


</body>


</html>