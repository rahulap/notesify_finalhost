<%-- 
    Document   : New_One
    Created on : 19 Mar, 2015, 10:13:54 PM
    Author     : Rahulap
--%>
<%@page import="java.util.*" session="true"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login-Validation</title>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String username=null;
			String password=null;
            boolean found = false;
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
            Statement stmt = conn.createStatement();
            String retrieve;
            retrieve = "SELECT * FROM users";
			String g = "Select * from UserDetails";
            ResultSet rs = stmt.executeQuery(retrieve);
             while(rs.next()){
                 username = rs.getString("USERNAME");
                 password = rs.getString("PASSWORD");
                 
                if(user.equals(username) && password.equals(pass))
                 {
                        found = true;
                        break;
                 }
             }
             rs.close();
             stmt.close();
             conn.close();
            }
           
            catch(Exception e)
            {
                out.print(e);
            }
            if(found)
			{
				String temp = null;
				try{
				Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
				Statement stmt = conn.createStatement();
				ResultSet rs1 = stmt.executeQuery("Select * from UserDetails where Username=\'" + user + "\'");
				rs1.next();
				temp = (String) rs1.getString("FirstName");
				session.setAttribute("username",username);
				session.setAttribute("FirstName",temp);
				session.setAttribute("log-found","true");
				java.util.Date now = new java.util.Date();
				stmt.executeUpdate("insert into LoginDetails values(\'" + temp +"\',\'" + username +"\',\'"+ request.getRemoteAddr() +"\',\'"+ now.toString() +"\',\'NA\',\'IN\')" );
				response.sendRedirect("main.jsp");
				}
				catch(Exception e)
				{
				}

			}
				
			
            else
            {           
                %>
                <script>
                    window.alert("Incorrect Username/Password.");
                    window.location="index.jsp";
                </script>
                <%
            }    
            
        
            %>
            </head>
            <body>
    </body>
</html>
