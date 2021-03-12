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

<!-- <script>

var name="arun";
</script> -->

<h1 style="color:blue">Welcome to vendor page</h1>

<form action="updateInfo" name="${email}" >
your Email: <input type="text" value="${email}" style="color:blue" name="vEmail" ><br>


<h3 style="color:red">change your details if wanted.</h3><br>
your Password:<input type="password" value="${password}" style="color:blue" name="vPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,}" title="must contain more than 6 letters with atleast one number,one lowercase and one uppercase and one special character"><br>

your first Name:<input type="text" value="${firstName}" style="color:blue" name="vFirstName" pattern="[a-z A-z]{4,50}" title="must be 4 to 50 characters"><br>
your last Name:<input type="text" value="${lastName}" style="color:blue" name="vLastName" pattern="[a-z A-z]{4,50}" title="must be 4 to 50 characters"><br>
your contact Number:<input type="text" value="${contactNumber}" style="color:blue" name="vContactNumber" pattern="[0-9]{10}" title="must be 10 numbers"><br>

<input type="submit" value="updateInformation"/> <br>
</form>
 <!-- <header id="nav-section">
        <ul>
            <li><a style="background-color: yellow; text-size:200%" href="vendorDetails">update Information</a></li>
</ul>
</header> -->







<form action="vendorSignoff" method="post">
<input type="submit" class="button button1" value="signoff">

</form>

</body>
</html>