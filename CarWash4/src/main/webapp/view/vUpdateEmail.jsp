<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="submitEmail" method="post">
Old Email:<input type="text" name="vEmail3" value="${email}"  />


<br>
Enter new Email:<input type="text" name="vEmail2"  ><br>
<input type="submit" value="update"/>
</form>
</body>
</html>