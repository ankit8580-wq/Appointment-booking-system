<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	
	String driverName="org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost:5432/MyDB";
	String userName = "postgres";
	String pass = "2580";
	
	try {
	    Class.forName(driverName);
	    Connection con = DriverManager.getConnection(url, userName, pass);
	
	    String qry = "DELETE FROM appointments WHERE id=?";
	    PreparedStatement ps = con.prepareStatement(qry);
	
	    ps.setInt(1, Integer.parseInt(id));
	
	    ps.executeUpdate();
	
	    ps.close();
	    con.close();
	%>
	    <script>
	    	alert("Booking Successful!");
		</script>
	<%
	    response.sendRedirect("myAppointment.jsp");
	
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