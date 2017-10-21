<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "entities.SentMessage, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="RentRoom"/>
  <meta name="keywords" content="Rent,room,everywhere"/>
  <title>Messages</title>
  
   <!--Jquery library-->
  <script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!--CSS files links-->
  <link rel="stylesheet" type="text/css" href="basic.css"></link>
  <link rel="stylesheet" type="text/css" href="navbar.css"></link>
  <link rel="stylesheet" type="text/css" href="conversation.css"></link>
  <link rel="stylesheet" type="text/css" href="loginModal.css"></link>

  <!--Javascript files links-->
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/navbarResponsive.js"></script>  
  <script language="javascript" type="text/javascript" src="..//JavascriptFiles/closeModalLogin.js"></script>
	
</head>
<body>
	<%List<SentMessage> messages =(List<SentMessage>) request.getAttribute("conv_messages"); 
	String username =(String) session.getAttribute("username");%>
  	<jsp:include page="navbar.jsp" />

  	<!--The modal login window that appears when login button is pressed-->
	<jsp:include page="login_window.jsp" />
	
	<div class="main_div">
	
		<div class="conv_title"><!-- The names of the users of this conversation -->
			<div class="conv_name" style="float: left">You</div>
			<div class="conv_name" style="float: right"><%= session.getAttribute("host_name") %></div>
		</div>
		<div class="conversation"><!-- The messages of the conversation -->
			
			
			<%
			session.setAttribute("username", username);
			//session.setAttribute("host_name", request.getAttribute("other"));
			
			for(SentMessage message : messages){ 
				String class_name = "";
				if(message.getSenderUsername().equals(username)){
					class_name = "my_message";
				}
				else{
					class_name = "other_message";
				}
			%>
				<div class='<%=class_name %>'><%=message.getMessage()  %></div>
				
			<%} %>
			
			
			<%
			
				
			%>
			
			
		</div>
		<div class="write_msg"><!-- The text area where you van write a new message -->
			<div class="write_msg_title">Write a message:</div>
			<form action="insertMessageAndShowConv" method="post">
				<textarea name="message" class="textarea_msg" rows="4"></textarea>
				<input class="send_button" type="submit" value="Send"></input>
			</form>
		</div>
	
	
	
	
	
	</div>





</body>
</html>