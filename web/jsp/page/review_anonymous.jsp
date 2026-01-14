<%-- 
    Document   : stock_display
    Created on : 21 Mar, 2018, 3:52:19 PM
    Author     : mkl
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="tools.average_rating"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><div class="content">
            <h1>Art Details</h1>
            <div class="content">
                <table >
                    <tr>
                        <td>
                            <%
                                int count=0;
                                int a;
                                int b;
                                int c;

      String dburl = getdata.url();
String dbuser = getdata.user();
String dbpass = getdata.password();

                                String artid = request.getParameter("art_id");
                               long art_id = Long.parseLong(artid);
                                Class.forName("com.mysql.jdbc.Driver");
                                try (Connection con = DriverManager.getConnection(dburl,dbuser, dbpass)) {
                                String q1 = "select * from artdb where art_id=?";
                                    try (PreparedStatement p1 = con.prepareStatement(q1)) {
                                        p1.setLong(1, art_id);
                                        try (ResultSet r1 = p1.executeQuery()) {
                                            while (r1.next()) {
                                                String artpath = r1.getString("art_path");
                                                int art_price = r1.getInt("art_price");
                                                String arttype = r1.getString("art_type");
                                                String artdesc = r1.getString("description");
                            %>
                            <table >
                                <tr>
                                    <td>
                                        <table >
                                            <tr>
                                                <td>
                                                    <img src="<%=request.getContextPath() + "" + artpath%>" width="500px" height="500px"/>
                                                </td>
                                                <td>
                                                    <table class="artdetails">
                                                        <tr><td>Art ID:</td>    
                                                            <td><%=art_id%></td></tr>    
                                                        <tr><td>Price:</td>    
                                                            <td><%=art_price%></td></tr>    
                                                        <tr><td>Type:</td>    
                                                            <td><%=arttype%></td></tr>    
                                                        <tr><td>Description:</td>    
                                                            <td><%=artdesc%></td></tr>    
                                                            <%
                                                                }
                                                            %>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                <tr>
                                    <td>
                                        <table >
                                            <%
                                                        r1.close();
                                                    } catch (SQLException ex) {
                                                        out.println(ex);
                                                    }
                                                    p1.close();
                                                } catch (IOException | SQLException ex) {
                                                    out.println(ex);
                                                }
                                                 String q2 = "select * from ratings where art_id=?";
                                                try (PreparedStatement p2 = con.prepareStatement(q2)) {
                                                    p2.setLong(1, art_id);
                                                    try (ResultSet r2 = p2.executeQuery()) {
                                            %>
                                            <tr>
                                                <td>
                                                    <table class="ratecount">
                                                        <thead>
                                                        <th>One Star Hits</th>
                                                        <th>Two Star Hits</th>
                                                        <th>Three Star Hits</th>
                                                        <th>Overall Star</th>
                                                        </thead>
                                                        <%
                                                            while (r2.next()) {
                                                              int one = r2.getInt("one");
                                                                int two = r2.getInt("two");
                                                                int three = r2.getInt("three");
                                                               a = +one;
                                                               b = +two;
                                                               c = +three;
                                                               count++;
                                                               float af = a;
                                                               float bf = b;
                                                                float cf = c;
                                                        %>
                                                        <tr>
                                                            <td>   
                                                                <%=a%>
                                                            </td>
                                                            <td>   
                                                                <%=b%>                                                                
                                                            </td>
                                                            <td>   
                                                                <%=c%>                                                                
                                                            </td>

                                                            <td>   
                                                                <%
                                                                    average_rating avgr = new average_rating();
                                                                    out.println(avgr.average_rating(af, bf, cf, count));
                                                                %>                                                                                                                    </tr>                
                                                            <%
                                                                }
                                                            %>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%
                                            r2.close();
                                        } catch (SQLException ex) {
                                            out.println(ex);
                                        }
                                        p2.close();
                                    } catch (IOException | SQLException ex) {
                                        out.println(ex);
                                    }
                                    String q3 = "select * from review where art_id=?";
                                    try (PreparedStatement p3 = con.prepareStatement(q3)) {
                                        p3.setLong(1, art_id);
                                        try (ResultSet r3 = p3.executeQuery()) {
                                            while (r3.next()) {
                                                long ar_id = r3.getLong("art_id");
                                                long c_id = r3.getLong("c_id");
                                                String review = r3.getString("review");
                                                Date dor = r3.getDate("date_of_review");
                                                String q4 = "select * from customerdb where c_id=?";
                                                try (PreparedStatement p4 = con.prepareStatement(q4)) {
                                                    p4.setLong(1, c_id);
                                                    try (ResultSet r4 = p4.executeQuery()) {
                                %>
                                <tr>
                                    <td>
                                        <table>        
                                            <%
                                                while (r4.next()) {
                                                    String reviewer_fname = r4.getString("c_f_name");
                                                    String reviewer_lname = r4.getString("c_l_name");
                                            %>
                                            <tr>
                                                <td class="reviewboxname">
                                                    <%=reviewer_fname + " " + reviewer_lname%><br/>
                                                    <%=dor%>
                                                </td>
                                                <td class="reviewboxrev">
                                                    <%=review%>
                                                </td></tr>
                                                <%
                                                    }
                                                %>
                                        </table>
                                        <%
                                                                    r4.close();
                                                                } catch (SQLException ex) {
                                                                    out.println(ex);
                                                                }
                                                                p4.close();
                                                            } catch (IOException | SQLException ex) {
                                                                out.println(ex);
                                                            }
                                                        }
                                                        r3.close();
                                                    } catch (SQLException ex) {
                                                        out.println(ex);
                                                    }
                                                    p3.close();
                                                } catch (IOException | SQLException ex) {
                                                    out.println(ex);
                                                }
                                                con.close();
                                            } catch (IOException | SQLException ex) {
                                                out.println(ex);
                                            }
                                        %>
                                    </td>
                                </tr>
                            </table>
                </table>
            </div>
        </div>
    </body>
</html>