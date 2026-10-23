<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="login-container">

        <div class="logo">
			<img src="images/logo.png" class="top-png">
            <h1>Welcome Back</h1>
            <p>Login to your account</p>
        </div>

        <form id="loginForm" onsubmit="return handleLogin()" method="post">
            
            <div class="f_group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
                
            </div>

            <div class="f_group">
                <label for="password">Password</label>
                <div class="pass">
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    
                </div>
            </div>


            <button type="submit" class="sub_btn">Login</button>
        </form>
        

        <div class="divider">
            <div class="line"></div>
                <span>OR</span>
            <div class="line"></div>
        </div>

        <div class="reg_link">
            Don't have an account? <a href="register.jsp">Register Now</a>
        </div>

        <div class="back">
            <a href="home.jsp">← Back to Home</a>
        </div>
    </div>
    
    <%
		if(request.getMethod().equalsIgnoreCase("POST")){
		
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		
		    String driverName="org.postgresql.Driver";
			String url = "jdbc:postgresql://localhost:5432/MyDB";
			String userName = "postgres";
			String pass = "2580";
			
			try {
			    Class.forName(driverName);
			    Connection con = DriverManager.getConnection(url, userName, pass);
		
		        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? and password=?");
		
		        ps.setString(1,email);
		        ps.setString(2,password);
		
		        ResultSet rs = ps.executeQuery();
		
		        if(rs.next()){
		            session.setAttribute("user", email);
		            
		            out.println("<script>");
		            out.println("alert('Logged in Successfully !!');");
		            out.println("window.location='home.jsp';");
		            out.println("</script>");
		        }
		        else{
		        	out.println("<script>");
		            out.println("alert('Invalid Email or Password');");
		            out.println("</script>");
		        }
		        ps.close();
		        rs.close();
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

    <script src="java/login.js"></script>
</body>
</html>