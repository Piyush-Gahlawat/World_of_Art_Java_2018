<%-- 
    Document   : chpassword
    Created on : 8 Mar, 2018, 8:36:32 PM
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
            <h1>Change Password</h1>
            <div class="content">        
                <%
                    String pass = request.getParameter("pass");

                %>
                <form name="chpass" action="customer_chpass.jsp" method="post">
                    <table>
                        <tr><td>New Password</td>
                            <td><input  type="text" name="new"></td></tr>                
                        \                <tr><td><input type="reset" class="formbutton" name="reset"></td>
                            <td><input type="submit" class="formbutton" name="submit"></td></tr>
                    </table>

                </form>
            </div>
        </div>
    </body>
</html>
