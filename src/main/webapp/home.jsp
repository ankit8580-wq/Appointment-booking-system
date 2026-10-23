<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<%@ include file = "nav.jsp" %>
	<section class="book">
		<div class="book_para">
			<h1>Book Appointments Easily</h1>
			<p>
				Easily schedule appointments with trusted healthcare professionals using our convenient online booking system.
			</p>
			
			<%
				if(session.getAttribute("user")==null){
			%>
					<a href="login.jsp" class="btn">Book Now</a>
			<%
				}else{
			%>
					<a href="doctor.jsp" class="btn">Book Now</a>
			<%
				}
			%>
			 
		</div>
		<div class="b_img">
       	 	<img src="images/home-right.png" alt="Doctor">
    	</div>
	</section>	
	
		<section class="features">
		
		<%
			if(session.getAttribute("user")==null){
		%>
				<a href="login.jsp" class="card1">
					<img src="images/doctor.png">
					<h3>Find Doctors</h3>
					<p>Search and find doctors easily and Book your appointments.</p>
				</a>
		<%
			}else{
		%>
				<a href="doctor.jsp" class="card1">
					<img src="images/doctor.png">
					<h3>Find Doctors</h3>
					<p>Search and find doctors easily and Book your appointments.</p>
				</a>
		<%
		}
		%>
				
		<%
			if(session.getAttribute("user")==null){
		%>
				<a href="login.jsp" class="card2">
					<img src="images/appointment.png">
					<h3>Manage Appointments</h3>
					<p>View your appointments and cancel at any time.</p>
				</a>
		<%
			}else{
		%>
				<a href="myAppointment.jsp" class="card2">
					<img src="images/appointment.png">
					<h3>Manage Appointments</h3>
					<p>View your appointments and cancel at any time.</p>
				</a>
		<%
			}
		%>
		
		<%
			if(session.getAttribute("user")==null){
		%>
				<a href="login.jsp" class="card3">
					<img src="images/reminder.png">
					<h3>Reminders</h3>
					<p>Get alerts and reminders for your appointments.</p>
				</a>
		<%
			}else{
		%>
				<a href="reminder.jsp" class="card3">
					<img src="images/reminder.png">
					<h3>Reminders</h3>
					<p>Get alerts and reminders for your appointments.</p>
				</a>
		<%
			}
		%>
	
		

</section>
	
	<section class="about" id="about">
		<div class="about_para">
			<h2>About Us</h2>

			<p>
			Welcome to our appointment booking system. We are dedicated to making healthcare services simple, fast, and convenient for everyone. Our platform allows users to easily search for doctors, check available time slots, and book appointments online without any hassle.
			</p>
			
			<p>
			We help you connect with trusted healthcare professionals easily and efficiently. Our goal is to save your valuable time by reducing long waiting queues and making the appointment process smooth and user-friendly.
			</p>
			
			<p>
			With features like appointment management, reminders, notifications, and secure access, our system provides a better healthcare experience for both patients and doctors. We aim to create a reliable digital solution that improves communication and accessibility in the medical field.
			</p>
			
		</div>
		<div class="a_img">
       	 	<img src="images/doc-right.png" alt="about-us">
    	</div>
		
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>