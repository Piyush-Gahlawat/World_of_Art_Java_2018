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
Long c_id;
                private long o_id;
                private String q;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
            %>
            <%
                id = request.getParameter("c_id");
                o_id = Long.parseLong(id);
                q = "delete from orderdb where c_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q)) {
                        ps.setLong(1, o_id);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Delete Successful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/order_manager.jsp");'>
            <%
            } else {
                out.println("Delete Unsuccessful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/order_manager.jsp");'>
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
