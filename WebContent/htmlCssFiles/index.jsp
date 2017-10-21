
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="dao.ListingDAO, dao.ListingDAOImpl, dao.UserDAO, dao.UserDAOImpl,java.util.List,entities.Listing" %>
<head>
  <title>RentRoom</title>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>

   <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="index.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>

  <!--Datepicker links-->
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"></link>
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

  <!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/bannerResponsive.js"></script>	
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/datepicker.js"></script>	
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>

</head>


<body>
	
	<jsp:include page="navbar.jsp" />	

	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />

	
	
	<!--The banner of the welcome page-->
	<div class="home_banner">
		<img id="banner" src="..//Images/home_banner.png" alt="The RentRoom Logo"></img>	
	</div>
	<!--The quote under the banner-->
	<div class="quote">
		<h3><span id="highlight">Rent a Room</span> and discover the world..</h3>
	</div>
	<% if(session.getAttribute("check_in")!=null){ 
		
		session.removeAttribute("check_in");
		session.removeAttribute("check_out");
		
	}%>
	<!--The search form-->
	<form action="SearchListings">
		
		<div class="search_div">
			<div class="search_location">
				<span class="search_title">Destination</span>

				<div class="search_box">
					<input class="search_input" name="destination" value="" type="text"/>
				</div>
			</div>

			<div class="search_date" id="check_in">
				<span class="search_title">Check-in</span>
				<div class="search_box">
					<input id="departing" name="check_in" class="search_input has_calendar_icon" value="" type="text"/>
				</div>
			</div>

			<div class="search_date" id="check_out">
				<span class="search_title">Check-out</span>
				<div class="search_box">
					<input id="returning" name="check_out" class="search_input has_calendar_icon" value="" type="text"/>
				</div>
			</div>

			<div class="search_guests">
				<div class="select_adults">
					<span class="select_title">Adults</span>	
					<select name="adults">
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
				<div class="select_children">
					<span class="select_title">Children</span>
					<select name="children">
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
				<input type="hidden" name="start_row" value="0" />
				<input type="hidden" name="count" value="1" />
				<input class="search_button" type="submit" value="Search"/>
			</div>
		</div>
	</form>
	
	<%
		String username =(String) session.getAttribute("username");
		if(username != null){
			UserDAO dao = new UserDAOImpl(false);
			ListingDAO lis_dao = new ListingDAOImpl(false);
			int check_last_rec = dao.checkLastRecommendation(username);
			
			if(check_last_rec == 1){
			
				
				
				int exists = lis_dao.userReviewsExist(username);
				if(exists == 1){
					%>
				<jsp:include page="ReviewRecommendations.jsp" />	
					<%
					
				}
				else{
					%>
				<jsp:include page="SearchRecommendations.jsp" />
					<%
				}
				
				dao.insertRecommendationTime(username);
				
			}
			else{
				List<Listing> listings_to_show = lis_dao.getRecommendations(username);%>
				<div class="recommendations">
				<div class="search_title"  style="margin: 5px auto; max-width: 850px;">Recommended for you:</div>
				<%
				for(int j = 0; j < listings_to_show.size(); j++){
					String[] type = listings_to_show.get(j).getRoom_type().split("_");
			%>
			<div class="result">
				<a href="getListingDetails?listing_name=<%=listings_to_show.get(j).getName()%>"><span class="listing_title"><%=listings_to_show.get(j).getName()%></span> </a>
				<span class="listing_type"><%= type[0] %> <%= type[1] %></span>
				<img class="listing_image" src="..//Images/home_banner_small.png" alt="Listing's Image"></img><!--place this for testing "..//Images/home_banner_small.png" -->	
				<span class="listing_beds"><%=listings_to_show.get(j).getBeds_num() %> beds</span>
				<span class="listing_reviews"><%=listings_to_show.get(j).getReviews_num() %> reviews</span>
				<span class="listing_rating"><%=listings_to_show.get(j).getStars() %>/5</span>
			</div>
	<%	}%>
	</div>
	<%
				}
			}
	%>
	
	

</body>

</html>