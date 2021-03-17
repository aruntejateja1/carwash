<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Home Page</title>

<script src="view/validation.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-image: url("/images/car-bg.jpg");
	width: auto;
}

h1 {
	color: rgb(255, 255, 255);
	text-align: center;
	text-decoration: solid;
	font-size: 50px;
	background-color: rgb(114, 113, 113);
	margin: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: rgba(0, 0, 0, 0.884);
	width: 100%;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: rgba(254, 255, 254, 0.568);
}

#vendoridrow {
	visibility: hidden;
}

.form_section {
	background-color: white;
	width: 60%;
	margin: auto;
	margin-top: 40px;
	padding: 20px;
	padding-top: 30px;
	border-radius: 20px;
	margin-bottom: 40px;
}

.form_section h2 {
	text-align: center;
	color: #0d6efd;
	margin: 0;
	margin-bottom: 0px;
	width: 100%;
}

.service_buttons {
	float: right;
	width: auto;
}

.form_service {
	background-color: red;
}

.form_service div {
	float: left;
}
</style>

</head>
<body>
<h1>On Demand Car Wash</h1>
	<header id="nav-section">
		<ul>
			<li><a style="background-color: coral;" href="registration">Register</a></li>
			<li><a href="/index">Home</a></li>
			<li><a href="vendorLogin">Vendor Login</a></li>
			<li><a href="userLogin2">Customer Login</a></li>
			<li style="float: right; padding-right: 50px;"><a href="/index">Sign
					Out</a></li>
		</ul>
	</header>
	
	
<div style="width: 60%; margin: auto; margin-top:20px; background-color:white; padding: 50px; border-radius: 20px; ">
		<h2 style="text-align: center; margin-bottom: 20px; ">Welcome to Vendor Page</h2>
		
		
		
		
		<div style="background-color: white; width: 33%; margin: 0px; align-content:center; float: left;">
			<form action="addService" method="post">
				<input type="hidden" value="${vid}" style="color: blue" name="vid"
					readonly> <input type="submit" class="btn btn-primary"
					value="Add Service">
			</form>
		</div>
		<div style="background-color: white; width: 34%; align-content:center; margin: 0px; float: left;">
			<form action="deleteService" method="post">
				<input type="hidden" value="${vid}" style="color: blue" name="vid"
					readonly> <input type="submit" class="btn btn-primary"
					value="Delete Service">
			</form>
		</div>
		
		<div style="background-color: white; width: 33%; justify-content:center; margin: 0; float: left;">
			<form action="updateService" method="post">
				<input type="hidden" value="${vid}" style="color: blue" name="vid"
					readonly> <input type="submit" class="btn btn-primary"
					value="Update Service">
			</form>
		</div>
		<br>
<br>
<div style="width: 100px;">
			<form action="action2">
				<input type="submit" value="pending approvals"
					class="btn btn-outline-primary" />
					
					<input type="hidden" value="${email}" name="vEmail" />
			</form>
		</div>
		
	
	</div>
		
		
		
		
		

<div class="form_section">
		<h3 style="text-align: center;">Update Details</h3>
		<form action="updateInfo" name="${email}">

			<div class="form-group">
				<label for="vEmail" class="form-check-label"></label> 
				<input type="hidden" value="${email}" name="vEmail" class="form-control" readonly/><br>
				<h5 style="color: black">Edit Details Below</h5>
			</div>

			<div class="form-group">
				<label for="vPassword" class="form-check-label">Password</label> <input
					type="password" value="${password}" name="vPassword"
				pattern="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%*^]).{6,}" onblur="vpass()"
					title="must contain more than 6 letters with atleast one number,one lowercase and one uppercase and one special character"
					class="form-control" required />
			</div>

			<div class="form-group">
				<label for="vFirstName" class="form-check-label">First Name</label>

				<input type="text" value="${firstName}" class="form-control"
					name="vFirstName" pattern="[a-z A-z]{4,50}"
					title="must be 4 to 50 characters" required>
			</div>
			<div class="form-group">

				<label for="vLastName">Last Name</label> <input type="text"
					value="${lastName}" name="vLastName" pattern="[a-z A-z]{4,50}"
					title="must be 4 to 50 characters" class="form-control" required/>
			</div>

			<div class="form-group">
				<label for="vContactNumber" class="form-check-label">Contact
					Number</label> <input type="text" value="${contactNumber}"
					name="vContactNumber" pattern="[0-9]{10}"
					title="must be 10 numbers" class="form-control" required />
			</div>

			<br> <input type="submit" value="Update Information"
				class="btn btn-primary" /> <br>
		</form>
		<br>
		
		<div id="form_section">
	
		
		

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>

</body>
</html>