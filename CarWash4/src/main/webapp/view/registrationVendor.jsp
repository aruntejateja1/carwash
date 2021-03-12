<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%!int count =0; %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="view/validation.js"></script>

</head>
<body>

   
welcome to registration page
	<form:form action="registration4" method="post" modelAttribute="user" name="registration">
	
		<fieldset>
			<legend style="color:blue">Vendor Registration</legend>
			<table>
			
		Vendor id:<form:input id="demo" type="text" value="<%= ++count %>"  path="vid" /><br>
				<tr>
					<td><form:label path="firstName">First Name</form:label></td>
					<td><span><form:input path="firstName" placeholder="enter your first name" id="fname" onblur="myfunction()" onfocus="myfunction10()"/></span>
				<h5 id="vname" style="display:inline;color:red"></h5>
					</td>
					<td><form:errors path="firstName" style="color:red" />
					
					
					</td>
									

				</tr>
				
				

				
				<tr>
					<td><form:label path="lastName">Last Name</form:label></td>
					<td><form:input path="lastName" placeholder="enter your last name" id="lname" onblur="myfunction2()" onfocus="myfunction12()"/>
									<h5 id="vname2" style="display:inline;color:red"></h5>
					</td>
					<td><form:errors path="lastName" style="color:red" /></td>
				</tr>
				<tr>
					<td><form:label path="contactNumber">Contact</form:label></td>
					<td><form:input path="contactNumber" placeholder="enter your contact number" id="contact" onblur="myfunction3()" onfocus="myfunction13()"/>
					<h5 id="vcontact" style="display:inline;color:red"></h5>
					</td>
					<td><form:errors path="contactNumber" style="color:red" /></td>
				</tr>
				<tr>
					<td><form:label path="email">E-mail</form:label></td>
					<td><form:input type="email" path="email" placeholder="enter your email id" id="email"  onblur="vemail()" onfocus="myfunction14()"/>
					<h5 id="vemail" style="display:inline;color:red"></h5>
					
					</td>
					<td><form:errors path="email" style="color:red" /></td>
				</tr>
				<tr>
					<td><form:label path="password">Password</form:label></td>
					<td><form:password path="password" placeholder="enter your password" onblur="vpass()" onfocus="myfunction15()"/>
					<h5 id="vpassword" style="display:inline;color:red"></h5>
					
					
					</td>
					<td><form:errors path="password" style="color:red" /></td>
				</tr>
				<%-- <tr>
					<td><label>Re-enter Password</label></td>
					<td><form:password path="password"  /></td>
				</tr> --%>
				
				<tr>
					<td><input type="submit" name="submit" value="register" /></td>
				</tr>
			</table>
		</fieldset>
	</form:form>
	<br>
	<br>
	<form action="vendorSignoff" method="post">
<input type="submit" class="button button1" value="Back to home page">
	</form>
	


 <script>
        var seq = 0;
       
        function myFunction() {
            seq = seq +1;
            number = '00'.substr(String(seq).length) + seq
            document.getElementById("demo").value = number;
        }
    </script>

</body>
</html>