<%-- 
    Document   : order_history
    Created on : 20 Jan, 2018, 3:47:54 PM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Statement"%>
<%@page import="tools.getdata"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <h1>Order History</h1>
            <div class="content">
            <%!
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                String id;
                 private String query;
                 private String s;
                long cid;
%>
                <%
                    id = String.valueOf(session.getAttribute("customer"));
                    cid = Long.parseLong(id);
                    query = "select * from orderdb where c_id=?";
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setLong(1, cid);
                            try (ResultSet rs = ps.executeQuery()) {

                %>
                <table class="wide"><thead>
                    <th>Order Id</th>
                    <th>Price</th>
                    <th>Art Id</th>
                    <th>Order Date</th>
                    <th>Order Status</th>
                    <th>Pay Status</th>
                    <th>Picture</th>
                    </thead>
                    <%                
                        while (rs.next()) {
                            long order_id = rs.getLong("order_id");
                            long art_id = rs.getLong("art_id");
                            int price = rs.getInt("amount");
                            String o_stat = rs.getString("order_status");
                            String p_stat = rs.getString("pay_status");
                            Date o_date = rs.getDate("order_date");
                             s = "select * from artdb where art_id='" + art_id + "'";
                            try (PreparedStatement p = con.prepareStatement(s)) {
                                try (ResultSet r = p.executeQuery()) {
                                    while (r.next()) {
                                        String pic = r.getString("art_path");
                    %>
                    <tr>
                        <td>
                            <%=order_id%>
                        </td>
                        <td>
                            &#x20b9 <%=price%>
                        </td>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=o_date%>
                        </td>
                        
                        <td>
                        <td>
                        <%
                            if (p_stat.equals("0")) {
                                out.print("Unpaid");
                            } else {
                                out.print("Paid");
                            }
                            %>
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + pic%>" width="400px" height="400px"/>
                        </td>
                    </tr>                
                    <%
                                    }
                                    r.close();
                                } catch (SQLException ex) {
                                    out.print(ex);
                                }
                                p.close();
                            } catch (IOException | SQLException ex) {
                                out.print(ex);
                            }
                        }
                    %>


                </table>     
                <%
                                rs.close();
                            } catch (SQLException ex) {
                                out.print(ex);
                            }
                            ps.close();
                        } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                %>
            </div>
        </div>
    </body>
</html>