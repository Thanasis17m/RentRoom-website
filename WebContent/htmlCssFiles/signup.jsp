<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Sign Up</title>
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

	<div class="signup_div">
		<form action="signup" method="post">
			<span class="signup_title">Sign Up for RentRoom</span>
			<span class="field_title">Username</span>
			<input class="input_signup" type="text" name="username"/>
			
			<%String usernameExists= (String) session.getAttribute("usernameExists"); 
		    	if(usernameExists != null){
					
					%>
			username already in use!
					<%} %>
			
			<span class="field_title">Password</span>
			<input class="input_signup" type="password" name="password"/>
			<span class="field_title">Re-enter Password</span>
			<input class="input_signup" type="password" name="re_password"/>
			<span class="field_title">Name</span>
			<input class="input_signup" type="text" name="name"/>
			<span class="field_title">Surname</span>
			<input class="input_signup" type="text" name="surname"/>
			<span class="field_title">E-mail</span>
			<input class="input_signup" type="text" name="email"/>
			<span class="field_title">Phone Number</span>
			<input class="input_signup" type="text" name="phone"/>
			<span class="field_title">Upload profile image(optional)</span>
			<!--accept="image/*" is equal to accept="image/gif, image/jpeg, image/png" and accepts only image files-->
			<input type="file" name="image" id="image" accept="image/*" />
			<span class="field_title">I want to be a...</span>

			<div class="role_div">
				<input type="radio" name="user_role" id="radio1" class="radio" value="renter"/>
				<label class="role_name" for="radio1">Renter</label>
			</div>
			<div class="role_div">
				<input type="radio" name="user_role" id="radio2" class="radio" value="host"/>
				<label class="role_name" for="radio2">Host &amp; Renter</label>
			</div>
			<div style="clear:both;"></div>

			<input id="signup_button" type="submit" value="Sign Up"/>
			
		</form>
	</div>





</body>



</html>