<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form:form action="registerChoice" modelAttribute="user" method="get">
<table>
<tr>
<td><form:label path="userType" style="color:blue">User Type</form:label></td></tr>
<tr>
					<td>
						<form:radiobuttons items="${getRadios}" path="userType" />
						<%-- <form:radiobutton path="userType" value="vendor" />Vendor
						<form:radiobutton path="userType" value="customer" />Customer --%>
					</td></tr>
					<tr><td><form:errors path="userType" style="color:red" /></td>
				</tr>
				<tr><td><input type="submit" value="submit"/></td></tr>
				</table>
				</form:form>

</body>
</html>