<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
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
        <script type="text/javascript" src="javascript/javascript.js"></script>
    </head>
    <body>
        <div class="content">
            <h1>Manage Users</h1>
            <div class="content">
                <div class="left">
                    <input type="button" class="c" value="Manage Artists" onclick="redirect('<%=request.getContextPath()%>/manage_artist.jsp');"><br/>
                    <input type="button" class="c" value="Manage Customer" onclick="redirect('<%=request.getContextPath()%>/manage_customer.jsp');" >
                </div>
                <div class="notification">
                    <%@include file="notifications.jsp" %>
                </div>
            </div>
        </div>
    </body>
</html>
