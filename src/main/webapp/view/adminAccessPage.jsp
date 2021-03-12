<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<style>
body {
            background-image: url("/images/admin.jpg");
          background-repeat: no-repeat;
            width: auto;
        }

</style>


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


<h1 style="color:blue">Welcome Admin</h1>

<%-- <form action="action1" >

<input type="submit" value="pending approvals"/>
</form> --%>




<form action="vendorSignoff" method="post">
<input type="submit" class="button button1" value="signoff" >

</form>

</body>
</html>