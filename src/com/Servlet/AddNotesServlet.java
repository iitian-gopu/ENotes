package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.NoteDAO;
import com.Db.DBConnection;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/* Constructor */
	public AddNotesServlet() {
		super();
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		// String uname = request.getParameter("uname");
		// String uemail = request.getParameter("uemail");
		String noteContent = request.getParameter("noteContent");
		String noteTopic = request.getParameter("noteTopic");

		NoteDAO NoteDAO = new NoteDAO(DBConnection.getCon());
		boolean f = NoteDAO.addNotes(noteTopic, noteContent, uid);

		if (f == true) {
			System.out.println("Noted added succesfully!");
			response.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("Data not inserted.");
			try {
				Thread.sleep(1500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.print("Thread is not sleeping.");
			}
			response.sendRedirect("addNotes.jsp");
		}
	}

}
