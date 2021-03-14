<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("userDetails");

if (userDetails1 == null) {
	session.setAttribute("Login-error", "Please login first to add and save notes...");
	response.sendRedirect("login.jsp");
}
%>

<!doctype html>
<%@page import="com.Db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- External StyleSheet -->
<link style="stylesheet" type="text/css" href="stylesheets/index.css">
<!-- add icon link -->
<link rel="icon" href="pictures/title_logo2.png" type="image/x-icon">
<title>Home | ENotes</title>
</head>
<body>
	<%@ include file="common_content/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="container">
			<h2 class="text-center">Add your note</h2>
			<form action="AddNotesServlet" method="post">
				<%
				UserDetails ud = (UserDetails) session.getAttribute("userDetails");
				if (ud != null) {
				%>
				<input type="hidden" name="uid" value="<%=ud.getId()%>"><input
					type="hidden" name="uname" value="<%=ud.getName()%>"><input
					type="hidden" name="uemail" value="<%=ud.getEmail()%>">
				<%
				}
				%>
				<div class="mb-3">
					<label for="noteTopic" class="form-label">Note topic</label> <input
						type="text" name="noteTopic" class="form-control" id="noteTopic"
						aria-describedby="emailHelp">
				</div>
				<div class="mb-3">
					<label for="noteContent" class="form-label">Content<span
						style="color: red">*</span></label>
					<textarea name="noteContent" class="form-control" rows="9"
						required="required" id="noteContent"></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary text-center ">Submit</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="common_content/footer.jsp"%>
	<!-- Optional JavaScript; choose one of the two! -->
	<!-- Option 1: Bundle of Bootstrap Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- 
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"></script>
    -->
</body>
</html>