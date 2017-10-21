<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="RentRoom"/>
	<meta name="keywords" content="Rent,room,everywhere"/>
	
	 <!--Jquery library-->
	<script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!--CSS files links-->
	<link rel="stylesheet" type="text/css" href="basic.css"></link>
	<link rel="stylesheet" type="text/css" href="navbar.css"></link>
	<link rel="stylesheet" type="text/css" href="adminProfile.css"></link>
	<link rel="stylesheet" type="text/css" href="loginModal.css"></link>
	
	<!--Javascript files links-->
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>  
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
</head>
<body>

	<!--The navigation bar-->
  <jsp:include page="navbar.jsp" />

  <!--The modal login window that appears when login button is pressed-->
  <jsp:include page="login_window.jsp" />

	<div class="main_div">
		<h3>Successful Verification!!</h3>
		<p>The selected user has been verified as a host successfully. Press here to see more users that need host verification.</p>
		<form action="findHostPetitions" method ="get">
				<input class="admin_button" style="width: 250px;" type="submit" value="Show Remaining Host Petitions"/>
		</form>
	</div>
</body>
</html>