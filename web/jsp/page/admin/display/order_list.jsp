<%-- 
    Document   : up_req_list
    Created on : 20 Mar, 2018, 11:10:46 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
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
            <h1>Order Report</h1>
            <div class="content">
                <%!
String id;
long aid;
private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
long o_id;
long art_id;
long c_id;
private Date order_date;
                    private String address;
                    private String pstat;
                    private String ostat;
                    private int amount;
                %>
                <%
                    id = String.valueOf(session.getAttribute("admin"));
                    aid = Integer.parseInt(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        String query = "select * from orderdb;";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Order Id</th>
                    <th>Art Id</th>
                    <th>Customer Id</th>
                    <th>Order Date</th>
                    <th>Address</th>
                    <th>Amount(&#x20b9)</th>
                    <th>Order Status</th>
                    <th>Pay Status</th>
                    </thead>
                    <%
                        while (r.next()) {
                            o_id = r.getLong("order_id");
                            art_id = r.getLong("art_id");
                            c_id = r.getInt("c_id");
                            order_date = r.getDate("order_date");
                            address = r.getString("address");
                            pstat = r.getString("pay_status");
                            ostat = r.getString("order_status");
                            amount = r.getInt("amount");
                    %>
                    <tr>
                        <td>
                            <%=o_id%>
                        </td>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=c_id%>
                        </td>
                        <td>
                            <%=order_date%>
                        </td>
                        <td>
                            <%=address%>
                        </td>
                        <td>
                            <%=amount%>
                        </td>
                        <td>
                            <%
                                if (ostat.equals("0")) {
                                    out.print("Not Delivered");
                                } else if(ostat.equals("1")){
                                    out.print("Canceled");
                                }else{
                                out.print("Delivered");
                                    
                                }
                            %>
                        
                        </td>
                        <td>
                            
                        <%
                            if (pstat.equals("0")) {
                                out.print("Unpaid");
                            } else {
                                out.print("Paid");
                            }
                            %>
                        </td> 
                   </tr>
                    <%
                        }
                    %>
                </table>     
                <%
                                r.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            ps.close();
                        } catch (IOException | SQLException ex) {
                            out.println(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.println(ex);
                    }
                %>
                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/report_manager.jsp');" >
            </div>
        </div>
    </body>
</html>