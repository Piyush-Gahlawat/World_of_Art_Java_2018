<%-- 
    Document   : index
    Created on : 1 May, 2018, 5:13:07 PM
    Author     : mkl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <script type="text/javascript" src="javascript/javascript.js"></script>
    </head>
    <body>
       <script type="text/javascript">
           setTimeout('redirect("<%=request.getContextPath()%>/home.jsp")', 10000);
        </script>
</body>
</html>
