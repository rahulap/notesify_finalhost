<%-- 
    Document   : IP_Store.jsp
    Created on : 28 Mar, 2015, 7:31:36 PM
    Author     : Rahulap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging out</title>
		<%
		java.util.Date now = new java.util.Date();
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.5.254.130:3306/main","adminneUhFbw","friendship96");
		Statement stmt = conn.createStatement();
		String user =(String)session.getAttribute("username");
		stmt.executeUpdate("Update LoginDetails SET Logout_Time=\'" + now.toString() +"\', Status=\'OUT\' where username=\'"+user+"\' AND Status=\'IN\'");
		session.invalidate();%>
		<script>
			window.location="index.jsp";
		</script>   
    </head>       
</html>
