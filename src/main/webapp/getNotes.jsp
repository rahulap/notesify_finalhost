<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.*" session="true"%>
<html>
    <head>
        <title>Notesify-Get Notes</title>
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
                 
			}	catch(Exception e)
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
	</div>    <center>
        <br>
        <br>
        <img src ="images/title_new.png"><br><br><br><br>
        <div id="toptext">Enter Reference Number</div><br>
        <form name="Notes" action="display_Notes.jsp">
        <input type="text" maxlength=5 placeholder="Enter Ref.No" id="notinp" name="notinp"  align="center"/><br><br>
        <input  type="submit" value="GET NOTES" id="submit" name="submit" onClick="test()"/>
        </form>
        </center>
    </body>
</html>
