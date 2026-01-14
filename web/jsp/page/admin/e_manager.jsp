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
            <h1>Events</h1>
            <div class="content">
                <input type="button" class="c" value="Status Manager" onclick="redirect('<%=request.getContextPath()%>/status_manager.jsp');"><br/>
                <input type="button" class="c" value="Notification Manager" onclick="redirect('<%=request.getContextPath()%>/notification_manager.jsp');" ><br>
                <input type="button" class="c" value="Manage Users" onclick="redirect('<%=request.getContextPath()%>/manage_users.jsp');" >
            </div>
        </div>
    </body>
</html>
