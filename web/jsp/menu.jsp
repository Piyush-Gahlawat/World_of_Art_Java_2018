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
        <div class="menu">
            <table>
                <tr>
                    <td>
                        <input type="button" value="Home" class="menu" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
                    </td>
                    <td>
                        <%
                            if ((session.getAttribute("artist") == null) && (session.getAttribute("customer") == null) && (session.getAttribute("admin") == null)) {
                        %>       
                    <td>
                        <input type="button" value="Admin" class="menu" onclick="redirect('<%=request.getContextPath()%>/admin_login.jsp');">
                    </td>
                    <%
                        }
                    %>
                    <td>    
                        <input type="button" value="Contact" class="menu" onclick="redirect('<%=request.getContextPath()%>/contact.jsp');">
                    </td>
                    <td>
                        <input type="button" value="About Us" class="menu" onclick="redirect('<%=request.getContextPath()%>/about.jsp');">
                    </td>                
                    <td>
                        <input type="button" value="Help" class="menu" onclick="redirect('<%=request.getContextPath()%>/help.jsp');">
                    </td>                
                </tr>
            </table>
        </div>
    </body>
</html>
