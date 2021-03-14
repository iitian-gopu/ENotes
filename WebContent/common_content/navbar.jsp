
<%@page import="com.User.UserDetails"%>
<link rel="stylesheet" href="stylesheets/navbar.css" type="text/css"></link>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/57097ff76e.js"></script>

<nav class="px-3 navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand fst-italic" href="index.jsp"><i
			class="fa fa-bookmark"> E-Notes</i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="home.jsp"><i class="fa fa-home"> Home</i></a></li>
				<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
						class="fa fa-plus" aria-hidden="true"> Add notes</i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-shopping-basket"> Show notes</i></a></li>
			</ul>

			<%
			UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
			//System.out.print(userDetails);

			if (userDetails != null) {
			%>
			<div class="d-flex">
				<a class="btn btn-custom btn-outline-dark mx-1"
					data-bs-toggle="modal" data-bs-target="#exampleModal"><i
					class="fa fa-user-circle"> <%=userDetails.getName()%></i> </a> <a
					href="LogoutServlet" class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-sign-out-alt"> logout</i> </a>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-center fs-2" id="exampleModalLabel">Profile
								Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<table class="table table-striped text-center">
								<thead>
									<tr>
										<th scope="col" colspan="2"><i
											class="fa fa-user-plus fs-4"> Register</i></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Id:</th>
										<td><%=userDetails.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td><%=userDetails.getName()%></td>
									</tr>
									<tr>
										<th scope="row">Email id:</th>
										<td><%=userDetails.getEmail()%></td>
									</tr>
									<!--<tr>
										<th scope="row">Password</th>
										<td colspan="2">
											<%/*
											String passStar = "";
											String pass = userDetails.getPassword();
											char[] ch = new char[pass.length()];
											for (int i = 0; i < pass.length(); i++) {
												passStar += "*";
											}*/
											%></td>
									</tr>-->
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">---</button>
						</div>
					</div>
				</div>
			</div>

			<%
			} else {
			%>
			<div class="d-flex">
				<a href="register.jsp" class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-plus"> Register</i> </a> <a href="login.jsp"
					class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-circle"> login</i> </a>
			</div>
			<%
			}
			%>
		</div>
	</div>
</nav>