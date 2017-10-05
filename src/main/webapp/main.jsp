<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.*" session="true"%>
<%@page import="java.sql.*"%>
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
		<% String logfound="false";
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
					logfound="false";
			}
			if(logfound.equals("false"))
			{%>
				window.location="index.jsp";
			<%}
					int i=0;
					try
					{
							 Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
							Statement stmt = conn.createStatement();
							String retrieve;
							retrieve = "Select * from MessageDetails where To_User=\'" +(String)session.getAttribute("username")+"\' and Status=\'WAIT\'";
							ResultSet rs = stmt.executeQuery(retrieve);
							while(rs.next())
							{
								i++;
							}
					}
					catch(Exception e)
					{
						
					}
			%>        
            function getNotes()
            {
                location.href="getNotes.jsp";
            }
            function search()
            {
                location.href="getSearch.jsp";
            }
            function getUpdates()
            {
                window.location="getUpdates.jsp";
            }
			function compose()
            {
                window.location="compose.jsp";
            }
			function displaymsg()
			{
				window.location="displaymsg.jsp";
			}
        </script>
    </head>
    <body background="images/bgtxt_blue.jpg">
	<div>
	<div id="toptext"style="float:left;"><button id="submit" onClick="compose()">Compose</button>&nbsp;&nbsp;</div>
	<%
		if(i==0)
		{
	%>
	<div id="toptext" style="float:left;display:inline-block"> <button  id="submit" style="background:grey; cursor:default; color:red;"disabled>Inbox</button></div>
	<%	
		}
		else
		{
			%>
			<div id="toptext" style="float:left;display:inline-block;"> <button id="submit" onClick="displaymsg()">Inbox &nbsp;<div id="inbox"  style="float:right;display:inline-block;" ><%=i%></div></button></div>
			<%
		}
	%>

     <div id="toptext"style="float:right; display:inline-block;">Welcome, <%=session.getAttribute("FirstName")%>  <input  type="submit" value="Logout" id="submit" onClick="Logout()"/></div>
	</div>    
        <center>
        <br>
        <br>
        <img src ="images/title_new.png"><br><br><br><br><br><br>
        <div><input type="submit" id="notesify_main" value="Get Notes"onClick="getNotes()"><br><br><br></div>
        <div><input type="submit" id="notesify_main" value="Search" onClick="search()"><br><br><br></div>
        <div><input type="submit" id="notesify_main" value="Updates" onClick="getUpdates()"><br></div>
        </center>
    </body>
</html>
