<%-- 
    Document   : login
    Created on : 12 Mar, 2018, 9:26:48 PM
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
                long userid;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                private String q1;
                private String q2;
                private String q3;
            %>            <%
                userid = Long.parseLong(String.valueOf(session.getAttribute("customer")));
                q1 = "delete from c_security_question where c_id=?";
                q2 = "delete from customerdb where c_id=?";
                q3 = "delete from editcustomer where c_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement p1 = con.prepareStatement(q1)) {
                        p1.setLong(1, userid);
                        int r1 = p1.executeUpdate();

                        try (PreparedStatement p2 = con.prepareStatement(q2)) {
                            p2.setLong(1, userid);
                            int r2 = p2.executeUpdate();
                            try (PreparedStatement p3 = con.prepareStatement(q3)) {
                                p3.setLong(1, userid);
                                int r3 = p3.executeUpdate();
                                if (r2 > 0) {
                                    session.invalidate();
            %>           
            <br/>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
            <%                        } else {
                out.println("Delete Unsuccessful");
            %>
            <br/>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
            <%
                                }
                                p3.close();
                            } catch (IOException | SQLException ex) {
                                out.print(ex);
                            }
                            p2.close();
                        } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
                        p1.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.println(ex);
                }
            %> 
        </div>
    </body>
</html>