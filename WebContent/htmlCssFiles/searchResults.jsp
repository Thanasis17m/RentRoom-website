<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="entities.Listing, java.util.List, entities.Review" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page import="javax.servlet.http.HttpSession" %>

<head>
  <title>Search Results</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>

   <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>
  <link rel="stylesheet" type="text/css" href="searchResults.css"></link>

   <!--Datepicker links-->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"></link>
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

  <!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>	
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/datepicker.js"></script>	
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/priceSlider.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/dropdownFilters.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/plusAndMinusButtons.js"></script>

 </head>


<body>

	<!--The navigation bar-->
	<jsp:include page="navbar.jsp" />

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	

	<!--retrieve the list of available listings from the request -->
	  <% @SuppressWarnings("unchecked") //this suppresses unwanted Eclipse warnings
	  List<Listing> listings = (List<Listing>) request.getAttribute("listings_available");%>


	<!-- The div with the input fields for further searching -->
	<div class="search_bar">
		
		<form action="SearchListingsWithFilters">
		
		

			<div class="search_destination">
				<div class="search_title">Destination</div>
				<input class="search_input" name="destination" value="${sessionScope.destination }" type="text"></input>
			</div>

			<div class="search_arrival">
				<div class="search_title">Check-in</div>
				<%if(session.getAttribute("check_in") == null){ %>
				<input id="departing" class="search_input has_calendar_icon" name="check_in" value="" type="text"></input>
			<%} 
			else {%>
				<input id="departing" class="search_input has_calendar_icon" name="check_in" value="${sessionScope.check_in}" type="text"></input>
				
				<%} %>
			</div>

			<div class="search_departure">
				<div class="search_title">Check-out</div>
				<%if(session.getAttribute("check_out") == null){ %>
				
				<input id="returning" class="search_input has_calendar_icon" name="check_out" value="" type="text"></input>
			<%}
			else{%>
				<input id="returning" class="search_input has_calendar_icon" name="check_out" value="${sessionScope.check_out}" type="text"></input>
			<%} %>
			</div>

			<div class="search_adults">
				<div class="search_title">Adults</div>
				<select class="select_guests" name="adults">
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

			<div class="search_children">
				<div class="search_title">Children</div>
				<select class="select_guests" name="children">
					<option value="0">0</option>
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
				</select>
			</div>


			<!--<div class="search_price">
				<span class="search_title">Price range:</span>
				<input type="text" name="price" id="price_values"></input>
				<div id="slider_range"></div>
			</div> -->
			
			
			
	
			<div class="search_more_filters">
				<!--We return false when the button is clicked,so that the page doesn't refresh due to the form tag.-->
				<button onclick="dropdownFilters();return false;" class="dropbutton">More Filters</button>			
			</div>
			
			<div id="dropdown_div" class="dropdown_filters">
				
				<!--The Rooms and Beds filters-->
				<!--<div class="search_title" style="margin-bottom:7px;">Rooms and Beds</div>

				<div style="display:inline-block;">
					<span class="filter_name">Bedrooms</span>
					<input type='button' value='-' class='qtyminus' field='quantity_bedrooms'></input>
				    <input type='text' name='quantity_bedrooms' value='1' class='qty' id="bedrooms_input"></input>
				    <input type='button' value='+' class='qtyplus' field='quantity_bedrooms'></input>
			    </div>

			    <span style="display:inline-block; margin: 0px 10px;"></span><!--We create some space between the filters-->

			    <!--<div style="display:inline-block;">
				    <span class="filter_name">Beds</span>
					<input type='button' value='-' class='qtyminus' field='quantity_beds'></input>
				    <input type='text' name='quantity_beds' value='1' class='qty'></input>
				    <input type='button' value='+' class='qtyplus' field='quantity_beds'></input>
				</div>

			    <span style="display:inline-block; margin: 0px 10px;"></span><!--We create some space between the filters-->

			    <!--<div style="display:inline-block;">
				    <span class="filter_name">Rooms</span>
					<input type='button' value='-' class='qtyminus' field='quantity_rooms'></input>
				    <input type='text' name='quantity_rooms' value='1' class='qty'></input>
				    <input type='button' value='+' class='qtyplus' field='quantity_rooms'></input>
			    </div> -->
				
				<div class="search_price" style="margin: 0px;">
					<span class="search_title">Price range(maximum fee per night):</span>
					<input class="search_input" type="text" name="price"></input>
				</div>
				
				<div></div><!-- Place an empty div so that they divs around it will not be horizontal -->
				
				<span class="search_title">Listing's Type:</span>
				<div class="type_div">
					<input type="radio" name="listing_type" id="radio1" class="radio" value="private_room"/>
					<label class="type_name" for="radio1">Private Room</label>
				</div>
				<div class="type_div">
					<input type="radio" name="listing_type" id="radio2" class="radio" value="shared_room"/>
					<label class="type_name" for="radio2">Shared Room</label>
				</div>
				<div class="type_div">
					<input type="radio" name="listing_type" id="radio3" class="radio" value="entire_home"/>
					<label class="type_name" for="radio3">Entire Home</label>
				</div>
				<div style="clear:both;"></div>
					
				
				
				

			    <!--The Amenities filters-->
			    <div class="search_title" style="margin-bottom:7px;margin-top:10px;">Amenities/Facilities</div>

			    <div class="checkbox_div">
				    <input type="checkbox" id="c1" name="heating" value="heating" />
				    <label for="c1" class="filter_name">Heating</label>
			    </div>
			    <span style="display:inline-block; margin: 0px 10px;"></span>

			    <div class="checkbox_div">
				    <input type="checkbox" id="c2" name="tv" value="tv" />
				    <label for="c2" class="filter_name">TV</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>

				<div class="checkbox_div">
				    <input type="checkbox" id="c3" name="ac" value="ac"/>
				    <label for="c3" class="filter_name">Air conditioning</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>

				

				<div class="checkbox_div">
				    <input type="checkbox" id="c11" name="kitchen" value = "kitchen" />
				    <label for="c11" class="filter_name">Kitchen</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>

				<div class="checkbox_div">
				    <input type="checkbox" id="c12" name="wifi" value="wifi" />
				    <label for="c12" class="filter_name">Wireless Internet</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>

				

			    <div class="checkbox_div">
				    <input type="checkbox" id="c20" name="elevator" value="elevator" />
				    <label for="c20" class="filter_name">Elevator</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>

				

				<div class="checkbox_div">
				    <input type="checkbox" id="c23" name="parking" value="free_parking" />
				    <label for="c23" class="filter_name">Free parking on premises</label>
				</div>
				<span style="display:inline-block; margin: 0px 10px;"></span>


			</div>
			<input type="hidden" name="start_row" value="0" />
			<input type="hidden" name="count" value="1" />
			<input class="search_button" type="submit" value="Search"/>

			
		</form>

		<div style="clear:both;"></div>	

	</div><!-- end of search_bar -->

	
	<% if(listings != null){ 
		%>
		<div class="search_results"><!-- Search results div -->
		
			<span class="div_title">Search Results:</span>		
		
			<%

			  for (Listing listing: listings) {	
				  String[] type = listing.getRoom_type().split("_");
				  int price = (int) Double.parseDouble(listing.getPrice());
			  %>
		
		
		
				<div class="result">
					<a href="getListingDetails?listing_name=<%=listing.getName()%>">	<span class="listing_title"><%=listing.getName()%></span> </a>
					<span class="listing_type"><%= type[0] %> <%= type[1] %></span>
					<span class="listing_price"><%=price %> euros (per night)</span>
					<img class="listing_image" src="..//Images/home_banner_small.png" alt="Listing's Image"></img><!--place this for testing "..//Images/home_banner_small.png" -->	
					<span class="listing_beds"><%=listing.getBeds_num() %> beds</span>
					<span class="listing_reviews"><%=listing.getReviews_num() %> reviews</span>
					<span class="listing_rating"><%=listing.getStars() %>/5</span>
				</div>
				
				<!--<div class="result">
					<span class="listing_title">Listing Name 2</span>
					<span class="listing_type">Private Room</span>
					<span class="listing_price">100 euros</span>
					<img class="listing_image" src="..//Images/home_banner_small.png" alt="Listing's Image"></img>
					<span class="listing_beds">4 Beds</span>
					<span class="listing_reviews">22 Reviews</span>
					<span class="listing_rating">4/5</span>
				</div> -->
			
			<%}%>
		
		<%int count =(int) session.getAttribute("count"); 
		int pages = count / 10;
		if(count % 10 != 0){
			pages++;
		}
		%>
		
			<div class="pagination">
			  
			  
			  <%for(int j = 0; j < pages; j++){
				  String href_str = new String();
				  int filters = 0;
				  if(session.getAttribute("filters") != null){
					  filters = (int) session.getAttribute("filters");
				  }
				  if(filters == 1){
					  href_str = "SearchListingsWithFilters";
					  
				  }
				  else{
					  href_str = "SearchListings";
					  
				  }
				  int start_row = j*10;
				 
				  href_str+="?start_row=";
				  href_str+=start_row;
				  %>
			   <a href="<%=href_str %>"><%=j+1%></a>
			  
			  <%} %>
			  
			  
			  
			</div>
		
		</div>
	<%}
	else{%>
		
		<div class="search_results">
			<span class="search_title">No results were found. Please search again with other parameters.</span>
		</div>
		
	<%}
	%>

</body>

</html>