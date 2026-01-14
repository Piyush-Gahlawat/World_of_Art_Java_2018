<%-- 
    Document   : notifications
    Created on : 26 Mar, 2018, 3:14:16 PM
    Author     : mkl
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="content">
            <h1>Account Manager</h1>
            <div class="content">        <%!
            String id;
            long aid;
            private String dburl = getdata.url();
            private String dbuser = getdata.user();
            private String dbpass = getdata.password();
            private String q;
            private String q1;
            private String q2;
            private String q3;
            private String q4;
            private String q5;
            private String q6;
            private String q7;
            private String q8;
            private String q9;
            private int uaup = 0;
            private int uap = 0;
            private int aup = 0;
            private int ap = 0;
            private int ua = 0;
            private int up = 0;
            private int a = 0;
            private int p = 0;
            private int uaupc = 0;
            private int uapc = 0;
            private int aupc = 0;
            private int apc = 0;
            private int uac = 0;
            private int upc = 0;
            private int ac = 0;
            private int pc = 0;
            private int all = 0;
            private int allc = 0;
                %>
                <%
                    id = String.valueOf(session.getAttribute("admin"));
                    aid = Integer.parseInt(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        q1 = "select * from orderdb";
                        q2 = "select * from orderdb where order_status='0' and pay_status='0'";
                        q3 = "select * from orderdb where order_status='0' and pay_status='1'";
                        q4 = "select * from orderdb where order_status='2' and pay_status='0'";
                        q5 = "select * from orderdb where order_status='2' and pay_status='1'";
                        q6 = "select * from orderdb where order_status='0'";
                        q7 = "select * from orderdb where pay_status='0'";
                        q8 = "select * from orderdb where order_status='1'";
                        q9 = "select * from orderdb where pay_status='1'";
                        try (Statement s = con.createStatement()) {
                            try (ResultSet r1 = s.executeQuery(q1)) {
                                while (r1.next()) {
                                    allc = +r1.getInt("commission");
                                    all++;
                                }
                                r1.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r2 = s.executeQuery(q2)) {
                                while (r2.next()) {
                                    uaupc = +r2.getInt("commission");
                                    uaup++;
                                }
                                r2.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r3 = s.executeQuery(q3)) {
                                while (r3.next()) {
                                    uapc = +r3.getInt("commission");
                                    uap++;
                                }
                                r3.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r4 = s.executeQuery(q4)) {
                                while (r4.next()) {
                                    aupc = +r4.getInt("commission");
                                    aup++;
                                }
                                r4.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r5 = s.executeQuery(q5)) {
                                while (r5.next()) {
                                    apc = +r5.getInt("commission");
                                    ap++;
                                }
                                r5.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r6 = s.executeQuery(q6)) {
                                while (r6.next()) {
                                    uac = +r6.getInt("commission");
                                    ua++;
                                }
                                r6.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r7 = s.executeQuery(q7)) {
                                while (r7.next()) {
                                    upc = +r7.getInt("commission");
                                    up++;
                                }
                                r7.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r8 = s.executeQuery(q8)) {
                                while (r8.next()) {
                                    ac = +r8.getInt("commission");
                                    a++;
                                }
                                r8.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            try (ResultSet r9 = s.executeQuery(q9)) {
                                while (r9.next()) {
                                    pc = +r9.getInt("commission");
                                    p++;
                                }
                                r9.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            s.closeOnCompletion();
                        } catch (IOException | SQLException ex) {
                            out.println(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.println(ex);
                    }
                %>
                <table><th>
                        Account Details
                    </th>
                    <tr>
                        <td>
                            <%=all%> All deliveries overall worth &#x20b9 <%=allc%>
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td>
                            <%=uaup%> Pending deliveries with payment due with Commission worth &#x20b9 <%=uaupc%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=uap%> Pending deliveries with payment done with Commission worth &#x20b9 <%=uapc%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=aup%> Deliveries with payment due with Commission worth &#x20b9 <%=aupc%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=ap%> Deliveries with payment done with Commission worth &#x20b9 <%=apc%>                   
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=ua%> Pending deliveries with Commission worth &#x20b9 <%=uac%>                                  
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=up%> Payments Due with Commission worth &#x20b9 <%=upc%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=a%> Deliveries Done with Commission worth &#x20b9 <%=ac%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=p%> Payments of Commission Received Overall &#x20b9 <%=pc%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>