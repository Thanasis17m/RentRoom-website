<!--The navigation bar-->
	<div class="navbar" id="navbar">
		<a href="index.jsp" id="navbarlogo"><img src="..//Images/navbar_logo.png" alt="RentRoom Logo"/></a>
		<% 
		
		String username= (String) session.getAttribute("username");                     
                if (username == null) { %>
		<a href="#" onclick="document.getElementById('login_window').style.display='block'" class="navbutton">Log In</a> 
		<a href="signup.jsp" class="navbutton">Sign Up</a>
		<% } else { %>
		
		<a href="signout" class="navbutton">Logout</a>
				
	
		
		<% if(username!=null){
			if(username.equals("admin")){
		
		%>
			<form action='adminProfile.jsp' method='post'>
				<button type="submit" name="username" value="${sessionScope.username}" class="navbutton">${sessionScope.username}</button>
			</form>
		
		<%
		
			}
			
			else{%>
				<form action='ShowProfileDetails' method='post'>
					<button type="submit" name="username" value="${sessionScope.username}" class="navbutton">${sessionScope.username}</button>
				</form>
			<%
			}
		}  %>
		
		
		
		<%
		} %>
			
		
		<!--The Ξ button that appears on small screens-->
		<a href="#" class="navbutton icon" style="font-size:15px;" onclick="responsive_navbar()">&#9776;</a>
	</div>