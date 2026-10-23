<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
	<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<div class="register-container">
		<div class="logo">
	    	<img src="images/logo.png" class="top-png" width="110px">
	    	<h1>Create Account</h1>
    		<p>Register to get started</p>
		</div>

    	<form onsubmit="return validateForm()" method="post">

        	<div class="fgroup">
            	<label>Full Name</label>
            	<input type="text" id="name" name="name" placeholder="Enter your name" required>
        	</div>

        	<div class="fgroup">
            	<label>Email</label>
            	<input type="email" id="email" name="email" placeholder="Enter your email" required>
        	</div>

        	<div class="fgroup">
            	<label>Password</label>
            	<div class="password-box">
	            	<input type="password" id="password" name="password" placeholder="Enter password" required>
            	</div>
        	</div>

	        <div class="fgroup">
	            <label>Confirm Password</label>
	            <div class="pbox">
	            	<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required>
	            </div>
	        </div>

        	<button type="submit" class="btn">Register</button>

    	</form>

	    <div class="link">
	        Already have an account? <a href="login.jsp">Login</a>
	    </div>

	</div>
	
	

	<%
if(request.getMethod().equalsIgnoreCase("POST")){

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String driverName="org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost:5432/MyDB";
	String userName = "postgres";
	String pass = "2580";
	
	try {
	    Class.forName(driverName);
	    Connection con = DriverManager.getConnection(url, userName, pass);

        PreparedStatement ps1 =
        con.prepareStatement("SELECT * FROM users WHERE email=?");

        ps1.setString(1,email);

        ResultSet rs = ps1.executeQuery();

        if(rs.next()){

            out.println("<script>");
            out.println("alert('User already registered! Please login.');");
            out.println("location='register.jsp';");
            out.println("</script>");

        }
        else{

            String qry =
            "INSERT INTO users(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(qry);

            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,password);

            int i = ps.executeUpdate();

            if(i > 0){
                out.println("<script>");
                out.println("alert('Registered Successfully');");
                out.println("location='login.jsp';");
                out.println("</script>");
            }
            else{
                out.println("<script>");
                out.println("alert('Registration Failed');");
                out.println("location='register.jsp';");
                out.println("</script>");
            }

            ps.close();
        }

        rs.close();
        ps1.close();
        con.close();

    }
    catch(ClassNotFoundException e){
        out.println(e);
    }
    catch(SQLException e){
        out.println(e);
    }

}
%>

	<script src="java/register.js"></script>
</body>
</html>