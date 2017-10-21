package servlets;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListingDAO;
import dao.ListingDAOImpl;
import entities.Listing;


/**
 * Servlet implementation class SearchListingsWithFiltersServlet
 */
@WebServlet("/htmlCssFiles/SearchListingsWithFilters")
public class SearchListingsWithFiltersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/searchResults.jsp");
			
		HttpSession session=request.getSession();  
		
		int adults;
		int children;
		int total_persons;
		String location = new String();
		String check_in = new String();
		String check_out = new String();
		if(request.getParameter("check_in") != null){
			adults = Integer.parseInt(request.getParameter("adults"));
			children = Integer.parseInt(request.getParameter("children"));
			
			total_persons = adults + children;
			
			check_in = request.getParameter("check_in");
			check_out = request.getParameter("check_out");
			
			location = request.getParameter("destination");
		
	    session.setAttribute("check_in",request.getParameter("check_in"));
	    session.setAttribute("check_out",request.getParameter("check_out"));
	    
	    session.setAttribute("persons",total_persons);
	    session.setAttribute("destination", location);
	    }
	    
	    
	    else{
	    	total_persons =(int) session.getAttribute("persons");
	    	check_in = (String) session.getAttribute("check_in");
	    	check_out = (String) session.getAttribute("check_out");
	    	location = (String) session.getAttribute("destination");
	    }
	
		session.setAttribute("filters", 1);
		
		
		int count  = 0;
		
		if(request.getParameter("count") != null){
			count  = Integer.parseInt(request.getParameter("count"));
			
			if(session.getAttribute("listing_type") != null){
				session.removeAttribute("listing_type");
			}
			if(session.getAttribute("max_price") != null){
				session.removeAttribute("max_price");
			}
			if(session.getAttribute("heating") != null){
				session.removeAttribute("heating");
			}
			if(session.getAttribute("tv") != null){
				session.removeAttribute("tv");
			}
			if(session.getAttribute("ac") != null){
				session.removeAttribute("ac");
			}
			if(session.getAttribute("kitchen") != null){
				session.removeAttribute("kithcen");
			}
			if(session.getAttribute("wifi") != null){
				session.removeAttribute("wifi");
			}
			if(session.getAttribute("elevator") != null){
				session.removeAttribute("elevator");
			}
			if(session.getAttribute("parking") != null){
				session.removeAttribute("parking");
			}
		}
		
		
		else{
			count = -1;
		}
	    
			
			
			ListingDAO dao = new ListingDAOImpl(false);
			
			
				
			int heating = 0;
			int tv = 0;
			int ac = 0;
			int kitchen = 0 ;
			int wifi = 0;
			int elevator = 0;
			int parking = 0 ;
			int max_price=0;
			String room_type="";
			
			if(request.getParameter("listing_type") != null){
				
				if(request.getParameter("listing_type").equals("private_room")){
					room_type = "private_room";
					
				}
				else if(request.getParameter("listing_type").equals("shared_room")){
					room_type = "shared_room";
				}
				else if(request.getParameter("listing_type").equals("entire_home")){
					room_type = "entire_home";
				}
				session.setAttribute("listing_type", room_type);
			}
			
			else if(session.getAttribute("listing_type") != null){
				room_type =(String) session.getAttribute("listing_type");
			}
			
			
			if(request.getParameter("price") != null){
				if(!request.getParameter("price").equals("") && count!=-1){
					max_price = Integer.parseInt(request.getParameter("price"));
					session.setAttribute("max_price", max_price);
				}
			}
			
			else if(count == -1 && session.getAttribute("max_price") != null){
				max_price  = (int) session.getAttribute("max_price");
			}
			
			
			
			if(request.getParameterValues("heating") != null && count != -1){
				heating = 1;
				session.setAttribute("heating", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("heating") != null){
				heating  = (int) session.getAttribute("heating");
			}
			
			
			if(request.getParameterValues("tv") != null && count != -1){
				tv = 1;
				session.setAttribute("tv", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("tv") != null){
				tv  = (int) session.getAttribute("tv");
			}
			
			if(request.getParameterValues("ac") != null && count != -1){
				ac = 1;
				session.setAttribute("ac", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("ac") != null){
				ac  = (int) session.getAttribute("ac");
			}
			
			if(request.getParameterValues("kitchen") != null && count != -1){
				kitchen = 1;
				session.setAttribute("kitchen", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("kitchen") != null){
				kitchen  = (int) session.getAttribute("kitchen");
			}
			
			if(request.getParameterValues("wifi") != null && count != -1){
				wifi = 1;
				session.setAttribute("wifi", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("wifi") != null){
				wifi  = (int) session.getAttribute("wifi");
			}
			
			if(request.getParameterValues("elevator") != null && count != -1){
				elevator = 1;
				session.setAttribute("elevator", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("elevator") != null){
				elevator  = (int) session.getAttribute("elevator");
			}
			
			if(request.getParameterValues("parking") != null && count != -1){
				parking = 1;
				session.setAttribute("parking", 1);
				
			}
			
			else if(count == -1 && session.getAttribute("parking") != null){
				parking  = (int) session.getAttribute("parking");
			}
			
			
			
			int start_row = 0 ;
			
			
			start_row = Integer.parseInt(request.getParameter("start_row"));
			
			
			
			List<Listing> listings_available = dao.searchFilteredListings(location,total_persons ,check_in, check_out,room_type,max_price, wifi,ac,kitchen,elevator,parking,tv, heating,start_row);
			
			String price = "0";
			for(Listing listing : listings_available){
				price = dao.searchPrice(listing.getName(), check_in, check_out);
				listing.setPrice(price);
			}
			
			for (Iterator<Listing> iter = listings_available.listIterator(); iter.hasNext(); ) {
				Listing listing = iter.next();
				if(dao.checkIfDatesExist(listing.getName(), check_in, check_out) == 0){
					iter.remove();
				}
			}
			
			
			
			
			if(count != -1){
				count = dao.countSearchedListingsWithFilters(location,total_persons ,check_in, check_out,room_type,max_price, wifi,ac,kitchen,elevator,parking,tv, heating);
				session.setAttribute("count", count);
		    }
			
			request.setAttribute("listings_available",listings_available);
		
			
			
			
		
	
		disp.forward(request, response);
	}

}
