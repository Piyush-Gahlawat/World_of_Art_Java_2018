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
            <h1>Edit Price</h1>
            <div class="content">
                <%
                    String artid = request.getParameter("art_id");
                    long art_id = Long.parseLong(artid);
                    String price = request.getParameter("price");
                %>        
                <form action='edit_art_price_req.jsp' method="get" name="edartp" onsubmit="return(validateartprice())" method="post">
                    <table border="1">
                        <tr>
                            <td>
                                Old Price
                            </td>
                            <td>
                                <%=price%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                New Price
                            </td>
                            <td>
                                <input type="text" name="new_price">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/report_manager.jsp');" >
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
