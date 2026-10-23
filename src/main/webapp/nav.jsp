<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/nav.css">
</head>
<body>
	<div class="navbar">
        <div class="logo">
     		📆 Appointment Booking System   	
        </div>
        <div class="link">
            <a href="home.jsp">Home</a>
            <a href="#about">About</a>
            <a href="#contact">Contact us</a>

		<%
        	if(session.getAttribute("user")==null){
        %>
            <a href="login.jsp" class="btn">Login</a>
        <%
        }else{
        %>
            <a href="logout.jsp" class="btn">Logout</a>
        <%
        }
        %>        
        </div>
    </div>
</body>
</html>