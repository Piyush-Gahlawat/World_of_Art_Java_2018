<%-- 
    Document   : notmanager
    Created on : 6 Mar, 2018, 5:25:42 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <h1>Notification Manager</h1>
            <div class="content">
                <input type="button" value="Artist Requests" class="c" onclick="redirect('<%=request.getContextPath()%>/artist_requests.jsp');"/><br/>
                <input type="button" value="Customer Requests" class="c" onclick="redirect('<%=request.getContextPath()%>/customer_requests.jsp');"/>
            </div>
        </div>
    </body>
</html>
