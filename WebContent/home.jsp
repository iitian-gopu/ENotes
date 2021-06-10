
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("userDetails");
if (userDetails1 == null) {
	session.setAttribute("Login-error",
	"Please login first to get at home page..");
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
<link href="stylesheets/index.css" type="text/css" rel="stylesheet" />

<style>
.back-img {
	background: url("pictures/paperNote.jpg") no-repeat center center/cover;
	width: 100%;
	height: 93vh;
	left: 0;
	right: 0;
}

.btn-outline-dark:hover {
	box-shadow: 1px 1px 11px #252323;
}
</style>
<!-- add icon link -->
<link rel="icon" href="pictures/title_logo2.png" type="image/x-icon">
<title>Add new note | ENotes</title>
</head>

<body style="height: 100px;">
	<%@include file="common_content/navbar.jsp"%>


	<!-- Main body -->
	<div class="container-fluid p-0 m-0">
		<div class="card py-5 text-center">
			<div class="inner-card">
				<img alt="" src="pictures/make_notes.jpg" class="img-fluid">
				<h2>Let's create a note.</h2>
				<a href="addNotes.jsp" class="btn btn-outline-info">Let's add
					Note</a>
			</div>
		</div>
	</div>



	<%@include file="common_content/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- 
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"></script>
    -->
</body>

</html>