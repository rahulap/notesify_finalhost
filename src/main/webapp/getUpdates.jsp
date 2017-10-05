<%-- 
    Document   : getUpdates
    Created on : 20 Mar, 2015, 7:24:32 PM
    Author     : Rahulap
--%>
<%@page import="java.util.*" session="true"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Notesify-Updates</title>
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
        <img src ="images/title_new.png"><br><br><br><br><br>
        </center>
            <%
         String f="";
        
        boolean comp = false;
		 URL url;
            try {
                
                //create url object to point to the file location on internet
                url = new URL("http://ibatchnotes.blogspot.in/2015/03/updates.html");
                //make a request to server
                HttpURLConnection con=(HttpURLConnection)url.openConnection();
                //get InputStream instance
                InputStream is=con.getInputStream();
                //create BufferedReader object
                BufferedReader br=new BufferedReader(new InputStreamReader(is));
                String line;
                boolean temp=false;
               
                boolean breaker = false;
                //read content of the file line by line
                while((line=br.readLine())!=null){
                    if(line.contains("<div id=\"updates\">")) {
                        temp = true;
                        breaker = true;
                    }
                    if(line.contains("</div>") && breaker)
                    {
                        comp = true;
                        break;
                    }
                    if(temp)
                        f+=line;

                }
                
            }catch (Exception e) {
                e.printStackTrace();
                
            }
            %>
         
         <div id="box"><center><%=f%></center></div>
    </body>
</html>

