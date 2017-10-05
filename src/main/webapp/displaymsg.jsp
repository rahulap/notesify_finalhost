<%-- 
    Document   : display_Notes
    Created on : 20 Mar, 2015, 7:26:36 PM
    Author     : Rahulap
--%>
<%@page import="java.util.*" session="true"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Notesify</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="custom.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script>
		function Logout()
		{
			window.location="Logout.jsp";
		}
		function back()
		{
			window.location="main.jsp";
		}
		<% String logfound=null;
			try
			{
			logfound=(String)session.getAttribute("log-found");
                 if(logfound==null)
                 {
                     session.setAttribute("log-found","false");
                     logfound="false";
                 }
                 
			}
			catch(Exception e)
			{
					session.setAttribute("log-found","false");
			}
			if(logfound.equals(null) || logfound.equals("false"))
			{%>
				window.location="index.jsp";
			<%}%>
			
		</script>
	</head>
    <body background="images/bgtxt_blue.jpg">
	<div>
	<div id="toptext" style="float:left;"> <input  type="submit" value="Back" id="submit" onClick="back()"/></div>
     <div id="toptext"style="float:right; display:inline-block;">Welcome, <%=session.getAttribute("FirstName")%>  <input  type="submit" value="Logout" id="submit" onClick="Logout()"/></div>
	</div>    
	<center>
        <br>
        <br>
        <img src ="images/title_new.png"><br><br><br>
        </center>
		<%
				int count=0;
				Class.forName("com.mysql.jdbc.Driver");
				String finaltext="";
				try{
				Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("Select * from MessageDetails where To_User=\'"+(String)session.getAttribute("username")+"\' and Status=\'WAIT\'" );
				while(rs.next())
				{
					count++;
					String from = rs.getString("From_User");
					String subject = rs.getString("Subject");
					String message = rs.getString("Message");
					finaltext = "<font color=red>From:</font> "+ from + "<hr><font color=red>Subject:</font> " + subject + "<hr><font color=red>Message:</font><br>" +message+"<br>";%>
					 <div id="msgnote"><%=finaltext%></div><br>
				<% 
				}
				if(count==0)
					response.sendRedirect("main.jsp");
				java.util.Date now = new java.util.Date();
				int i = stmt.executeUpdate("Update MessageDetails SET Received_Time=\'"+ now.toString() +"\',Status=\'READ\' where To_User=\'" +(String)session.getAttribute("username")+"\' and Status=\'WAIT\'");
		
				}
				catch(Exception e)
				{
						
				}
			%>
     </body>
</html>