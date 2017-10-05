<%-- 
    Document   : New_User_Update
    Created on : 31 Mar, 2015, 1:09:57 PM
    Author     : Rahulap
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating</title>
        <script>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String username=null,password=null;
			   boolean flag=false;
            boolean found = false;
            session.setAttribute("log-found","false");
            String last = request.getParameter("lname");
            String first = request.getParameter("fname");
            String rollno = request.getParameter("roll");
            String sem = request.getParameter("sem");
            String user = request.getParameter("usernamesu");
            String pass = request.getParameter("passwordsu");
            String mobile = request.getParameter("number");
            try{
                
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
            Statement stmt = conn.createStatement();
            String retrieve,notesify;
            retrieve = "insert into UserDetails values(\'"+first +"\',\'"+last +"\',\'"+rollno +"\',\'"+sem +"\',\'"+user +"\',\'"+pass +"\',\'"+mobile +"\')";
            notesify="insert into users values(\'"+user+"\',\'"+ pass + "\')";
            stmt.executeUpdate(retrieve);
            stmt.executeUpdate(notesify);
             stmt.close();
             conn.close();
            }
            catch(Exception e)
            {
				flag = true;
                %>
				window.alert("Sorry. Username already taken. Try again with a different Username.");
				window.location="New_User.jsp";
				<%
            }
			if(!flag)
			{
            
    %>
            window.alert("Sign Up Successful");
            window.location="index.jsp";
			<%
			}
			%>
            </script>
            </head>
            <body>
                
    </body>
</html>
