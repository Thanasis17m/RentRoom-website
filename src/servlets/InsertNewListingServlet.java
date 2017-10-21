package servlets;

import java.io.IOException;


import java.text.ParseException;

import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListingDAO;
import dao.ListingDAOImpl;
import entities.NewListing;
import dao.UserDAO;
import dao.UserDAOImpl;

/**
 * Servlet implementation class InsertNewListing
 */
@WebServlet("/htmlCssFiles/InsertNewListing")
public class InsertNewListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/index.jsp");
		NewListing newListing = new NewListing(); 
		newListing.setListing_name(request.getParameter("listing_name")); 
		newListing.setListing_type(request.getParameter("listing_type"));
		newListing.setListing_area(request.getParameter("listing_area"));
		newListing.setBeds(Integer.parseInt(request.getParameter("beds")));
		newListing.setBedrooms(Integer.parseInt(request.getParameter("bedrooms")));
		newListing.setBathrooms(Integer.parseInt(request.getParameter("bathrooms")));
		newListing.setDescription(request.getParameter("description"));
		newListing.setSquare_feet(request.getParameter("square_feet"));
		newListing.setReviews_num(0);
		newListing.setStars(0);
		
		String date_from = request.getParameter("date_from");
		String date_to = request.getParameter("date_to");
		
		Double longitude =Double.parseDouble(request.getParameter("longitude"));
		Double latitude =Double.parseDouble(request.getParameter("latitude"));
		
		newListing.setListing_from(date_from);
		newListing.setListing_to(date_to);
		newListing.setLongitude(longitude);
		newListing.setLatitude(latitude);
	

		int heating = 0;
		int tv = 0;
		int kitchen = 0;
		int ac = 0;
		int wifi = 0;
		int free_parking = 0;
		int pets = 0;
		int events = 0;
		int smoking = 0;
		int min_stay = Integer.parseInt(request.getParameter("min_stay"));
		int total_guests_allowed = Integer.parseInt(request.getParameter("total_guests_allowed"));
		int price = Integer.parseInt(request.getParameter("listing_price"));
		
		if(request.getParameter("Heating") != null){
			heating = 1;
		}
		
		if(request.getParameter("TV") != null){
			tv = 1;
		}
		
		if(request.getParameter("Air_Conditioning") != null){
			ac = 1;
		}
		
		if(request.getParameter("Kitchen") != null){
			kitchen = 1;
		}
		
		if(request.getParameter("Free_Parking") != null){
			free_parking = 1;
		}
		
		if(request.getParameter("Pets") != null){
			pets = 1;
		}
		
		if(request.getParameter("Events") != null){
			events = 1;
		}
		
		if(request.getParameter("Smoking") != null){
			smoking = 1;
		}
		
		newListing.setHeating(heating);
		newListing.setTv(tv);
		newListing.setKitchen(kitchen);
		newListing.setAc(ac);
		newListing.setWifi(wifi);
		newListing.setFree_parking(free_parking);
		newListing.setPets(pets);
		newListing.setEvents(events);
		newListing.setSmoking(smoking);
		newListing.setMin_stay(min_stay);
		newListing.setTotal_guests_allowed(total_guests_allowed);
		newListing.setPrice(price);
		
		HttpSession session = request.getSession();
		ListingDAO dao = new ListingDAOImpl(false);
		UserDAO user_dao = new UserDAOImpl(false);
		
		String username  = session.getAttribute("username").toString();
		String host_name = user_dao.findUser(username).getName();
		dao.insertNewListing(newListing,username,host_name);
			
		try{
			dao.insertAvailability(date_from, date_to, newListing.getListing_name(),newListing.getPrice());
		}
		
		catch(ParseException p ){
			System.err.println(p.getMessage());
		}
		
		disp.forward(request, response);
	}

}
