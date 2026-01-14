<%-- 
    Document   : edit_address_form
    Created on : 22 Mar, 2018, 5:31:59 PM
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
            <h1>Edit Phone</h1>
            <div class="content">
                <%
                    String a_id = request.getParameter("a_id");
                    String phone = request.getParameter("phone");
                %>
                <form action='edit_artist_phone.jsp' name="eph" onsubmit="return(validatephone())" method="post">
                    <table border="1">
                        <tr>
                            <td>
                                Old Phone
                            </td>
                            <td>
                                <%=phone%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                New Phone
                            </td>
                            <td>
                                <input type="text" name="phone">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" value="back" onclick="redirect('<%=request.getContextPath()%>/report_manager.jsp');" >
                            </td>
                            <td>
                                <input type="submit" name="Submit">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
