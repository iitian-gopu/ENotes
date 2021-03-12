package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnection;
import com.User.UserDetails;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
		super();
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("uEmail");
		String password = request.getParameter("uPassword");

		UserDetails ud = new UserDetails();
		ud.setEmail(email);
		ud.setPassword(password);

		// DAO object running constructor to create connection with database.
		UserDAO uDAO = new UserDAO(DBConnection.getCon());
		/*
		 * Object of method of DAO (loginUser(useDetails)) to check user exist,
		 * if exist then returns all the saved details of respective user in
		 * userLogin object. null if not exist.
		 */
		UserDetails userDetails = uDAO.loginUser(ud);
		/*
		 * If it have data
		 */
		HttpSession session = null;
		if (userDetails != null) {
			session = request.getSession();
			session.setAttribute("userDetails", userDetails);
			// Passing all the details in the session object to use on site
			response.sendRedirect("home.jsp");
			
		} else {
			session = request.getSession();
			session.setAttribute("login-failed",
					"Invalid User email or Password...");
			response.sendRedirect("login.jsp");
		}
	}

}
