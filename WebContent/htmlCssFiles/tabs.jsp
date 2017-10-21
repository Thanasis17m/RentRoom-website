<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.List, entities.Coordinates" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
		
		<%List<Coordinates> coords = (List<Coordinates>) request.getAttribute("coords");
		
		int coords_num = coords.size();
		%>
		
		var arr = [];
		<%
		for(int j = 0; j < coords_num; j++){
			%>
			
			var coord = []; 
			coord.push('<%=coords.get(j).getListing_name() %>');
			coord.push(<%=coords.get(j).getLongitude() %>);
			coord.push(<%=coords.get(j).getLatitude() %>);
			arr.push(coord);
			
			<%
		}
		%>
		
		function openTab(evt, tabName) {
			
		    var i, tabcontent, tablinks;
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";/*hide the contents of all tabs*/
		    }
		    tablinks = document.getElementsByClassName("tab_button");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");/*make all tabs with an active class,inactive*/
		    }
		    document.getElementById(tabName).style.display = "block";/*display the requested tab's content*/
		    evt.currentTarget.className += " active";/*make that tab active*/
		    
		    if(tabName === 'Host'){
		    	
		    	myMap(arr);
		    }
		}


		$(document).ready(function () { /*when page loads the first tab is opened by default*/
			
			document.getElementById("defaultOpen").click();

			

		});
		
		</script>