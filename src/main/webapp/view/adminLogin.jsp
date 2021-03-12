
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	
	<div style="margin: auto; margin-top: 30px;">
		<h1 Style="color: blue; text-align: center;">Admin Login</h1>
		<h4 style="color: red">${error}</h4>

		<form action="aLogin" method="get" style="width: 40%; margin: auto;">
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="uName"
					placeholder="Enter your password">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password"
					placeholder="Enter your password" name="uPassword" />
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
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
</body>
</html> --%>
































<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">



</head>
<!-- <style>
     body {
            background-image: url("/images/admin.jpg");
            width: auto;
        }

</style> -->

<body>
<h1 style="color:blue"> Admin Login</h1>
<h4 style="color:red"> ${error} </h4>

<form action="aLogin"method="get">
<div class="form-group">
Enter your Email:<input type="text" placeholder="Enter your Email address" name="uEmail" class="form-control"/></div><br>

<div class="form-group">
Enter your Password:<input type="password" placeholder="Enter your password" name="uPassword" class="form-control"/></div><br>

<input type="submit" value="Login"><br>


</form>

</body>
</html>