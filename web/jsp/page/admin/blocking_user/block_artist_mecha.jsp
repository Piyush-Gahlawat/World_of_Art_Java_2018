<%-- 
    Document   : unblock_artist_mecha
    Created on : 28 Mar, 2018, 12:57:28 PM
    Author     : mkl
--%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <%!
String uid;
long id;
private String q1;
private String q2;
private String dburl=getdata.url();
private String dbuser= getdata.user();
private String dbpass=getdata.password();
            %>
            <%
                 uid = request.getParameter("a_id");
                 id = Long.parseLong(uid);
                q1 = "Select * from artistdb where a_id=?";
                q2 = "update artistdb set a_block_f='1' where a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl,dbuser, dbpass)) {
                    try (PreparedStatement p1 = con.prepareStatement(q1)) {
                        p1.setLong(1, id);
                        try (ResultSet rs = p1.executeQuery()) {
                            if (rs.next()) {
                                try (PreparedStatement p2 = con.prepareStatement(q2)) {
                                    p2.setLong(1, id);
                                    int i = p2.executeUpdate();
                                    if (i > 0) {
                                        out.println("Blocking Successful");
            %>
            <input type="button" class="formbutton" value="Manager Customers" onclick="redirect('<%=request.getContextPath()%>/manage_users.jsp');">
            <%
            } else {
                out.println("Blocking Failed");
            %>
            <input type="button" class="formbutton" value="Manager Customers" onclick="redirect('<%=request.getContextPath()%>/manage_users.jsp');">
            <%
                                    }
                                    p2.close();
                                } catch (IOException | SQLException ex) {
                                    out.println(ex);
                                }
                            } else {
                                out.println("ID doesn\'t Exist");
                            }
                            rs.close();
                        } catch (SQLException ex) {
                            out.println(ex);
                        }
                        p1.close();
                    } catch (IOException | SQLException ex) {
                        out.println(ex);
                    }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.println(ex);
                }
            %>
        </div>
    </body>
</html>
