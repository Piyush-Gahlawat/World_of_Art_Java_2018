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
            <%!
                    private String id;
                    private long aid;
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
                    private int customereditreq = 0;
            private int artisteditreq = 0;
            private int arteditreq = 0;
            private int artdeletereq = 0;
            private int artupreq = 0;
            private int totalartist = 0;
            private int totalcustomer = 0;
            private int totalart = 0;
                %>
        <%
             id = String.valueOf(session.getAttribute("admin"));
            aid = Integer.parseInt(id);
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                q1 = "select * from editartist";
                q2 = "select * from editcustomer";
                q3 = "select * from editartdb";
                q4 = "select * from deleteartdb";
                q5 = "select * from dummyartdb";
                q6 = "select * from artistdb";
                q7 = "select * from customerdb";
                q8 = "select * from artdb";
               try (Statement s = con.createStatement()) {
                    try (ResultSet r1 = s.executeQuery(q1)) {
                        while (r1.next()) {
                            artisteditreq++;
                        }
                        r1.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r2 = s.executeQuery(q2)) {
                        while (r2.next()) {
                            customereditreq++;
                        }
                        r2.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r3 = s.executeQuery(q3)) {
                        while (r3.next()) {
                            arteditreq++;
                        }
                        r3.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r4 = s.executeQuery(q4)) {
                        while (r4.next()) {
                            artdeletereq++;
                        }
                        r4.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r5 = s.executeQuery(q5)) {
                        while (r5.next()) {
                            artupreq++;
                        }
                        r5.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r6 = s.executeQuery(q6)) {
                        while (r6.next()) {
                            totalartist++;
                        }
                        r6.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r7 = s.executeQuery(q7)) {
                        while (r7.next()) {
                            totalcustomer++;
                        }
                        r7.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (ResultSet r8 = s.executeQuery(q8)) {
                        while (r8.next()) {
                            totalart++;
                        }
                        r8.close();
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
                Notifications
            </th>
            <tr>
                <td>
                    <%=artisteditreq%> Pending Artist Profile Edit Requests            
                </td>
            </tr>
            <tr>
                <td>
                    <%=customereditreq%> Pending Customer Profile Edit Requests                        
                </td>
            </tr>
            <tr>
                <td>
                    <%=artupreq%> Pending Art Upload Requests                        
                </td>
            </tr>
            <tr>
                <td>
                    <%=arteditreq%> Pending Art Edit Requests                        
                </td>
            </tr>
            <tr>
                <td>
                    <%=artdeletereq%> Pending Art Delete Requests                                    
                </td>
            </tr>
            <tr>
                <td>
                    <%=totalartist%> Artists Registered Yet       
                </td>
            </tr>
            <tr>
                <td>
                    <%=totalcustomer%> Customer Registered Yet           
                </td>
            </tr>
            <tr>
                <td>
                    <%=totalart%> Art Items Uploaded Yet            
                </td>
            </tr>
        </table>
    </body>
</html>
