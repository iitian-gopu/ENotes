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

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DeleteNoteServlet() {
		super();
	}
	/*
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			int noteid = Integer.parseInt(request.getParameter("note_id"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			NoteDAO noteDAO = new NoteDAO(DBConnection.getCon());
			boolean f = noteDAO.deleteNote(uid, noteid);
			if (f) {
				System.out.println("Data deleted succesfully.");
				HttpSession session = request.getSession();
				session.setAttribute("EventOnNote", "Choosen note deleted succesfully!!!");
				response.sendRedirect("ShowNotes.jsp");
			}else {
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}*/
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			int noteid = Integer.parseInt(request.getParameter("note_id"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			NoteDAO noteDAO = new NoteDAO(DBConnection.getCon());
			HttpSession session = null;
			boolean f = noteDAO.deleteNote(uid, noteid);
			if (f) {
				System.out.println("Data deleted succesfully.");
				session = request.getSession();
				session.setAttribute("EventOnNote", "Choosen note deleted succesfully!!!");
				response.sendRedirect("showNotes.jsp");
			}else {
				System.out.println("Data not deleted!!");
				session = request.getSession();
				session.setAttribute("EventNote", "Note not deleted, something wronge with server.");
				response.sendRedirect("showNotes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
