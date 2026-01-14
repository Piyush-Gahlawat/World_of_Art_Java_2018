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
        <script type="text/javascript" src="javascript/javascript.js"></script>
    </head>
    <body>
        <div class="content">
            <%
                session.setAttribute("artist", null);
                session.setAttribute("a_fname", null);
                session.setAttribute("a_lname", null);
                session.setAttribute("a_email", null);
                session.setAttribute("a_pass", null);
                session.setAttribute("a_gender", null);
                session.setAttribute("a_phone", null);
                session.setAttribute("a_reg_date", null);
                session.setAttribute("a_block_f", null);
                session.invalidate();
            %>   
            <script type='text/javascript' >
                redirect("<%=request.getContextPath()%>/home.jsp");
            </script>
        </div>    
    </body>
</html>