<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
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

.button1 {background-color:red;} 

</style>

</head>
<body style="text-align:center">


<h1 style="color:blue;text-align:center">Welcome Customer</h1>
<form action="userSignoff" method="post">
<input type="submit" class="button button1" value="signoff">

</form>
</body>
</html>