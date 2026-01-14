<%-- 
    Document   : home
    Created on : 31 Dec, 2017, 11:02:40 AM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
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
        <table class="nav">
            <tr>
                <td>
                    <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Gallery" onclick="redirect('<%=request.getContextPath()%>/gallery.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Login" onclick="redirect('<%=request.getContextPath()%>/login.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Register" onclick="redirect('<%=request.getContextPath()%>/register.jsp');">
                </td>
            </tr>
        </table>

    </body>
</html>
