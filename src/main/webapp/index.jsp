<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.*" session="true"%>

<html>
    <head>
        <title>Notesify-Login Page</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="custom.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script>
		function Signup()
		{
			window.location="New_User.jsp"
		}
		<%
		try
		{
		String logfound=(String)session.getAttribute("log-found");
		if(logfound.equals("true"))
			{%>
				window.location="main.jsp";
			<%}
		}
		catch(Exception e)
		{
			session.setAttribute("log-found","false");
		}
			%>
		</script>
    </head>
    <body background="images/bgtxt_blue.jpg">	
	 <div id="toptext" align="right">New to Notesify?  <input  type="submit" value="Sign up" id="submit" onClick="Signup()"/></div>
        <center>
        <br>
        <br>
        <img src ="images/title_new.png"><br><br><br><br><br>
        <div id="toptext">Sign in to continue to Notesify</div>
        <br>
        <form name="myForm" action="Login_Validate.jsp"  method="post">
           
            <table border="1" align="center" width="300" style="color:red">
                 <b>
                <tr>
                    <td align="center">Username:</td><td align="center"><input type="text" required="" name="username"/></td>
                </tr>
                <tr>
                    <td align="center">Password:</td><td align="center"><input type="password" required="" name="password"/></td>
                 </tr>
              </table><br>
              <input  type="submit" value="Sign in" id="submit"/><br></b>
        </form>
        </center>
    </body>
    
</html>
