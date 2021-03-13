<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
    <%@page import="java.sql.*"%>
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
<body>
<h3 style="color:blue;text-align:center"> your details are submitted for approval!!</h3>

  
  
  <%-- 
  <h3 style="color:blue">this is the area of admin to approve</h3>
<form:form modelAttribute="user" action="approve">
vendor email:
<table>

<tr><form:input type="text" value="${email}" path="email"/> 
<td>vendor name:<form:label path="userType">User Type</form:label></td>

					<td>
						<form:radiobuttons items="${getRadios2}" path="userType" />
						<form:radiobutton path="userType" value="vendor" />Vendor
						<form:radiobutton path="userType" value="customer" />Customer
					</td>
					<td><form:errors path="userType" style="color:red" /></td>
					</tr>
					</table>
					admin Email:<input type="text" placeholder="Enter your Email address" name="uEmail"/><br>
				admin Password:<input type="password" placeholder="Enter your password" name="uPassword"/><br>
					
					
					<input type="submit" value="submit"/><br><br>
					</form:form> --%>
					
			<h3 style="color:red">${error}</h1>		
			
			
			
			<form action="userSignoff" method="post">
<input type="submit" class="button button1" style="text-align:center" value="back to home page">

</form>




</body>
</html>