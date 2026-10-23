<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	String username = (String) session.getAttribute("user");
	if(username == null){ 
	    response.sendRedirect("login.jsp"); 
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>
<link rel="stylesheet" href="css/myAppointment.css">
</head>

<body>

	<%@ include file="nav.jsp" %>
	
	<div class="container">
	    <h1>My Appointments</h1>
	
	    <table border="1" cellspacing="5" cellpadding="10">
	        <tr>
	            <th>Doctor Name</th>
	            <th>Specialization</th>
	            <th>Date</th>
	            <th>Time</th>
	            <th>Action</th>
	        </tr>
	
	<%
	String driverName="org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost:5432/MyDB";
	String userName = "postgres";
	String pass = "2580";
	
	try {
	    Class.forName(driverName);
	    Connection con = DriverManager.getConnection(url, userName, pass);
	
	    String qry = "SELECT * FROM public.appointments WHERE username=?";
	    PreparedStatement ps = con.prepareStatement(qry);
	    ps.setString(1, username);
	
	    ResultSet rs = ps.executeQuery();
	
	    while(rs.next()) {
	%>
	
	        <tr>
	            <td><%= rs.getString("doctor_name") %></td>
	            <td><%= rs.getString("specialization") %></td>
	            <td><%= rs.getDate("appointment_date") %></td>
	            <td><%= rs.getString("appointment_time") %></td>
	            <td>
		        <a href="deleteApp.jsp?id=<%= rs.getInt("id") %>" 
		           onclick="return confirm('Are you sure you want to cancel this appointment?');" class="delete">Cancel</a>
    			</td>
	        </tr>
	
	<%
	    }
	} 
	catch(ClassNotFoundException ob) {
	    ob.printStackTrace();
	}
	catch(SQLException ob) {
	    ob.printStackTrace();
	}
	%>
	
	    </table>
	</div>
	
	<div class="foot">
	    <%@ include file="footer.jsp" %>
	</div>
</body>
</html>