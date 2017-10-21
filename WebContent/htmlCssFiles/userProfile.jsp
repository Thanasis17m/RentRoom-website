<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Profile</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>

   <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>
  <link rel="stylesheet" type="text/css" href="userProfile.css"></link>

  <!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/profileTabs.js"></script>

</head>

<body>

	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />
	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	<!--The user's profile-->
	<div class="user_profile">

		<div class="card"><!--The box with the photo and the greeting-->
			<img src="..//Images/avatar_img.png" alt="User's photo" id="user_image"></img>

			<div class="user_greeting">
				<span class="hello_msg">Hello User!!</span>
				<span class="info">Joined in June 6 2017</span>
			</div>	
		</div>

		<div class="tabs"><!--The tab buttons-->
			<button class="tab_button" onclick="openTab(event, 'About')" id="defaultOpen">About</button>
		</div>


		<!--The about tab-->
		<div id="About" class="tabcontent">
		  <h2>Info</h2>
		  <p>Here are this user's personal info.</p> 


		  <div><span class="field_title">Username:</span>
		  	<span class="field_value">Thanasis17</span>
		  </div>			  
		  <div><span class="field_title">Name:</span>
		  	<span class="field_value">Thanasis</span>
		  </div>
		  <div><span class="field_title">Surname:</span>
		  	<span class="field_value">M</span>
		  </div>
		  <div><span class="field_title">E-mail:</span>
		  	<span class="field_value">blabla@yahoo.com</span>
		  </div>
		  <div><span class="field_title">Phone Number:</span>
		  	<span class="field_value">2102128672</span>
		  </div>

		</div>


	</div>

</body>


</html>