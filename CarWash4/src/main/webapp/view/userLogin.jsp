<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>

<body style="text-align:center">

<h1 Style="color:blue">User Login Page</h1>
<h4 style="color:red"> ${error} </h4>

<form action="uLogin2"method="get">
Email: <input type="text" placeholder="Enter your Email address" name="uName"/><br>
password:<input type="password" placeholder="Enter your password" name="uPassword"><br>
<input type="submit" value="Login"><br>


</form>

</body>
</html>