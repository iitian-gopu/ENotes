<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- External StyleSheet -->
		<link style="stylesheet" type="text/css" href="stylesheets/index.css">
		<style type="text/css">
			.main-data {
				height: 81vh;
				width: 100%;
				background-image: linear-gradient(111deg, rgb(64, 151, 147),
						rgb(164, 70, 215), rgb(64, 151, 147));
				box-shadow: inset 0px 0px 10px -3px black;
			}

			.form-outter {
				max-width: 70%;
				width: 60%;
				height: 70%;
				min-width: 300px;
				padding: 10px;
				background-image: linear-gradient(252deg, rgb(218 172 243),
						rgb(113, 223, 218));
				box-shadow: inset 0px 0px 10px -3px black;
				/*border: 1px solid black;*/
				display: flex;
				flex-direction: column;
				justify-content: center;
			}

			section {
				display: block;
				width: 100%;
				padding: 13px 35px;
			}

			section>label {
				max-width: 40%;
				font-weight: normal;
				font-size: x-large;
				/*margin-left: 20px;*/
				font-style: oblique;
			}

			section>input {
				width: 100%;
				border: none;
				outline: none;
				padding: 3px 13px;
				border-bottom: 1px solid blue;
			}

			section>input:focus {
				border-bottom: 2px solid blue
			}

			input[type="submit"] {
				background-color: #c9d0fc;
				width: 40%;
				border: 1px solid lime;
				box-shadow: 0 0 4px lime;
				padding: 4px 15px;
				font-size: 1.25rem;
				border-radius: 20px;
				margin-left: 50%;
				transform: translate(-50%, -50%);
				border: 1px solid lime;
				outline: none;
			}

			input[type="submit"]:hover {
				background-color: lime;
				color: black;
			}

			form>h2 {
				font-weight: 500;
				text-align: center;
			}
		</style>
		<title>Login | ENotes</title>
	</head>

	<body>
		<%@ include file="common_content/navbar.jsp" %>

			<div class="main-data d-flex justify-content-center align-items-center">
				<div class="form-outter">
			<form method="post" action="LoginServlet">
				<h2>
					<i class="fa fa-user"></i> Login account
				</h2>
				
				
				
				
				
				<% String invalidLogin=(String) session.getAttribute("login-failed");
				if (invalidLogin !=null) {
				%>
				<div class="alert alert-danger" role="alert"><%=invalidLogin%></div>
				<%
				session.removeAttribute("login-failed");
				}
				%>
				
				<%
				String noEntryWithoutLogin = (String) session.getAttribute("Login-error");
				if (noEntryWithoutLogin != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=noEntryWithoutLogin%></div>
				<%
				session.removeAttribute("Login-error");
				}
				%>
				
				<%
				String logoutMsg = (String) session.getAttribute("logout-msg");
				if (logoutMsg != null) {
				%>
				<div class="alert alert-success" role="alert"><%=logoutMsg%></div>
				<%
				session.removeAttribute("logout-msg");
				}
				%>
				
				
				
				
				
				
				<section>
					<label>E-mail:</label> <br> <input type="text"
						placeholder="E-mail Address" name="uEmail" required>
				</section>
				<br>
				<section>
					<label>Password:</label> <br> <input type="password"
						placeholder="8-16 character long" name="uPassword" required>
				</section>
				<br> <br> <input type="submit" value="Submit">
			</form>
		</div>
			</div>
			<%@ include file="common_content/footer.jsp" %>
				<!-- Option 1: Bundle of Bootstrap Popper -->
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
	</body>

	</html>