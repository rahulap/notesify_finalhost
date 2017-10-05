<%-- 
    Document   : display_Notes
    Created on : 20 Mar, 2015, 7:26:36 PM
    Author     : Rahulap
--%>
<%@page import="java.util.*" session="true"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Calendar"%>
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
			window.location="getNotes.jsp";
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
        <%
                    String finaltext = "",result="",getp="";
                    boolean red = false;
        try {
            
            Calendar now = Calendar.getInstance();
            String tempurl="http://ibatchnotes.blogspot.com/";
            result = request.getParameter("notinp");
            getp = request.getParameter("notinp");
			%>
			<script>
         var x = '<%=getp%>';
		 if(x.length==5)
		 {
			var n1 = x.charAt(3);
			var n2 = x.charAt(4);
				if((isNaN(n1)) || (isNaN(n2)))
				{
					window.alert("Enter a valid Ref.No");
					window.location="getNotes.jsp";
				}
		 }
		else
		{
				window.alert("Enter a valid Ref.No");
				window.location="getNotes.jsp";
		}
			<%
        int year = now.get(Calendar.YEAR);
        String htm="";
        tempurl = tempurl + year+"/";
        char[] mon = new char[2];
		if(getp.length()==5)
		{
        result.getChars(3,5,mon,0);
       // mon[0] = (char) (mon[0] - 48);
         //mon[1] = (char) (mon[1] - 48);
        tempurl = tempurl + Character.toString(mon[0]) +Character.toString(mon[1]) +"/";
         result = result.toUpperCase();
        tempurl = tempurl + result + ".html";
            URL url = new URL(tempurl);
            URLConnection con = url.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String line = null;
            boolean temp = false;
            while ((line = br.readLine()) != null) {
                if (temp) {
                    result = line;
                    if (result.contains("</div>")) {
                        break;
                    }
                    finaltext = finaltext + result + "\n";
                }
                if (line.contains("<div id=\"contents\">")) {
                    temp = true;
                }
               
            }
        }
		}
		catch (IOException e) {
            finaltext = "The notes for Reference ID " + result + " has not been uploaded yet.";
            
        }

         %>
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
    <div id="boxnote"><%=finaltext%></div>
     </body>
</html>