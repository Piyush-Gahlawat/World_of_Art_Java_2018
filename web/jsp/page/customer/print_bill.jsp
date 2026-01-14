<%-- 
    Document   : print_bill
    Created on : 28 Mar, 2018, 9:40:51 AM
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
            <h1>Bill</h1>
            <div class="content">
                <div class="t">
                    <table>
                        <tr><td>Order ID</td>
                            <td>
                                <%
                                    String o_id = request.getParameter("o_id");
                                    out.println(o_id);
                                %>
                            <td></td>
                        </tr>
                        <tr><td>Customer ID</td>
                            <td>
                                <%
                                    String c_id = request.getParameter("c_id");
                                    out.println(c_id);
                                %>
                            <td></td>
                        </tr>
                        <tr><td>Name</td>
                            <td>
                                <%
                                    String fname = (String) session.getAttribute("c_fname");
                                    String lname = (String) session.getAttribute("c_lname");
                                    out.println(fname + " " + lname);
                                %></td></tr>
                        <tr><td>Address</td>
                            <td>
                                <%
                                    String address = request.getParameter("address");
                                    out.print(address);
                                %>
                            </td></tr>
                        <tr><td>Order Placed on</td>
                            <td>
                                <%
                                    String o_date = request.getParameter("date");
                                    out.print(o_date);
                                %>
                            </td></tr>
                        <tr><td>The Order Due</td>
                            <td>&#x20b9
                                <%
                                    String amount = request.getParameter("amount");
                                    out.print(" "+amount);
                                %>
                            </td></tr>
                        <tr><td>Customer Phone</td>
                            <td>
                                <%
                                    String phone = (String) session.getAttribute("c_phone");
                                    out.print(phone);
                                %>
                        <tr>
                            <td><input type="button" value="Print" onclick='window.print()'></td>
                            <td><input type="button" value="Go to Gallery" onclick="redirect('<%=request.getContextPath()%>/gallery.jsp')"</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
