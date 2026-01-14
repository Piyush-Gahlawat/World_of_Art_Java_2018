<%-- 
    Document   : logout
    Created on : 12 Mar, 2018, 6:30:59 PM
    Author     : mkl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("customer", null);
            session.setAttribute("c_fname", null);
            session.setAttribute("c_lname", null);
            session.setAttribute("c_email", null);
            session.setAttribute("c_pass", null);
            session.setAttribute("c_gender", null);
            session.setAttribute("c_phone", null);
            session.setAttribute("c_reg_date", null);
            session.setAttribute("c_block_f", null);
            session.invalidate();
            response.sendRedirect("index.html");
        %>   
    </body>
</html>
