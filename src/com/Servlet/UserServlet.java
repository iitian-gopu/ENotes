package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.Db.DBConnection;
import com.User.UserDetails;

//It's url
@WebServlet("/UserServlet")
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
		//Calling DAO method to add a new User.
		UserDAO udao = new UserDAO(DBConnection.getCon());
		
		boolean f = udao.addUser(ud);
		
		PrintWriter out = res.getWriter();
		if (f) {
			out.print("User Register Successfully");
		} else {
			out.print("Data not inserted");
		}

	}
}
