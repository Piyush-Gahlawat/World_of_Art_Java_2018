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
            <h1>Edit Email</h1>
            <%
                String c_id = request.getParameter("c_id");
                String email = request.getParameter("email");
            %><form action='edit_artist_email.jsp' name="eemail" onsubmit="return(validatemail())">
                <table border="1">
                    <tr>
                        <td>
                            Old Email
                        </td>
                        <td>
                            <%=email%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Email
                        </td>
                        <td>
                            <input type="text" name="email">
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
