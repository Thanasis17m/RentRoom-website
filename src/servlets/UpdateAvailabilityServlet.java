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

/**
 * Servlet implementation class UpdateAvailabilityServlet
 */
@WebServlet("/htmlCssFiles/updateAvailability")
public class UpdateAvailabilityServlet extends HttpServlet {
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
		
		String listing_name = request.getParameter("availability_update");
		String date_from = request.getParameter("date_from");
		String date_to = request.getParameter("date_to");
		
		
		int available = 0;
		
		String[] availability =request.getParameterValues("availability");
		if(availability[0].equals("open")){
			available = 1;
		}
		
		dao.updateAvailability(date_from,date_to,listing_name,available);
		disp.forward(request, response);
		
	}

}
