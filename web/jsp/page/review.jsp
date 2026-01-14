<%-- 
    Document   : home
    Created on : 31 Dec, 2017, 11:02:40 AM
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

        <%
            if (session.getAttribute("admin") != null) {
        %>   
        <%@include file="review_admin.jsp"%>
        <%        } else if (session.getAttribute("artist") != null) {
        %>
        <%@include file="review_artist.jsp"%>
        <%        } else if (session.getAttribute("customer") != null) {
        %>
        <%@include file="review_customer.jsp"%>
        <%        } else {
        %>      
        <%@include file="review_anonymous.jsp"%>        
        <%            }
        %>
    </body>
</html>
