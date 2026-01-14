<%-- 
    Document   : edit_art_desc_form
    Created on : 27 Mar, 2018, 3:18:11 PM
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
            <h1>Edit Description!</h1>
            <div class="content">
                <%
                    String artid = request.getParameter("art_id");
                    long art_id = Long.parseLong(artid);
                    String desc = request.getParameter("desc");
                %>        
                <form action='edit_art_desc_req.jsp' name="edartdesc" onsubmit="return(validateartdesc())" method="post">
                    <table border="1">
                        <tr>
                            <td>
                                Old Description
                            </td>
                            <td>
                                <%=desc%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                New Description
                            </td>
                            <td>
                                <input type="text" name="new_desc">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/art_edit.jsp');" >
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
