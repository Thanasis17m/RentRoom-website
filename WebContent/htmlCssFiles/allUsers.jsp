<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="entities.User, java.util.List" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>All Users</title>

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
</style>


</head>


<body>

  <jsp:include page="navbar.jsp" />

  <!--The modal login window that appears when login button is pressed-->
  <jsp:include page="login_window.jsp" />


  <!--We Create a table with all the users-->

<!--retrieve the list from the request -->
  <% @SuppressWarnings("unchecked")
  List<User> users = (List<User>) request.getAttribute("users_list");%>

  <div style="max-width: 1000px; margin: 40px auto; background-color: #f2f2f2; padding: 15px; border: 2px solid #ff5733;">

	  <table>
	  	<tr>
	  		<th>Username</th>
	  		<th>Password</th>
	  		<th>Name</th>
	  		<th>Surname</th>
	  		<th>Email</th>
	  		<th>Phone Number</th>
	  		<th>isHost</th>
	  		<th>image url</th>
	  		<th>isVerified</th>
	  	</tr>

	  <%
	  for (User user : users) {	%>

	  		<tr>
	  			<td><%=user.getUsername()%></td>
	  			<td><%=user.getPassword()%></td>
	  			<td><%=user.getName()%></td>
	  			<td><%=user.getSurname()%></td>
	  			<td><%=user.getEmail()%></td>
	  			<td><%=user.getPhoneNumber()%></td>
	  			<td><%=user.isHost()%></td>
	  			<td><%=user.getImage_url()%></td>
	  			<td><%=user.isVerified()%></td>
	  		</tr>
	  <%	  		
	  }
	  %>

	  </table>

  </div>


</body>

</html>