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
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <title>Admin Login</title>
    </head>
    <body>
        <table width="100%">
            <tr>
                <td>
                    <%@include file="jsp/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@include file="jsp/navigation.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@include file="jsp/page/admin/admin_login.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@include file="jsp/footer.jsp" %>
                </td>  
            </tr>  
        </table>
    </body>
</html>
