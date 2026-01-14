<%-- 
Document   : homecontent
Created on : 11 Jan, 2018, 3:29:05 PM
Author     : mkl
--%>
<%@page import="tools.getdata"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

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
            <h1>Admin</h1>
            <div class="content">
                <div class="left">
                    <input type="button" class="c" value="Report Manager" onclick="redirect('<%=request.getContextPath()%>/report_manager.jsp');"/><br/>
                    <input type="button" class="c" value="Event Manager" onclick="redirect('<%=request.getContextPath()%>/event_manager.jsp');"/>
                </div>
                <div class="notification">
                    <%@include file="notifications.jsp" %>
                </div>
            </div>
        </div>
    </body>
</html>
