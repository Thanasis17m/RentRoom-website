<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="entities.User,java.util.List,entities.Coordinates" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>My Profile</title>

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
 
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/editUserInfo.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/cancelEditInfo.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZulx8RWdPe2Ucka1HcIl0o5LRaYD0oUc"></script>
<script language="javascript" type="text/javascript" src="..//JavascriptFiles/googleMapsAllListings.js"></script>
</head>

<body>
	
		
	<jsp:include page="tabs.jsp" />
	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />
	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	<!--The user's profile-->
	<div class="user_profile">

		<div class="card"><!--The box with the photo and the greeting-->
			<img src="..//Images/avatar_img.png" alt="User's photo" id="user_image"></img>

			<div class="user_greeting">
				<span class="hello_msg">Hello <%= session.getAttribute("username") %>!!</span>
				<span class="info">Joined in June 6 2017</span>
			</div>	
		</div>

		<div class="tabs"><!--The tab buttons-->
			<button class="tab_button" onclick="openTab(event, 'Bookings')" id="defaultOpen">Bookings</button>
			<button class="tab_button" onclick="openTab(event, 'About')">About</button>
			<button class="tab_button" onclick="openTab(event, 'Reviews')">Reviews</button>
			<button class="tab_button" onclick="openTab(event, 'Messages')">Messages</button>
			<button class="tab_button" onclick="openTab(event, 'Host')">Host</button>
		</div>

		<!--The bookings tab-->
		<div id="Bookings" class="tabcontent">
		  <h2>Bookings</h2>
		  <p>Here are the bookings you've made.</p>
		  <div class="booking_box">
		  	<div class="booking_title">Hotel/Apartment name</div>
		  	<div>Arrival date: 1-1-2025</div>
		  	<div>Departure date: 18-2-2032</div>
		  	<div>Price: 100,000 &euro;</div>

		  </div>
		
		</div>

		<!--The about tab-->
		<div id="About" class="tabcontent">
		  <h2>Info</h2>
		  <p>Here are your personal info.</p> 
		  
		  <%
  			User user = (User) request.getAttribute("userDetails");%>

		  <form action="SaveChanges" method="post">

			  <div><span class="field_title">Username:</span>
			  	<span class="field_value"><%=user.getUsername()%></span>
			  	<input  type="hidden" name="username" value="<%=user.getUsername()%>"></input>
			  </div>			  
			  <div><span class="field_title">Name:</span>
			  	<span class="field_value"><%=user.getName()%></span>
			  	<input class="edit_box" type="text" name="name"></input>
			  </div>
			  <div><span class="field_title">Surname:</span>
			  	<span class="field_value"><%=user.getSurname()%></span>
			  	<input class="edit_box" type="text" name="surname"></input>
			  </div>
			  <div><span class="field_title">E-mail:</span>
			  	<span class="field_value"><%=user.getEmail()%></span>
			  	<input class="edit_box" type="text" name="email"></input>
			  </div>
			  <div><span class="field_title">Phone Number:</span>
			  	<span class="field_value"><%=user.getPhoneNumber()%></span>
			  	<input class="edit_box" type="text" name="phone_number"></input>
			  </div>

			  <div id="save_cancel_button_div">
			  	<input class="save_button" type="submit" value="Save Changes"/>
			  	<button class="cancel_button" type="button" onclick="cancelEditInfo()">Cancel</button>
			  </div>
			  
		  </form>

		  <div id="edit_button_div"><button class="edit_button" type="button" onclick="editUserInfo()">Edit info</button></div>	  
		</div>



		<!--The reviews tab-->
		<div id="Reviews" class="tabcontent">
		  <h2>Reviews</h2>
		  <p>Here are your reviews.</p>
		
		  <div class="review_box">
		  	<span class="review_title">Hotel/Apartment name</span>
		  	<span class="review_rating">Rating: 3/5</span>
		  	<div class="review_text">Review text... bla bla bla</div>
		  </div>

		</div>


		<!--The messages tab-->
		<div id="Messages" class="tabcontent">
		  <h2>Messages</h2>
		  <p>Here are your messages.</p>
		  
	<!--  	  <div class="contact_div">
		  		<span class="contact_name">John Papadopoulos</span>
		  		<button type="submit" name="view_conv" value="" class="view_messages_button">View Messages</button>
		  </div>
		  <div class="contact_div">
		  		<span class="contact_name">George Papadopoulos</span>
		  		<button type="submit" name="view_conv" value="" class="view_messages_button">View Messages</button>
		  </div>
		 -->
		 
		 <%
		 	List<String> convs =(List<String>) request.getAttribute("conversations");
		 	for(int i = 0; i < convs.size(); i++){
		 		%>
		 		<form action="searchConvMessages" method = "post">
			 		<div class="contact_div">
				  		<span class="contact_name"><%= convs.get(i) %></span>
				  		<button type="submit" name="view_conv" value="<%= convs.get(i) %>" class="view_messages_button">View Messages</button>
			 		 </div>
			 	</form>
		 	<% }
		 
		 	 %> 
		  
		</div>


		<!--The host tab-->
		<div id="Host" class="tabcontent">
			<h2>Host Info</h2>
			<p>Here are your info as a host.</p>
			
			<div class="host_option_div">
				<span class="host_option_title">New Listing Creation</span>
				<p>Create a new listing and set all the necessary parameters.Press the button below to continue...</p>
				
				<form action="listingCreation.jsp" method="get">
					<input class="create_button" type="submit" value="Create Listing"></input>
				</form>
			</div>
			
			 <div class="host_option_div">
				<span class="host_option_title">Listings On Map</span>
				<p>Here are the locations of all your listings on the map below:</p>
				
				<!-- Insert the map here -->
				<div id="googleMap" style="width:100%; height:500px;"></div>

			</div>
			
			<div class="host_option_div">
				<span class="host_option_title">All Listings</span>
				<p>You can view a table with all your listings by pressing the button below.In the next page you can edit the info of any of your listings by pressing the button next to it.</p>
				<form action="findYourListings" method="get">
					<input class="listings_button" type="submit" value="View All Listings"></input>
				</form>
			</div>
			
		</div>
		
		

	</div>

</body>


</html>