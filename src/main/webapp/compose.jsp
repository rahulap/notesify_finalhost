<%-- 
    Document   : New_User.jsp
    Created on : 31 Mar, 2015, 12:07:58 PM
    Author     : Rahulap
--%>

<html>
    <head>
  
        <title>Notesify</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="custom.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
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
			if(logfound.equals("false"))
			{%>
				window.location="index.jsp";
			<%}%>
        </script>
    </head>
    <body background="images/bgtxt_blue.jpg">
        <center>
        <br>
        <br>
        <img src ="images/title_new.png"><br>
       <div id="toptext">
       Short and Sweet, dear</div><br>
        <form name="myForm" action="send.jsp"  method="post">
           
            <table border="5" bordercolor="#ff0000" align="center" cellspacing="1" width="300" style="color:red">
                 <b>
                <tr>
                    <td align="center" >To:</td><td align="center"><input type="text" name="to" required="" minlength=5/></td>
                </tr>
                <tr>
                    <td align="center">Subject:</td><td align="center"><input type="text" name="sub" required="" maxlength=15 /></td>
                 </tr>
                 <tr>
                 <tr height=50>
                    <td align="center">Message:</td><td align="center"><textarea style="height: 130px;overflow-y:scroll; width: 170px; resize: none;" type="text" name="msg" required="" maxlength=160></textarea></td>
                </tr>
                </table><br>
         
              <input  type="submit" value="Send" id="submit"/><br></b>
        </form>
        </center>
    </body>
    
</html>
