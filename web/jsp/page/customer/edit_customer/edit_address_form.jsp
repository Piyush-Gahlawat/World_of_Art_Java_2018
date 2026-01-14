<%-- 
    Document   : edit_address_form
    Created on : 22 Mar, 2018, 5:31:59 PM
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
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>Edit Address</h1>
            <%
                String c_id = request.getParameter("c_id");
                String address = request.getParameter("address");
            %>
            <form action='edit_customer_address.jsp' name="eaddress" onsubmit="return(validateadd())">
                <table border="1">
                    <tr>
                        <td>
                            Old Address
                        </td>
                        <td>
                            <%=address%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Address
                        </td>
                        <td>
                            <input type="text" name="address">
                            <input type="hidden" value="<%=c_id%>" name="c_id">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/home.jsp');" >
                        </td>
                        <td>
                            <input type="submit" class="formbutton" value="Submit">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
