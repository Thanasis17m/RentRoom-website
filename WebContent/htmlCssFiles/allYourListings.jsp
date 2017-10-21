<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Your Listings</title>

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


<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
    
    .edit_button {
	  width: 150px;
	  height: 50px;
	  display: inline-block;
	  background-color: #ff5733; /*button's color*/
	  border: none;
	  color: white;/*text's color*/
	  text-align: center;
	  text-decoration: none;
	  font-size: 16px;
	  margin: 4px 2px;
	  -webkit-transition-duration: 0.4s; /* Safari */
	  transition-duration: 0.2s;/*the speed of the hover effect*/
	  cursor: pointer;
	}
	
	.edit_button:hover {
	  background-color: #ff6f00;
	  color: black;
	}
       
</style>


</head>


<body>

	<jsp:include page="navbar.jsp" />

    <!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />


	<!-- We will create a table with all the slistings of thishost  user -->
	
	<!--retrieve the list from the request -->
  <% @SuppressWarnings("unchecked") //this suppresses unwanted Eclipse warnings
  	List<String> listings = (List<String>) request.getAttribute("your_listings");%>

	<% if(listings != null || listings.size()!=0){ %>

		  <div style="max-width: 900px; margin: 40px auto; background-color: #f2f2f2; padding: 15px; border: 2px solid #ff5733;">
		
			<form action="editListing" method="post">
				  <table>
				  	<tr>
				  		<th>Listing's name</th>  		
				  	</tr>
			
				  <%
				  int i=0;
				  for (String listing : listings) {	%>
					
				  		<tr>
				  			<td><%=listing%></td>
				  			<td><button type="submit" name="edit_listing" value="<%=listing%>" class="edit_button" style="width:50%; float:right;">Edit Listing</button></td>
				  		</tr>
				  		
				  <% }%>
			
				  </table>
			</form>
		  </div>
		
		
		<%} 
		
		else {%>
		
		<p> You haven't created any listings yet.</p>
		
		<% } %>
			


</body>

</html>