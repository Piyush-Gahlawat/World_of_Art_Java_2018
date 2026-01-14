<%-- 
    Document   : fgpassword
    Created on : 8 Mar, 2018, 8:47:08 PM
    Author     : mkl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
<div class="content">        
    <h1>Forgot Password</h1>
        <div class="content">        
    <form action="artist_get_question.jsp" name="fgpass" onsubmit="return (validatefgpass())" method="post">
        <table>
                <tr><td>UserID</td><td><input type="text" name="uid"></td></tr>
                <tr><td><input type="reset" class="formbutton" name="reset"></td>
                    <td><input type="submit" class="formbutton" name="submit"></td></tr>
            </table>
        </form>
</div>
</div>
    </body>
</html>
