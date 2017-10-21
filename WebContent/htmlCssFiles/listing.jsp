
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
 <%@ page import="entities.ListingProfileInfo, entities.User, entities.Review, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Listing page</title>
	<meta name="description" content="RentRoom"/>
	<meta name="keywords" content="Rent,room,everywhere"/>
	
	<!--Jquery library-->
	<script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"></link>
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/datepicker.js"></script>
	
	<!--CSS files links-->
	<link rel="stylesheet" type="text/css" href="basic.css"></link>
	<link rel="stylesheet" type="text/css" href="navbar.css"></link>
	<link rel="stylesheet" type="text/css" href="loginModal.css"></link>
	<link rel="stylesheet" type="text/css" href="listing.css"></link>
	
	<!-- Sideshow photos link -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></link>

	<!--Javascript files links-->
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>  
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/slideshowPhotos.js"></script>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZulx8RWdPe2Ucka1HcIl0o5LRaYD0oUc"></script>
	
	<script language="javascript" type="text/javascript" src="..//JavascriptFiles/googleMapsListingProfile.js"></script>
	
	

</head>
<body>

	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	<div class="listing_div">
		
		<% ListingProfileInfo listing = (ListingProfileInfo) request.getAttribute("listing_details"); 
			@SuppressWarnings("unchecked")
			List<Review> reviews = (List<Review>) request.getAttribute("listing_reviews");
			User host = (User) request.getAttribute("host_info");
			String[] amenities = listing.getAmenities().split(",");
			String[] type = listing.getListing_type().split("_");
			%>
		
		<script>google.maps.event.addDomListener(window, 'load', function () { myMap(<%=listing.getLatitude()%>,<%=listing.getLongitude()%>); });</script>
		
		<h1><%= listing.getListing_name() %></h1>
		
		<div class="listing_info">
			<span class="info_title">Listing Type:</span>
		  	<span class="info_value"><%= type[0] %> <%= type[1] %></span>
		</div>
		
		<div class="listing_info" style="display:inline-block;">
			<span class="info_title">Bedrooms:</span>
		  	<span class="info_value"><%= listing.getBedrooms() %></span>
		</div>
		
		<div class="listing_info" style="display:inline-block;">
			<span class="info_title">Bathrooms:</span>
		  	<span class="info_value"><%= listing.getBathrooms() %></span>
		</div>
		
		<div class="listing_info" style="display:inline-block;">
			<span class="info_title">Beds:</span>
		  	<span class="info_value"><%= listing.getBeds() %></span>
		</div>
	
		
		<div class="listing_info">
			<span class="info_title">Area(in square feet):</span>
		  	<span class="info_value"><%= listing.getSquare_feet() %></span>
		</div>
	
	
		<div class="listing_info">
			<span class="info_title">Description:</span>
			<p><%= listing.getDescription() %></p>
		</div>
	
		<div class="listing_info" style="display:inline-block;">
			<span class="info_title">Amenities/Facilities/House Rules:</span>
			
			<% for (String s : amenities){%>
				<span class="info_value" style="margin:6px;"><%= s %></span>
				
		<% 	}
			
			%>
			
			
		</div>
		
		<!-- <div class="listing_info" style="display:inline-block;">
			<span class="info_title">House Rules:</span>
			<span class="info_value" style="margin:6px;">Smoking Allowed</span>
			<span class="info_value" style="margin:6px;">Pets Allowed</span>
		</div> -->
	
		<div class="listing_info" style="display:inline-block;">
			<span class="info_title">Minimum Stay:</span>
			<span class="info_value"><%= listing.getMin_stay() %></span>
		</div>
		
		<div class="listing_info">
			<span class="info_title">Location On Map:</span>
			<!-- Make the map appear with javascript -->
			<div id="googleMap" style="width:100%;height:400px;"></div>
			<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZulx8RWdPe2Ucka1HcIl0o5LRaYD0oUc&callback=myMap"></script> -->
			
		</div>
		
		<div class="listing_info">
			<span class="info_title">Photos:</span>
			<p>The listing's photos will be shown here.</p>
			
			<div class="w3-content w3-display-container">
			  <img class="mySlides" src="..//Images/home_banner.png" style="width:100%"></img>
			  <img class="mySlides" src="..//Images/avatar_img.png" style="width:100%;display:none;max-height:500px;"></img>
			  <img class="mySlides" src="..//Images/home_banner_small.png" style="width:100%;display:none;max-height:500px;"></img>
			
			  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
			  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
			</div>
			
			
		</div>
		<%
			session.setAttribute("host_name",host.getUsername());
			String username =(String) session.getAttribute("username");
			
		%>
		<div class="listing_info">
			<form action="contactHost.jsp" method="post">
				<span class="info_title">Host's Info:</span>
				<div><span class="info_title">Name:</span>
					<span class="info_value"><%= host.getName() %></span>
				</div>
				<div><span class="info_title">Surname:</span>
					<span class="info_value"><%= host.getSurname() %></span>
				</div>
				<div><span class="info_title">Email:</span>
					<span class="info_value"><%= host.getEmail() %></span>
				</div>
				<div><span class="info_title">Phone Number:</span>
					<span class="info_value"><%= host.getPhoneNumber() %></span>
				</div>
				<!-- This button will initiate a conversation with the host in another page -->
				<%if(username != null){ %>
					<div style="overflow: hidden;"><button class="contact_button" name = "host_username" type="submit" value="<%=host.getUsername() %>">Contact Host</button></div>
				<%} %>
			</form>
		</div>
		
		
		
		<div class="listing_info">
			<%if(username != null){ %>
				<span class="info_title">Make a Booking:</span>
			<%} 
			else{%>
				<span class="info_title">Login to make a booking:</span>
			<% }%>
			<%if(username != null && session.getAttribute("check_in")!=null){ %>
			<form action="insertNewBooking" method="post">
			
				<div class="search_arrival">
					<div class="search_title">Check-in</div>
					<input name="departing" class="search_input " value="<%=session.getAttribute("check_in") %>" type="text" readonly="readonly"></input>
				</div>
	
				<div class="search_departure">
					<div class="search_title">Check-out</div>
					<input name="returning" class="search_input" value="<%=session.getAttribute("check_out") %>" type="text" readonly="readonly"></input>
				</div>  
				
				
	
				<div class="search_adults">
					<div class="search_title" style="margin-bottom:12px;">Guests</div>
					<span><%=session.getAttribute("persons") %></span>
				</div>
				
					<button type="submit" name="book_now" value="<%= listing.getListing_name() %>" class="book_button" >Book Now</button>
				
			</form>
			<%} 
			
			else{%>		
				<form action="searchAndBook" method="post">
			
				<div class="search_arrival">
					<div class="search_title">Check-in</div>
					<input id="departing" name="departing" class="search_input has_calendar_icon" type="text" ></input>
				</div>
	
				<div class="search_departure">
					<div class="search_title">Check-out</div>
					<input id="returning" name="returning" class="search_input has_calendar_icon"  type="text" ></input>
				</div>  
				
				
	
				<div class="search_adults">
					<div class="search_title" style="margin-bottom:12px;">Guests</div>
					<select name="guests">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
					</select>
				</div>
				
					<button type="submit" name="book_now" value="<%= listing.getListing_name() %>" class="book_button" >Book Now</button>
				
			</form>
			<%} %>
		</div>
		
		<%if(username != null){ %>
		<div class="listing_info">
			<span class="info_title">Write a review:</span>
			<form action="insertReview">
				<textarea rows="5" style="width: 100%" name="review"></textarea>
				<div style="margin: 10px 0px;"></div> <!-- We add some space between the textarea and the rating -->
				<span class="info_title">Rate this listing:</span>
				<select class="select_rating" name="rating">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				
				<button type="submit" name="submit_review" value="<%= listing.getListing_name() %>" class="book_button" style="width: 130px">Submit Review</button>
				
				
				<div style="margin:10px 0px;"></div><!-- We add some space between the rating and the line beneath -->
			</form>
		</div>
		<%}
		
		else{%>
		<div class="listing_info">
			<span class="info_title">Login to write review</span>
		</div>
		<%} %>
	
		
		
		<div class="listing_info">
			<span class="info_title">Reviews:</span>
			<p>Reviews about this host will appear here.</p>
			
			
			<%for (Review review : reviews){%>
				
				<div class="review_div">
					<span class="reviewer"><%=review.getReviewer_name()%></span>
					<span class="rating"><%=review.getRating()%>/5</span>
					<span class="review"><%=review.getReview()%></span>
				</div>
				
				
				
			<% }%>
			
			
			
			
			
		</div>
	
	
	</div>

	

</body>
</html>