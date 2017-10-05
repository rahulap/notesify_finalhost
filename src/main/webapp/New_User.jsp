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
		function back()
		{
			window.location="index.jsp";
		}
        </script>
    </head>
    <body background="images/bgtxt_blue.jpg">
	<div id="toptext" style="float:left;"> <input  type="submit" value="Back" id="submit" onClick="back()"/></div>
        <center>
        <br>
        <br>
        <img src ="images/title_new.png"><br>
       <div id="toptext"> Welcome to Notesify, New User</div><br>
        <form name="myForm" action="New_User_Update.jsp"  method="post">
           
            <table border="5" bordercolor="#ff0000" align="center" cellspacing="1" width="300" style="color:red">
                 <b>
                <tr>
                    <td align="center" >First Name:</td><td align="center"><input type="text" name="fname" required=""/></td>
                </tr>
                <tr>
                    <td align="center">Last Name:</td><td align="center"><input type="text" name="lname" required=""/></td>
                 </tr>
                 <tr>
                  <tr>
                    <td align="center">Roll No:</td><td align="center"><input type="text" name="roll" required="" minlength=10 maxlength=10 /></td>
                </tr>
                <tr>
                    <td align="center">Semester:</td><td align="center"><input type="text" name="sem" required="" maxlength=1 /></td>
                </tr>
                    <td align="center">Username:</td><td align="center"><input type="text" name="usernamesu" required="" minlength=5 /></td>
                </tr>
                <tr>
                    <td align="center">Password:</td><td align="center"><input type="password" name="passwordsu" required="" minlength=8 maxlength=14 /></td>
                 </tr>
                 <tr>
                    <td align="center">Mobile No:</td><td align="center"><input type="text" name="number" required="" minlength=10 maxlength=10 /></td>
                </tr>
                </table><br>
              
              <input  type="submit" value="Sign Up" id="submit"/><br></b>
        </form>
        </center>
    </body>
    
</html>
