<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   
<% 
	String username = (String) session.getAttribute("user");

	if(username == null){ 
	    response.sendRedirect("login.jsp"); 
	} 
%> 
	 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Doctors</title>
<link rel="stylesheet" href="css/doctor.css">
</head>
<body>
	<%@ include file="nav.jsp" %>
	<div class="container">
	    <h1>Doctors</h1>
	
	<%
	String driverName="org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost:5432/MyDB";
	String userName = "postgres";
	String pass = "2580";
	
	try {
	    Class.forName(driverName);
	    Connection con = DriverManager.getConnection(url, userName, pass);
		
	    String qry="SELECT * FROM doctors";
	    PreparedStatement ps = con.prepareStatement(qry);
	    ResultSet rs = ps.executeQuery();
	
	    while(rs.next()) {
	%>	
	
	    <div class="dcard">
	        <img src="<%= request.getContextPath() %>/images/<%= rs.getString("image") %>">
	
	        <div class="info">
	            <h3><%= rs.getString("doc_name") %></h3>
	            <p><%= rs.getString("specialization") %></p>
	            <p class="fee">Fee: Rs. <%= rs.getInt("fee") %></p>
	        </div>
	
	        <a href="appointment.jsp?doc_name=<%= rs.getString("doc_name") %>&specialization=<%= rs.getString("specialization") %>" class="btn">
	            Book Appointment
	        </a>
    </div>

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
	</div>
	<div class="foot">
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>