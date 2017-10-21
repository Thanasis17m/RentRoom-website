
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="entities.NewListing" %>
<head>
  <title>Edit Listing</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>

   <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>
  <link rel="stylesheet" type="text/css" href="listingCreation.css"></link>

<!--Datepicker links-->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"></link>
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZulx8RWdPe2Ucka1HcIl0o5LRaYD0oUc"></script>

<!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>  
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/datepicker.js"></script>	
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/selectUniqueCheckbox.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/datepicker2.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZulx8RWdPe2Ucka1HcIl0o5LRaYD0oUc"></script>
<script language="javascript" type="text/javascript" src="..//JavascriptFiles/googleMapsEditListing.js"></script>
</head>

<body>

	<jsp:include page="navbar.jsp" />
	
	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />
 	
 	<%NewListing listing = (NewListing) request.getAttribute("listing_info");
 	
 	%>
 	
 	<div class="main_div">
 		
 		<script>google.maps.event.addDomListener(window, 'load', function () { initialize(<%=listing.getLatitude()%>,<%=listing.getLongitude()%>); });</script>
 		
 	
 		<form action="saveChangesListing" method="post">
 	
 			<span class="div_title">Edit Listing</span>
 			
 			
 			<span class="field_title">Listing's Name:</span>
 			<span><%= listing.getListing_name() %></span>
 	
 	
 			<span class="field_title">Listing's Type:</span>
			<div class="type_div">
				<%if(listing.getListing_type().equals("private_room")) {%>
					<input type="radio" name="listing_type" id="radio1" class="radio" value="private_room" checked="checked"/>
				<%} 
				else {%>
					<input type="radio" name="listing_type" id="radio1" class="radio" value="private_room" />
				<%} %>
				<label class="type_name" for="radio1">Private Room</label>
			</div>
			
			
			<div class="type_div">
				<%if(listing.getListing_type().equals("shared_room")) {%>
					<input type="radio" name="listing_type" id="radio2" class="radio" value="shared_room" checked="checked"/>
				<%}
				else {%>
					<input type="radio" name="listing_type" id="radio2" class="radio" value="shared_room" />
				<%} %>
				<label class="type_name" for="radio2">Shared Room</label>
			</div>
			
			
			<div class="type_div">
				<%if(listing.getListing_type().equals("entire_home")) {%>
					<input type="radio" name="listing_type" id="radio3" class="radio" value="entire_home" checked="checked"/>
				<%}
				else {%>
					<input type="radio" name="listing_type" id="radio3" class="radio" value="entire_home"/>
				<%} %>
				<label class="type_name" for="radio3">Entire Home</label>
			</div>
			<div style="clear:both;"></div>
 	
 			<div class="rooms_and_beds">
	 			<span class="field_title" style="margin-bottom: 5px;">Beds:</span>
	 			<select class="select_div" name="beds">
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
	 			</select>
 			</div>
 			
 			<div class="rooms_and_beds">
	 			<span class="field_title" style="margin-bottom: 5px;">Bedrooms:</span>
	 			<select class="select_div" name="bedrooms">
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
	 			</select>
 			</div>
 			
 			<div class="rooms_and_beds">
	 			<span class="field_title" style="margin-bottom: 5px;">Bathrooms:</span>
	 			<select class="select_div" name="bathrooms">
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
	 			</select>
 			</div>
 			
 			
 			<span class="field_title">Listing's Area(in square meters):</span>
 			<input class="field_input" style="width:50%" type="text" name="listing_area" value="<%= listing.getSquare_feet()%>"/> 
 			
 			
 			<span class="field title">Location On Map:</span>
 			<div id="googleMap" style="width:100%;height:400px;"></div>
 			
 			<input type="hidden" name="longitude" id="long" value="" />
 			<input type="hidden" name="latitude" id="lat" value="" />
 			
 			<span class="field_title">Description:</span>
 			<textarea class="textarea" rows="5" name="description">
 			<%= listing.getDescription() %>
 			</textarea>
 	
 			<span class="field_title">Amenities/Facilities:</span>
 			<div style="display: inline-block;">
 			<%if (listing.getHeating() == 1){ %>
			    <input type="checkbox" id="c1" name="Heating" checked="checked" value="heating"/>
			<%}
 			else{%>
 				<input type="checkbox" id="c1" name="Heating" value="heating"/>
 			<%} %>
			    <label for="c1" class="filter_name">Heating</label>
		    </div>
		    <span class="options_space"></span>
 		
 			<div style="display: inline-block;">
 			<%if (listing.getTv() == 1){ %>
			    <input type="checkbox" id="c2" name="TV" checked="checked" value="TV"/>
			<%}
 			else{%>
 				<input type="checkbox" id="c2" name="TV" checked="checked" value="TV"/>
 			<%} %>
			    <label for="c2" class="filter_name">TV</label>
			</div>
			<span class="options_space"></span>

			<div style="display: inline-block;">
			<%if (listing.getAc() == 1){ %>
			    <input type="checkbox" id="c3" name="Air_Conditioning" checked="checked" value="air_condtion"/>
			<%}else{ %>
				<input type="checkbox" id="c3" name="Air_Conditioning" value="air_condition"/>
			<%} %>
			    <label for="c3" class="filter_name">Air conditioning</label>
			</div>
			<span class="options_space"></span>
			
			<div style="display: inline-block;">
			<%if (listing.getKitchen() == 1){ %>
			    <input type="checkbox" id="c4" name="Kitchen" checked="checked" value="kitchen"/>
			 <%}else{ %>
			 	<input type="checkbox" id="c4" name="Kitchen" value="kitchen"/>
			 <%} %>
			    <label for="c4" class="filter_name">Kitchen</label>
			</div>
			<span class="options_space"></span>

			<div style="display: inline-block;">
			<%if (listing.getWifi() == 1){ %>
			    <input type="checkbox" id="c5" name="Wireless_Internet" checked="checked" value="wifi"/>
			<%}else{ %>
				<input type="checkbox" id="c5" name="Wireless_Internet" value="wifi"/>
			<%} %>
			    <label for="c5" class="filter_name">Wireless Internet</label>
			</div>
			<span class="options_space"></span>

			<div style="display: inline-block;">
			<%if (listing.getFree_parking() == 1){ %>
			    <input type="checkbox" id="c6" name="Free_Parking" checked="checked" value="parking"/>
			<%}else{ %>
				<input type="checkbox" id="c6" name="Free_Parking" value="parking"/>
			<%} %>
			    <label for="c6" class="filter_name">Free parking on premises</label>
			</div>
			<span class="options_space"></span>
			
			
			<span class="field_title">House Rules:</span>
		    <div style="display: inline-block;">
		    <%if (listing.getPets() == 1){ %>
			    <input type="checkbox" id="c7" name="Pets" checked="checked" value="pets"/>
			<%}else{ %>
				<input type="checkbox" id="c7" name="Pets" value="pets"/>
			<%} %>
			    <label for="c7" class="filter_name">Pets allowed</label>
			</div>
			<span class="options_space"></span>

			<div style="display: inline-block;">
			<%if (listing.getEvents() == 1){ %>
			    <input type="checkbox" id="c8" name="Events" checked="checked" value="events"/>
			<%}else{ %>
				<input type="checkbox" id="c8" name="Events" value="events"/>
			<%} %>
			    <label for="c8" class="filter_name">Suitable for events</label>
			</div>
			<span class="options_space"></span>

			<div style="display: inline-block;">
			<%if (listing.getSmoking() == 1){ %>
			    <input type="checkbox" id="c9" name="Smoking" checked="checked" value="smoking"/>
			<%}else{ %>
				<input type="checkbox" id="c9" name="Smoking" value="smoking"/>
			<%} %>
			    <label for="c9" class="filter_name">Smoking allowed</label>
			</div>
			<span class="options_space"></span>
	
			<div></div><!-- We place this block here so that the next inline-blocks will not align with the previous ones on the same line -->
	
			<span class="field_title" style="display: inline-block;">Minimum Stay(In days):</span>		
 			<select class="select_div" name="min_stay" style="display: inline-block;">
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
 			</select>
 	
 			
 			<span class="field_title">Address:</span>
 			<input class="field_input" type="text" name="listing_address" value="<%=listing.getListing_area()%>"/>
 	
 			<span class="field_title">Upload images(optional)</span>
			<!--accept="image/*" is equal to accept="image/gif, image/jpeg, image/png" and accepts only image files-->
			<input type="file" name="image1" id="image1" accept="image/*" style="display:block; margin-bottom:4px;"/>
 			<input type="file" name="image2" id="image2" accept="image/*" style="display:block; margin-bottom:4px;"/>
 			<input type="file" name="image3" id="image3" accept="image/*" style="display:block; margin-bottom:4px;"/>
 	
 			
 			<span class="field_title">Guests(Adults and Children in total):</span>
 			<select class="select_div" name="total_guests_allowed" style="display: inline-block;">
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
 			</select>
 	
 			<div style="overflow: hidden; margin: 12px 0px;"><button type="submit" name="edit_listing" value="<%=listing.getListing_name()%>" class="create_button" >Edit Listing</button></div>
 		</form>
 	
 		<form method="post" action="updatePrice">		
 			<span class="field_title">Availability(from):</span>
 			<input id="departing" class="field_input has_calendar_icon" type="text" name="date_from"/>
 			
 			<span class="field_title">Availability(to):</span>
 			<input id="returning" class="field_input has_calendar_icon" type="text" name="date_to"/>
 			
 			<span class="field_title">Price(per night):</span>
 			<input class="field_input" type="text" name="listing_price"/>
 			
 			
 			<%  
 			String listing_name = listing.getListing_name();%>
 			<div style="overflow: hidden; margin: 12px 0px;"><button type="submit" name="price_update" value="<%=listing_name%>" class="create_button" style="width:100%">Edit Price</button></div>
 		</form>
 		
 		<form method="post" action="updateAvailability">
 			<span class="field_title">Availability(from):</span>
 			<input id="departing2" class="field_input has_calendar_icon" type="text" name="date_from"/>
 			
 			<span class="field_title">Availability(to):</span>
 			<input id="returning2" class="field_input has_calendar_icon" type="text" name="date_to"/>
 			
 			<input type="checkbox" id="c10" name="availability" checked="checked" value="open"/>
 			 <label for="c3" class="filter_name">Open Availability</label>
 			<input type="checkbox" id="c11" name="availability" value = "close"/>
 			 <label for="c3" class="filter_name">Close Availability</label>
 			
 			<div style="overflow: hidden; margin: 12px 0px;"><button type="submit" name="availability_update" value="<%=listing_name%>" class="create_button" style="width:100%">Edit Availability</button></div>
 		</form>
 		
 	</div>
 
 
 
 </body>

</html>