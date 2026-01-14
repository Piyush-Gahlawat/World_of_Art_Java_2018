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
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
        <title>Order History</title>
    </head>
    <body>
        <div class="content">
            <h1>Cart</h1>
            <div class="content">        
                <%!
                    String id;
                    long cid;
                    private String query;
                    private String s;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                %>                
                <%
                    id = String.valueOf(session.getAttribute("customer"));
                    cid = Long.parseLong(id);
                    query = "select * from orderdb where c_id='" + cid + "' and order_status='1' or pay_status='0'";
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet rs = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Order Id</th>
                    <th>Art Id</th>
                    <th>Picture</th>
                    <th>Price</th>
                    <th>Order Date</th>
                    <th>Order Status</th>
                    <th>Pay Status</th>
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
                                ResultSet r = p.executeQuery();
                                while (r.next()) {
                                    String pic = r.getString("art_path");
                    %>
                    <tr>
                        <td>
                            <%=order_id%>
                        </td>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "/" + pic%>" width="300px" height="300px"/>
                        </td>
                        <td>
                            <%=price%>
                        </td>
                        <td>
                            <%=o_date%>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <%
                                            if (o_stat.equals("0")) {
                                                out.print("Order In Way");
                                        %>
                                    </td>
                                <tr><td><form action="order_stat_change.jsp" method="post">
                                            <input type="hidden" value="<%=order_id%>" name="order_id"/>
                                            <input type="hidden" value="<%=art_id%>" name="art_id"/>
                                            <input type="hidden" value="<%=o_stat%>" name="o_stat"/>    
                                            <input type="hidden" value="<%=o_date%>" name="o_date"/>    
                                            <input type="submit" class="formbutton" value="Arrived"/> 
                                        </form>
                                    </td></tr><td>
                                    <%
                                        } else if (o_stat.equals("2")) {
                                            out.print("order arrived");

                                        } else {
                                            out.print("Order Canceled");
                                        }
                                    %>
                                    <form action="order_cancel.jsp" method="post">
                                        <input type="hidden" value="<%=order_id%>" name="order_id"/>
                                        <input type="hidden" value="<%=art_id%>" name="art_id"/>
                                        <input type="hidden" value="<%=o_stat%>" name="o_stat"/>    
                                        <input type="hidden" value="<%=o_date%>" name="o_date"/>    
                                        <input type="submit" class="formbutton" value="Cancel"/> 
                                    </form>
                                </td>
                    </tr>
                </table>
                </td>
                <td>
                    <%
                        if (p_stat.equals("0")) {
                            out.print("Unpaid");
                    %>
                    <form action="pay_stat_change.jsp" method="post">        
                        <input type="hidden" value="<%=order_id%>" name="order_id"/>
                        <input type="hidden" value="<%=art_id%>" name="art_id"/>
                        <input type="hidden" value="<%=p_stat%>" name="p_stat"/>    
                        <input type="hidden" value="<%=o_date%>" name="o_date"/>    
                        <input type="submit" class="formbutton" value="Pay">
                    </form>
                    <%
                        } else {
                            out.print("Paid");
                        }
                    %>
                </td>
                </tr>                
                <%
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