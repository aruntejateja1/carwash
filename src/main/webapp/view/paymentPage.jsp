<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



<title>Vendor Approve Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
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

#approvalTable {
	width: 70%;
	background-color: white;
	border-width: medium;
	border-style: solid;
	border-color: coral;
	margin: auto;
	margin-top: 40px;
	padding: 10px;
	border-radius: 20px;
}
</style>




</head>
<body >
<h1>On Demand Car Wash</h1>
	<header id="nav-section">
		<ul>
			<li><a style="background-color: coral;" href="registration">Register</a></li>
			<li><a href="/index">Home</a></li>
			<li><a href="vendorLogin">Vendor Login</a></li>
			<li><a href="userLogin2">Customer Login</a></li>
			<li style="float: right; padding-right: 50px;"><a href="/index">Sign
					Out</a></li>
		</ul>
	</header>



<form method="get">

	<div id="approvalTable">
		<table class="table table-hover">
			<tr>
				<td scope="col">washing service centerName</td>
				<td scope="col">user Name</td>
				<td scope="col">Email</td>
				<td scope="col">Time</td>
				<td scope="col">slot</td>
			
				<td colspan="2" align="center" scope="col">ACTION</td>
			</tr>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/cts";
String username="root";
String password="Arunkohli@22";
String query="select * from booking where status=? and uEmail=?";
Object name=request.getAttribute("uName");
Connection conn=DriverManager.getConnection(url,username,password);
PreparedStatement pstmt=conn.prepareStatement(query);
pstmt.setString(1,"t");

pstmt.setObject(2,name);

ResultSet rs=pstmt.executeQuery();
while(rs.next())
{

%>
    <tr>
    <td><%=rs.getString("wcname") %></td>
    <td><%=rs.getString("uEmail") %></td>
     <td><%=rs.getString("uName") %></td>
    <td><%=rs.getString("date") %></td>
    <td><%=rs.getString("time") %></td>
    
    <td><a href="pay?uEmail=<%=rs.getString("uEmail") %>" >pay online</a></td>
    
    
    
   
    
    </tr>
        <%

}
%>
    </table>
    <%
    rs.close();
    conn.close();
    }
    catch(Exception e)
    {
        e.printStackTrace();
        }






%>
</div>
</form>




	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>

</body>
</html>