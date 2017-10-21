<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Contact Host</title>
	<meta name="description" content="RentRoom"/>
	<meta name="keywords" content="Rent,room,everywhere"/>
	
	<!--Jquery library-->
	<script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!--CSS files links-->
	<link rel="stylesheet" type="text/css" href="basic.css"></link>
	<link rel="stylesheet" type="text/css" href="navbar.css"></link>
	<link rel="stylesheet" type="text/css" href="loginModal.css"></link>
	<link rel="stylesheet" type="text/css" href="contactHost.css"></link>
	
	<!--Javascript files links-->
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>  
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
	
</head>
<body>

	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	<div class="contact_div">
		<form action="insertNewMessage" method="post">
			<span class="contact_title">Contact Listing's Host</span>
			<p>Ask a question or write your message below. The host will anwser back as soon as possible.</p>
			<p>You can find your messages and all your conversations at the 'messages' tab in your user's profile.</p>
			<textarea rows="10" class="contact_textarea" name="message"></textarea>
			<button type="submit" name="contact_button" value="" class="contact_button" >Send message</button>
		</form>
	</div>
	
	
	

</body>
</html>