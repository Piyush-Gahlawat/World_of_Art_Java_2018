<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="tools.IdGenerator"%>
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
        <h1>Upload History</h1>
        <div class="content">        
        <input type="button" value="Upload Requests" class="c" name="up_request" onclick="redirect('<%=request.getContextPath()%>/upload_request_list.jsp');"/><br/>
        <input type="button" value="Uploaded Art" class="c" name="uploaded" onclick="redirect('<%=request.getContextPath()%>/uploaded_list.jsp');"/>
        </div>
        </div>
        </body>
</html>