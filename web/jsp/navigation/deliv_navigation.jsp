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
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <table class="nav">
            <tr>
                <td>
                    <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/customer.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Galley" onclick="redirect('<%=request.getContextPath()%>/gallery.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Order History" onclick="redirect('<%=request.getContextPath()%>/order_history.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Cart" onclick="redirect('<%=request.getContextPath()%>/cart.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Edit Profile" onclick="redirect('<%=request.getContextPath()%>/edit_customer.jsp');">
                </td>
                <td>
                    <input type="button" class="navbutton" value="Logout" onclick="redirect('<%=request.getContextPath()%>/c_logout.jsp');">
                </td>
            </tr>
        </table>
    </body>
</html>
