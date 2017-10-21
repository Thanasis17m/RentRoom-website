package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ListingDAO;
import dao.ListingDAOImpl;
import entities.ListingProfileInfo;

/**
 * Servlet implementation class SaveChangesListingServlet
 */
@WebServlet("/htmlCssFiles/saveChangesListing")
public class SaveChangesListingServlet extends HttpServlet {
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
		ListingDAO dao = new ListingDAOImpl(false);
		
		ListingProfileInfo listing = new ListingProfileInfo();
		
		listing.setListing_name(request.getParameter("edit_listing"));
		listing.setListing_type(request.getParameter("listing_type"));
		listing.setBeds(Integer.parseInt(request.getParameter("beds")));
		listing.setBedrooms(Integer.parseInt(request.getParameter("bedrooms")));
		listing.setBathrooms(Integer.parseInt(request.getParameter("bathrooms")));
		listing.setSquare_feet(request.getParameter("listing_area"));
		listing.setDescription(request.getParameter("description"));
		listing.setMin_stay(Integer.parseInt(request.getParameter("min_stay")));
		listing.setListing_area(request.getParameter("listing_address"));
		listing.setTotal_guests_allowed(Integer.parseInt(request.getParameter("total_guests_allowed")));
		listing.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		listing.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		
		String amenities = "";
		
		if(request.getParameter("Heating")!=null){
			amenities += "heating,";
		}
		if(request.getParameter("TV")!=null){
			amenities += "tv,";
		}
		if(request.getParameter("Air_Conditioning")!=null){
			amenities += "ac,";
		}
		if(request.getParameter("Kitchen")!=null){
			amenities += "kitchen,";
		}
		if(request.getParameter("Wireless_Internet")!=null){
			amenities += "wifi,";
		}
		if(request.getParameter("Free_Parking")!=null){
			amenities += "parking,";
		}
		if(request.getParameter("Pets")!=null){
			amenities += "pets,";
		}
		if(request.getParameter("Events")!=null){
			amenities += "events,";
		}
		if(request.getParameter("Smoking")!=null){
			amenities += "smoking,";
		}
		
		listing.setAmenities(amenities);
		dao.updateListingInfo(listing);
		disp.forward(request, response);
		
	}

}
