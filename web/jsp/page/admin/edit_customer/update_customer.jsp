<%-- 
    Document   : update_artist
    Created on : 21 Mar, 2018, 11:51:04 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
String id;
long c_id;
                    private String req_date;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
                    private String q1;
                    private String desc;
                %>

            <%
                 id = request.getParameter("c_id");
 query = request.getParameter("state");
 desc = request.getParameter("desc");
c_id = Long.parseLong(id);
q1="delete from editcustomer where state=? and query=? and a_id=?";
Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
                            PreparedStatement p = con.prepareStatement(q1);
                            p.setString(1, desc);
                            p.setString(2, query);
                            p.setLong(3, c_id);
                            int r = p.executeUpdate();
                            if (r > 0) {
                                out.println("Update Successful");
                                out.println("Cleaning Successful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                } else {
                    out.println("Update Successful");
                    out.println("Cleaning Unsuccessful");

                    ps.close();
                }
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_art_requests.jsp");'>
            <%

            } else {
                out.println("Update Unsuccessful");
                out.println("Cleaning Unsuccessful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
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
        </div>
    </body>
</html>
