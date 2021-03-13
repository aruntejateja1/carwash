<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body >



<form method="get">

<table border="7">
<tr>
<td>FirstName</td>
<td>LastName</td>
<td>VendorId</td>
<td>email</td>
<td colspan="2" align="center">ACTION</td>
</tr>


<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/cts";
String username="root";
String password="Arunkohli@22";
String query="select * from vendor where status=?";

Connection conn=DriverManager.getConnection(url,username,password);
PreparedStatement pstmt=conn.prepareStatement(query);
pstmt.setString(1,"f");
ResultSet rs=pstmt.executeQuery();
while(rs.next())
{

%>
    <tr>
    <td><%=rs.getString("first_name") %></td>
    <td><%=rs.getString("last_name") %></td>
    <td><%=rs.getString("vid") %></td>
     <td><%=rs.getString("email") %></td>
   
    <td><a href="update?vid=<%=rs.getInt("vid") %>" >Accept</a></td>
    <td><a href="delete?vid=<%=rs.getInt("vid") %>">decline</a></td>
    
    
    
   
    
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



<script>

function myfunction(){
document.write("hello world");
}


</script>

</body>
</html>