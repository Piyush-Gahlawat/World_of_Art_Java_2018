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
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>Artist</h1>
            <div class="content">
                <input type="button" class="c" value="My Art" onclick="redirect('<%=request.getContextPath()%>/upload_history.jsp');"/><br/>
                <input type="button" class="c" value="Upload Art" onclick="redirect('<%=request.getContextPath()%>/upload_art.jsp');"/><br/>
                <input type="button" class="c" value="Edit Profile" onclick="redirect('<%=request.getContextPath()%>/edit_artist.jsp');"/><br/>
                <input type="button" class="c" value="Delete Profile" onclick="redirect('<%=request.getContextPath()%>/artist_delete.jsp');"/>
            </div>
        </div>
    </body>
</html>
