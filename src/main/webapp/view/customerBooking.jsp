<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Customer Booking</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />

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

#form_section h3 {
	text-align: center;
	color: #0d6efd;
	margin: 0;
	margin-bottom: 20px;
}
.error {
    color: red;
    font-style: italic;
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
	            <li style="float: right; padding-right: 50px;"><a href="/index">Sign Out</a></li>
	        </ul>
	    </header>


		<div id="form_section">
			<form action="bookService" method="post">

				<h3>Book your service</h3>

<input type="hidden" value="${vid}" name="vid"/>




				<div class="form-group">
					<label class="form-check-label">Your Service Center Name</label>
					<input class="form-control" type="text" id="wcname" name="wcname" value="${wcname}" readonly/>
				</div>
				
				<div class="form-group">
					<label class="form-check-label">Enter your Full Name</label>
					<input class="form-control" type="text" id="wcname" name="uName"/>
				</div>
					<div class="form-group">
					<label class="form-check-label">Enter your Email</label>
					<input class="form-control" type="text" id="wcname" name="uEmail"/>
				</div>
				
				<div class="form-group">
					<label class="form-check-label" for="dateslot">Choose a date for your service</label>
					<input class="form-control" type="date" id="dateslot" name="dateslot" required>
				</div>
				<div class="form-group">
					<label class="form-check-label" for="timeslot">Choose a time for your service</label>
					<input class="form-control" type="time" id="timeslot" name="timeslot" required>
				</div>
				<div class="form-group">
					<label class="form-check-label">Select Type</label>
				</div>	
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="OD" name="getcar" onclick="disable()">
						<label class="form-check-label">Own drop</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="CP" name="getcar" onclick="enable()">
						<label class="form-check-label">Car picked from house</label>
					</div>
				
				<div class="form-group">
					<label class="form-check-label">Door No </label>
					<input class="form-control" type="text" id="dno" name="dno"/>
				</div>
				<div class="form-group">
					<label class="form-check-label">Street Name</label>
					<input class="form-control" type="text" id="street" name="street"/>
				</div>
				<div class="form-group">
					<label class="form-check-label">Road Name</label>
					<input class="form-control" type="text" id="road" name="road"/>
				</div>
				<div class="form-group">
					<label class="form-check-label">City</label> 
					<input class="form-control" type="text" id="city" name="city"/>
				</div>
				<div style="margin-top: 10px;">
					<input type="submit" value="Submit" class="btn btn-primary" />
				</div>
			</form>
		</div>

	<script type="text/javascript">
		function disable(){
			document.getElementById("dno").disabled=true;
			document.getElementById("street").disabled=true;
			document.getElementById("road").disabled=true;
			document.getElementById("city").disabled=true;
		}
		function enable(){
			document.getElementById("dno").disabled=false;
			document.getElementById("street").disabled=false;
			document.getElementById("road").disabled=false;
			document.getElementById("city").disabled=false;
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>