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
<title>Home | ENotes</title>
</head>
<body>
	<%@ include file="common_content/navbar.jsp"%>

	<%
	Connection con = DBConnection.getCon();
	
	//System.out.println( +"We are at 1st page of site. "  con);
	%>


	<div
		class="container-fluid d-flex align-items-center back-img justify-content-center text-white main-data">
		<div class="text-center">
			<div class="d-flex align-items-center justify-content-center">
				<a href="register.jsp"
					class="btn px-3 btn-custom btn-outline-dark fs-5 mx-1"><i
					class="fa fa-user-plus"> Register</i> </a> <a href="login.jsp"
					class="btn px-3 btn-custom btn-outline-dark fs-5 mx-1"><i
					class="fa fa-user-circle"> login</i> </a>
			</div>
			<h1>Write you notes with auto-save</h1>
			<p style="color: #3bff91;">
				A place where you can write fearlessly without losing any data. <br>
				Everything is safe.
			</p>
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









