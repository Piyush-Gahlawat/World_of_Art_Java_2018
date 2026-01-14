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
            <h1>Edit Address</h1>
            <div class="content">
                <%
                    String a_id = request.getParameter("a_id");
                    String address = request.getParameter("address");
                %>
                <form action='edit_artist_address.jsp' name="eaddress" onsubmit="return (validateadd())" method="post">
                    <table >
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
                                <textarea rows="5" columns="70" name="address" placeholder="Address" required>
                                </textarea>
                                <input type="hidden" value="<%=a_id%>" name="a_id">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" class="formbutton" value="Back" onclick="redirect('<%=request.getContextPath()%>/edit_artist.jsp');" >
                            </td>
                            <td>
                                <input type="submit" class="formbutton" value="Submit">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
