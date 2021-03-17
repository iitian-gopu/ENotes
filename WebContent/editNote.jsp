<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.User.UserNotes"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnection"%>
<%@page import="com.DAO.NoteDAO"%>
<%@page import="com.User.UserDetails"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("userDetails");
if (userDetails1 == null) {
	session.setAttribute("Login-error",
	"Please login first to edit any note...");
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit note | ENotes</title>
</head>
<body>
	<%@ include file="common_content/navbar.jsp"%>
	<%
	int noteID = Integer.parseInt(request.getParameter("note_id"));
	if (userDetails1 != null) {
		NoteDAO nDAO = new NoteDAO(DBConnection.getCon());
		UserNotes nt = nDAO.editNote(noteID, userDetails1.getId());
	%>
	<div class="container-fluid p-3">
		<div class="container">
			<h2 class="text-center">Edit note</h2>
			<form action="EditNotesServlet" method="post">
				<!-- Hidden Content-->
				<input type="hidden" name="uid" value="<%=userDetails1.getId()%>">
				<input type="hidden" name="note_id" value="<%=noteID%>">
				<!-- Till here -->
				<div class="mb-3">
					<label for="noteTopic" class="form-label">Note topic</label> <input
						type="text" name="noteTopic" class="form-control" id="noteTopic"
						value="<%=nt.getTitle()%>" aria-describedby="emailHelp">
				</div>
				<div class="mb-3">
					<label for="noteContent" class="form-label">Content<span
						style="color: red">*</span></label>
					<textarea name="noteContent" class="form-control" rows="9"
						required="required" id="noteContent"> <%=nt.getContent()%>></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary text-center ">Update
						Note</button>
				</div>
			</form>
		</div>
	</div>
	<%
	}
	%>
	<%@ include file="common_content/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>