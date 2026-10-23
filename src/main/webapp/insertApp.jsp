<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String username = (String) session.getAttribute("user");	
	if(username == null){
	    response.sendRedirect("login.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String doctorName = request.getParameter("doc_name");
		String specialization = request.getParameter("specialization");
		String date = request.getParameter("app_date");
		String time = request.getParameter("app_time");
		
		String driverName="org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/MyDB";
		String userName = "postgres";
		String pass = "2580";
		
		try {
		    Class.forName(driverName);
		    Connection con = DriverManager.getConnection(url, userName, pass);
		
		    String qry = "INSERT INTO appointments(username,doctor_name,specialization,appointment_date,appointment_time) VALUES (?, ?, ?, ?, ?)";
		    PreparedStatement ps = con.prepareStatement(qry);
		    ps.setString(1, username);
		    ps.setString(2, doctorName);
		    ps.setString(3, specialization);
		    ps.setDate(4, java.sql.Date.valueOf(date));
		    ps.setString(5, time);
		
		    ps.executeUpdate();
		    ps.close();
		    con.close();	
	%>
		    <script>
			    alert("Booking Successful!");
			    window.location.href = "myAppointment.jsp";
			</script>
	<%		
		} 
		catch(ClassNotFoundException ob) {
		    ob.printStackTrace();
		}
		catch(SQLException ob) {
		    ob.printStackTrace();
		}
	%>

</body>
</html>