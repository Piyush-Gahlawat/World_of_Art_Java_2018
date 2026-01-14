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
long a_id;
long art_id;
String aid;
String id;
                private String query;
                private String q;
                private String desc;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();

            %>
            <%
                aid = request.getParameter("art_id");
                id = request.getParameter("a_id");
                query = request.getParameter("state");
                desc = request.getParameter("desc");
                art_id = Long.parseLong(aid);
                a_id = Long.parseLong(id);
                q = "delete from editartdb where art_id=? and state=? and a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
                            PreparedStatement p = con.prepareStatement(q);
                            p.setLong(1, art_id);
                            p.setString(2, desc);
                            p.setLong(3, a_id);
                            int r = p.executeUpdate();
                            if (r > 0) {
                                out.println("Update Successful");

            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                }
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_art_requests.jsp");'>
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
