<%-- 
    Document   : logout
    Created on : 12 Mar, 2018, 6:30:59 PM
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
    </head>
    <body>
        <%
            session.setAttribute("admin", null);
            session.setAttribute("admin_pass", null);
            session.setAttribute("admin_email", null);
            session.setAttribute("admin_fname", null);
            session.setAttribute("admin_lname", null);
            session.invalidate();
        %>   
        <script type='text/javascript' >
            redirect("<%=request.getContextPath()%>/home.jsp");
        </script>
    </body>
</html>
