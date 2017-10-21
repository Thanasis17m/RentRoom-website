package servlets;

import java.io.IOException;

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
import java.util.List;
import java.util.Iterator;

/**
 * Servlet implementation class SearchListingsServlet
 */
@WebServlet("/htmlCssFiles/SearchListings")
public class SearchListingsServlet extends HttpServlet {
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
	
		session.setAttribute("filters", 0);
		
		
		
		ListingDAO dao = new ListingDAOImpl(false);
		
		
		int start_row = 0;
		

	
		
		
		start_row = Integer.parseInt(request.getParameter("start_row"));
		
		
		List<Listing> listings_available = dao.searchListing(location,total_persons ,check_in, check_out,start_row);
	
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
		
		
		int count  = 0;
		
		if(request.getParameter("count") != null){
			count  = Integer.parseInt(request.getParameter("count"));
		}
		
		
		else{
			count = -1;
		}
		
		if(count != -1){
			count = dao.countSearchedListings(location,total_persons ,check_in, check_out);
			session.setAttribute("count", count);
	    }
		
		
		
		request.setAttribute("listings_available",listings_available);
		
		disp.forward(request, response);
		
	}

}
