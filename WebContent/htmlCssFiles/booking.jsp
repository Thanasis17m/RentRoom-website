<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="basic.css"></link>
<link rel="stylesheet" type="text/css" href="navbar.css"></link>
<link rel="stylesheet" type="text/css" href="index.css"></link>
<link rel="stylesheet" type="text/css" href="loginModal.css"></link>

 <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>
 <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
 
<title>booking results</title>




</head>
<body>

<jsp:include page="navbar.jsp" />	

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />
	<% int available =(int) request.getAttribute("available");
	if(available == 1){
		%>
		<div style="max-width: 800px; margin: 40px auto; background-color: #f2f2f2; padding: 15px; border: 2px solid #ff5733;">

		<h3>You have successfully made a booking!</h3>
		
		

	</div>
		<%
	}
	else{
	%>
		<div style="max-width: 800px; margin: 40px auto; background-color: #f2f2f2; padding: 15px; border: 2px solid #ff5733;">

		<h3>Hotel not available for the requested dates.Please go back and try other dates.</h3>
		
		</div>
	
	<%} %>
</body>
</html>