<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Washing Service</title>
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
    </style>
</head>

<body>
    <h1>On Demand Car Wash</h1>
    <header id="nav-section">
        <ul>
            <li><a style="background-color: coral;" href="registration">Register</a></li>
            <li><a href="#">Home</a></li>
            <li><a href="vendorLogin">Vendor Login</a></li>
            <li><a href="userLogin2">Customer Login</a></li>
            <li style="float: right; padding-right: 50px;"><a href="adminLogin">Admin Login</a></li>
        </ul>
    </header>
</body>

</html>