package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;
import dao.UserDAOImpl;
import java.util.List;
/**
 * Servlet implementation class SearchConversations
 */
@WebServlet("/SearchConversations")
public class SearchConversationsServlet extends HttpServlet {
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
		UserDAO dao = new UserDAOImpl(false);
		String username = "";
		
		List<String> conversations = dao.searchConversations(username);
		if(conversations.size()==0){/*Check if there aren't any users*/
			response.getWriter().println("No conversations to show.");
		}
		else {
			
			request.setAttribute("conversations_list",conversations);
			disp.forward(request, response);
		}
		
	}

}
