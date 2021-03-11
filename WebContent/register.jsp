<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	min-height: 70%;
	min-width: 300px;
	padding: 10px;
	background-image: linear-gradient(252deg, rgb(218 172 243),
		rgb(113, 223, 218));
	box-shadow: inset 0px 0px 10px -3px black;
	box-shadow: inset 0px 0px 10px -3px black;
	/*border: 1px solid black;*/
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.form-outter>h2 {
	font-weight: 300;
	text-align: center;
}

group {
	display: block;
	width: 100%;
}

group>label {
	max-width: 40%;
	font-weight: lighter;
	margin-left: 20px;
	font-style: oblique;
}

group>input {
	width: 100%;
	border: none;
	outline: none;
	padding: 3px 13px;
	border-bottom: 1px solid blue;
}

group>input:focus {
	border-bottom: 2px solid blue
}

input[type="submit"] {
	text-align: center;
	align-self: center;
	width: 40%;
	background-color: #c9d0fc;
	/*border: 1px solid lime;*/
	box-shadow: 0 0 4px lime;
	padding: 4px 15px;
	font-size: 1.15rem;
	border-radius: 20px;
	margin-left: 50%;
	transform: translate(-50%, -50%);
}
input[type="submit"]:hover{
	background-color: lime;
	color: black;
}
input[type="submit"]:focu{
	background-color: #00ff0075;
}
</style>
<title>Register | ENotes</title>
</head>
<body>
	<%@ include file="common_content/navbar.jsp"%>
	<div class="main-data d-flex justify-content-center align-items-center">
		<div class="form-outter">
			<h2>Register and enjoy for free.</h2>
			<form method="get" action="UserServlet">
				<group> <label>Name:</label> <br>
				<input type="text" placeholder="Your name" name="uName"> </group>
				<br>
				<group> <label>E-mail:</label> <br>
				<input type="text" placeholder="E-mail Address" name="uEmail"> </group>
				<br>
				<group> <label>Password:</label> <br>
				<input type="password" placeholder="8-16 character long" name="uPassword"> </group>
				<br> <br> <input type="submit" class="btn btn-pill"
					value="Submit">
			</form>
		</div>
	</div>
	<%@ include file="common_content/footer.jsp"%>
	<!-- Option 1: Bundle of Bootstrap Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>