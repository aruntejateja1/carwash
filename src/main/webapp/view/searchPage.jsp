<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Search Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />

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

#approvalTable h3 {
    text-align: center;
    color: #0d6efd;
    margin: 0;
    margin-bottom: 20px;
}
</style>


</head>
<body>

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
    <div id="approvalTable">
        <h3>Search for your desired Washing Service Centers</h3>
        <form method="post">
        <div class="form-group">
            <label class="form-check-label">Search</label>
            <input type="search" name="location" id="location" class="form-control" required/><br><br>
          <input type="hidden" value="${uName}"/>
            <input type="submit" name="submit" value="Search" class="btn btn-primary" required/><br><br>
        </div>
        <table class="table table-hover">
        <tr scope="row">
            <td scope="col">Vendor Id</td>
            <td scope="col">Service Center Name</td>
            <td scope="col">Service Center Type</td>
            <td scope="col">Service Center Start Time</td>
            <td scope="col">Service Center End Time</td>
            <td scope="col">Service Center Contact</td>
            <td scope="col">Service Center Address</td>
            <td scope="col" colspan="2" align="center">ACTION</td>
        </tr>


        <%
        try
        {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/cts";
        String username="root";
        String password="Arunkohli@22";
        //String locationsearch=request.getParameter("location");
        //System.out.println(locationsearch);
        String query="select * from servicedetails where lower(wcAddress)=? or wcName=? or wcType=?";
        Connection conn=DriverManager.getConnection(url,username,password);
        PreparedStatement pstmt=conn.prepareStatement(query);
        pstmt.setString(1,request.getParameter("location"));
        pstmt.setString(2,request.getParameter("location"));
        pstmt.setString(3,request.getParameter("location"));
        ResultSet rs=pstmt.executeQuery();
        System.out.println(query);
        while(rs.next())
        {

        %>
        <tr scope="row">
            <td scope="col"><%=rs.getString("vid") %></td>
            <td scope="col"><%=rs.getString("wcName") %></td>
            <td scope="col"><%=rs.getString("wcType") %></td>
            <td scope="col"><%=rs.getString("wcStartTime") %></td>
            <td scope="col"><%=rs.getString("wcEndTime") %></td>
            <td scope="col"><%=rs.getString("wcContact") %></td>
            <td scope="col"><%=rs.getString("wcAddress") %></td>
            
               
            <td><a href="customerregistration?wcname=<%=rs.getString("wcname")%>&vid=<%=rs.getString("vid")%>">Book</a></td>
        <%-- <td><a href="customerregistration?vid=<%=rs.getString("vid")%>">Book</a></td>
         --%>
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


        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>