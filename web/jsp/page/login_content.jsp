<%-- 
    Document   : homecontent
    Created on : 11 Jan, 
2018, 3:29:05 PM
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
            <h1>Log-In</h1>
            <div class="content">
                <input type="button" value="Customer" class="c" onclick="redirect('<%=request.getContextPath()%>/customer_login.jsp');"><br/>
                <input type="button" value="Artist" class="c" onclick="redirect('<%=request.getContextPath()%>/artist_login.jsp');">
            </div>
        </div>
    </body>
</html>
