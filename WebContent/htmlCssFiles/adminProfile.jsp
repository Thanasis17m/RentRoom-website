<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Admin Profile</title>

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

  <jsp:include page="navbar.jsp" />

  <!--The modal login window that appears when login button is pressed-->
 <jsp:include page="login_window.jsp" />



<div class="main_div">

	<div class="admin_option">
		<h2>Users</h2>
		<p>Press this button to see all the registered users and their info.</p>

		<form action="findAllUsers" method ="get">
			<input class="admin_button" type="submit" value="Show Users"/>
		</form>

	</div>

	<div style="margin: 10px 0px;"></div>

	<div class="admin_option">
		<h2>Host Petitions</h2>
		<p>Press this button to see the users' host petitions. You have to accept their petitions for them to unlock the host's abilities.</p>

		<form action="findHostPetitions" method ="get">
			<input class="admin_button" style="width: 170px;" type="submit" value="Show Host Petitions"/>
		</form>

	</div>

	<div style="margin: 10px 0px;"></div>

	<div class="admin_option" style="border-bottom: none;">
		<h2>Export info in XML</h2>
		<p>Here you can export the database's info in XML files.</p>
	</div>


</div>





</body>

</html>