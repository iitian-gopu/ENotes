package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.NoteDAO;
import com.Db.DBConnection;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public EditNotesServlet() {
		super();
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("noteContent");
		String title = request.getParameter("noteTopic");
		int noteID = Integer.parseInt(request.getParameter("note_id"));

		try {
			NoteDAO NoteDAO = new NoteDAO(DBConnection.getCon());
			boolean f = NoteDAO.updateNote(noteID, title, content);

		
		if (f == true) {
			System.out.println("Noted edited succesfully!");
			HttpSession session = request.getSession();
			session.setAttribute("EventOnNote", "Choosen note edited succesfully!!!");
			response.sendRedirect("showNotes.jsp");
		} else {
			System.out.println("Data not edited.");
			response.sendRedirect("addNotes.jsp");
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	}

}
