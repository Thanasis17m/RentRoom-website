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
 * Servlet implementation class UpdatePriceSrvlet
 */
@WebServlet("/htmlCssFiles/updatePrice")
public class UpdatePriceServlet extends HttpServlet {
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
		
		String listing_name = request.getParameter("price_update");
		System.out.println(listing_name);
		String date_from = request.getParameter("date_from");
		String date_to = request.getParameter("date_to");
		
		int price = Integer.parseInt(request.getParameter("listing_price"));
		
		dao.updatePrice(listing_name, price, date_from, date_to);
		
		disp.forward(request, response);
	}

}
