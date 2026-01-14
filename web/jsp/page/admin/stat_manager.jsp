<%-- 
    Document   : statmanager
    Created on : 6 Mar, 2018, 5:23:26 PM
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
        <div class="content">
            <h1>Status Manager</h1>
            <div class="content">
                <input type="button" class="c" value="Customer Manager" onclick="redirect('<%=request.getContextPath()%>/customer_manager.jsp');"/><br/>
                <input type="button" class="c" value="Artist Manager" onclick="redirect('<%=request.getContextPath()%>/artist_manager.jsp');"/><br/>
                <input type="button" class="c" value="Stock Manager" onclick="redirect('<%=request.getContextPath()%>/stock_manager.jsp');"/><br/>
                <input type="button" class="c" value="Order Manager" onclick="redirect('<%=request.getContextPath()%>/order_manager.jsp');"/><br/>
                <input type="button" class="c" value="Account Manager" onclick="redirect('<%=request.getContextPath()%>/account_manager.jsp');"/>
            </div>
        </div>
    </body>
</html>
