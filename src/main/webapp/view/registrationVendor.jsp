<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%!int count = 0;%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Registration</title>
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

#form_section {
	background-color: white;
	width: 50%;
	margin: auto;
	margin-top: 50px;
	padding: 60px;
	padding-bottom: 60px;
	border-radius: 20px;
	margin-bottom: 60px;
}

#form_section h2 {
	text-align: center;
	color: #0d6efd;
	margin: 0;
	margin-bottom: 20px;
}

.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	background-color: red;
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
            <li style="float: right; padding-right: 50px;"><a href="adminLogin">Admin Login</a></li>
        </ul>
    </header>
	<div id="form_section">
		<h5 style="color: red">${error}</h5>

		<form:form action="registration4" method="post" modelAttribute="user"
			name="registration">


			<h2>Vendor Registration</h2>
	<%-- 		
			<form action="/action_page.php">
  Country: <input type="text" name="country" value="Norway" readonly><br>
  <input type="submit" value="Submit">
</form>
		 --%>	
			
		
 
			
			<div class="form-group">
				<form:label for="vid" path="vid" class="form-check-label">Vendor id:</form:label>
				<form:input id="demo" path="vid" value="<%=++count%>" class="form-control" readonly="true" onfocus="myfunction120()"/>
			</div>
			
			
			
			<div class="form-group">
				<form:label path="firstName" class="form-check-label">First Name</form:label>
				<span><form:input path="firstName"
						placeholder="enter your first name" id="fname"
						onblur="myfunction()" onfocus="myfunction10()" autofocus="on"
						class="form-control" /></span>
				<h5 id="vname" style="display: inline; color: red"></h5>
				<form:errors path="firstName" style="color:red" />
			</div>
			<div class="form-group">
				<form:label path="lastName" class="form-check-label">Last Name</form:label>
				<form:input path="lastName" placeholder="enter your last name"
					id="lname" onblur="myfunction2()" onfocus="myfunction12()"
					class="form-control"/>
				<h5 id="vname2" style="display: inline; color: red"></h5>
				<form:errors path="lastName" style="color:red" />
			</div>
			<div class="form-group">
				<form:label path="contactNumber" class="form-check-label">Contact</form:label>
				<form:input path="contactNumber"
					placeholder="enter your contact number" id="contact"
					onblur="myfunction3()" onfocus="myfunction13()"
					class="form-control" />
				<h5 id="vcontact" style="display: inline; color: red"></h5>
				<form:errors path="contactNumber" style="color:red" />
			</div>
			<div class="form-group">
				<form:label path="email" class="form-check-label">E-mail</form:label>
				<form:input type="email" path="email"
					placeholder="enter your email id" id="email" onblur="vemail()"
					onfocus="myfunction14()" class="form-control" />

				<h5 id="vemail" style="display: inline; color: red"></h5>
				<form:errors path="email" style="color:red" />
			</div>
			<div class="form-group">
				<form:label path="password" class="form-check-label">Password</form:label>
				<form:password path="password" placeholder="enter your password"
					onblur="vpass()" onfocus="myfunction15()" class="form-control" />
				<h5 id="vpassword" style="display: inline; color: red"></h5>
				<form:errors path="password" style="color:red" />
			</div>
			<div style="margin-top: 10px;">
				<input type="submit" name="submit" value="register"
					class="btn btn-primary" />
			</div>
		</form:form>
		<br> <br>
		<form action="vendorSignoff" method="post">
			<input type="submit" class="btn btn-primary"
				value="Back to home page">
		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>

	<script>
		var seq = 0;

		function myFunction() {
			seq = seq + 1;
			number = '00'.substr(String(seq).length) + seq
			document.getElementById("demo").value = number;
		}

	 function myfunction120() {
			alert("you cannot change the vendor Id");

	}
	</script>

</body>
</html>