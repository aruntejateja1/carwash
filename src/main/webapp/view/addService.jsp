<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Add Washing Service Details</title>
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
		<h3>Add Washing Service Details</h3>

	<sf:form action="submittodatabase" method="post" modelAttribute="vendor">

			<div class="form-group">
				<label class="form-check-label">Vendor Id</label>
				<sf:input class="form-control" path="vendorId" type="text" value="${vid}" readonly="true"/>
				<sf:errors path="vendorId" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center Name</label>
				<sf:input class="form-control" path="wcName" type="text" />
				<sf:errors path="wcName" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center Type</label>
				<sf:select class="form-control" path="wcType" items="${typeList}" />
				<sf:errors path="wcType" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center Start Time</label>
				<sf:input class="form-control" path="wcStartTime" type="time" />
				<sf:errors path="wcStartTime" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center End Time</label></td>
				<sf:input class="form-control" path="wcEndTime" type="time" /></td>
				<sf:errors path="wcEndTime" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center Contact Number</label>
				<sf:input class="form-control" path="wcContact" type="number" />
				<sf:errors path="wcContact" cssClass="error"></sf:errors>
			</div>
			<div class="form-group">
				<label class="form-check-label">Washing Center Address</label>
				<sf:input class="form-control" path="wcAddress" type="text" />
				<sf:errors path="wcAddress" cssClass="error"></sf:errors>
			</div>
			<div style="margin-top: 10px;">
				<input type="submit" value="Add" class="btn btn-primary" />
			</div>

		</sf:form>
	</div>

<style>
iframe{
margin-left: ;
}
</style>

<head></head>
<body>




	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</body>
</html>