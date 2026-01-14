<%-- 
    Document   : unblock
    Created on : 20 Mar, 2018, 4:41:49 PM
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
        <div class="content">
            <h1>Unblock</h1>
            <div class="content">
                <%
                    String uid = request.getParameter("uid");
                %>
                <form action="unblock_customer_mecha.jsp" name="ub" onsubmit="return (validateub())" method="post"> 
                    <input type="hidden" value="<%=uid%>" name="uid"><table>
                        <tr><td>Email</td> <td><input type="text" name="email"></td></tr>
                        <tr><td></td> <td><input type="submit" class="formbutton" value="Submit"></td></tr>
                    </table>
                </form>
            </div>
        </div>        
    </body>
</html>
