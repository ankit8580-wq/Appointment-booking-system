<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<link rel="stylesheet" href="css/appointment.css">
</head>
<body>
    <%@ include file="nav.jsp" %>    	
    <div class="container">
        <h1>Book Appointment</h1>
        <div class="card">
            <form action="insertApp.jsp" method="post">
			    <input type="hidden" name="doc_name" value="<%= request.getParameter("doc_name") %>">
			    <input type="hidden" name="specialization" value="<%= request.getParameter("specialization") %>">	
			    <input type="date" name="app_date" required>
			    <input type="time" name="app_time" required>
			
			    <button type="submit" class="sub_btn">Confirm Booking</button>
			</form>
        </div>
    </div>
	<div class="foot">
    	<%@ include file="footer.jsp" %>
	</div>	
</body>
</html>