<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
        <h1>Help</h1>        
        <div class="content">
            <ul>
        <li><a href="<%= request.getContextPath()%>/home_map.jsp"> home Site Map</a></li>
        <li><a href="<%= request.getContextPath()%>/artist_map.jsp"> Artist Site Map</a></li>
        <li><a href="<%= request.getContextPath()%>/customer_map.jsp"> Customer Site Map</a></li>
        <li><a href="<%= request.getContextPath()%>/admin_map.jsp"> Admin Site Map</a></li>
            </ul>
        </div>
        </div>
    </body>
</html>
