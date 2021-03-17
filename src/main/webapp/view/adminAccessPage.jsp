<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta http-equiv="refresh" content="3">
<title>Admin Home Page</title>
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

#form_section {
	background-color: white;
	width: 100%;
	margin: auto;	
	padding: 20px;
	padding-top: 0;
	display: inline-block;
}

#form_section h2 {
	text-align: center;
	color: #0d6efd;
	margin: 0;
	margin-bottom: 0px;
	width: 100%;
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
			<li style="float: right; padding-right: 50px;"><a
				href="/index">Sign Out</a></li>
		</ul>
	</header>

	<div id="form_section">
		<h2>Welcome Admin</h2>
		<div style="width: 100px;">
			<form action="action1">
				<input type="submit" value="pending approvals"
					class="btn btn-outline-primary" />
			</form>
		</div>
		<%-- <div>
			<form action="vendorSignoff" method="post">
				<input type="submit" style="text-align: right" value="signoff"
					class="btn btn-outline-primary" />
			</form>
		</div> --%>
	</div>

</body>
</html>