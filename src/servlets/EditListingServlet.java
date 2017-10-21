package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

import dao.ListingDAO;
import dao.ListingDAOImpl;

import entities.NewListing;

/**
 * Servlet implementation class EditListingServlet
 */
@WebServlet("/htmlCssFiles/editListing")
public class EditListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/htmlCssFiles/editListing.jsp");
		
		ListingDAO dao = new ListingDAOImpl(false);
		
		String listing_name = request.getParameter("edit_listing");
		
		NewListing listing = dao.takeListingInfo(listing_name);
		request.setAttribute("listing_info", listing);
		disp.forward(request, response);

		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
