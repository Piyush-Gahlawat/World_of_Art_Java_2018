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
            <h1>Artist Requests</h1>
            <div class="content">
                <input type="button" class="c" value="Edit Artist" onclick="redirect('<%=request.getContextPath()%>/edit_artist_requests.jsp');"><br/>
                <input type="button" class="c" value="Edit Art" onclick="redirect('<%=request.getContextPath()%>/edit_art_requests.jsp');" ><br/>
                <input type="button" class="c" value="Process Art Upload" onclick="redirect('<%=request.getContextPath()%>/unuploaded_art.jsp');" ><br/>
                <input type="button" class="c" value="Delete Art Request" onclick="redirect('<%=request.getContextPath()%>/delete_art.jsp');" ><br/>
            </div>
        </div>
    </body>
</html>
