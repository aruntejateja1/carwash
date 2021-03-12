<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>



<script src="images/valid.js"></script>
</head>
<body onload="firstfocus();">
<h1>JavaScript Field Label Form Validation using a registration form</h1>
<h2>Use tab key or mouse to go next field</h2><form name='registration'>
<ul>
<li><label for="userid">User id [5 to 12 characters] :</label></li>
<li><input type="text" name="userid" size="12" onblur="userid_validation(5,12)"/></li>
<li><label for="passid">Password [7 to 12 characters] :</label></li>
<li><input type="password" name="passid" size="12" onblur="passid_validation(7,12)"/></li>
<li><label for="username">Name [Alphabates characters] :</label></li>
<li><input type="text" name="username" size="50" onblur="allLetter()"/></li>
<li><label for="address">Address [alphanumeric characters] :</label></li>
<li><input type="text" name="address" size="50" onblur="alphanumeric()"/></li>
<li><label for="country">Country [Must select a country] :</label></li>
<li><select name="country" onblur="countryselect()">
<option selected="" value="Default">(Please select a country)</option>
<option value="AF">Australia</option>
<option value="AL">Canada</option>
<option value="DZ">India</option>
<option value="AS">Russia</option>
<option value="AD">USA</option>
</select></li>
<li><label for="zip">ZIP Code [numeric characters] :</label></li>
<li><input type="text" name="zip" onblur="allnumeric()"/></li>
<li><label for="email">Email [Valid email] :</label></li>
<li><input type="text" name="email" size="50" onblur="ValidateEmail()" /></li>
<li><label id="gender">Sex [Select Male or Female] :</label></li>
<li><input type="radio" name="sex" value="Male" checked /><span>Male</span></li>
<li><input type="radio" name="sex" value="Female" /><span>Female</span></li>
<li><label>Language [Optional] :</label></li>
<li><input type="checkbox" name="en" value="en" checked /><span>English</span></li>
<li><input type="checkbox" name="nonen" value="noen" /><span>Non English</span></li>
<li><label for="desc">About [Optional] :</label></li>
<li><textarea name="desc" id="desc"></textarea></li>
<li><input type="submit" name="submit" value="Submit" onclick="alert('Form submitted successfully')" /></li>
</ul>
</form>
</body>



</html>