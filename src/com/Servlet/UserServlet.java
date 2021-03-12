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

//It's url
@WebServlet("/UserServlet")//Registration servlets.
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// Getting values form jsp
		String name = req.getParameter("uName");
		String email = req.getParameter("uEmail");
		String password = req.getParameter("uPassword");
		// Sending data to POJO
		UserDetails ud = new UserDetails();
		ud.setName(name);
		ud.setEmail(email);
		ud.setPassword(password);
		
		// Calling DAO method to add a new User.
		UserDAO udao = new UserDAO(DBConnection.getCon());
		boolean f = udao.addUser(ud);
		HttpSession session;

		if (f) {
			session = req.getSession();
			session.setAttribute("reg-sucess", "Registration Sucesfull");
			res.sendRedirect("register.jsp");
		} else {
			session = req.getSession();
			//Will execute when connection with database is failed due to various reason.
			session.setAttribute("reg-failed",
					"Registration Unsucessful, Something went wrong with server!! Come back in 10 min");
			res.sendRedirect("register.jsp");
		}

	}
}
