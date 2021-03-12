<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body style="text-align:center">
<h1 style="color:blue">Vendor Login</h1>
<h4 style="color:red"> ${error} </h4>
<form action="vLogin"method="get">
Email:<input type="text" placeholder="Enter your Email address" name="uEmail"/><br>
Password:<input type="password" placeholder="Enter your password" name="uPassword"/><br>
<input type="submit" value="Login"><br>

</form>
</body>
</html>