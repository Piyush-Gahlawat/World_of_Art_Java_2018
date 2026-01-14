<%-- 
    Document   : update_artist
    Created on : 21 Mar, 2018, 11:51:04 AM
    Author     : mkl
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URI"%>
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
String aid;
long art_id;
long a_id;
                private int price;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                private String query;
                private String q1;
                private String q2;
                private String uri;
                private String path;
                private String desc;
            %>    
            <%
                aid = request.getParameter("art_id");
                id = request.getParameter("a_id");
                desc = request.getParameter("desc");
                query = request.getParameter("state");
                art_id = Long.parseLong(aid);
                a_id = Long.parseLong(id);
                q1 = "select * from artdb where art_id=? and a_id=?";
                q2 = "delete from deleteartdb where art_id=? and a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setLong(1, art_id);
                        ps.setLong(2, a_id);
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                uri = rs.getString("art_path");
                                path = getdata.ppath() + "/" + uri;
                                URI url = URI.create(path);
                                File file = new File(path);
                                if (file.exists()) {
                                    file.delete();
                                    out.print("deleted");
                                    try (PreparedStatement p = con.prepareStatement(query)) {
                                        int r = p.executeUpdate();
                                        if (r > 0) {
                                            try (PreparedStatement p2 = con.prepareStatement(q2)) {
                                                p2.setLong(1, art_id);
                                                p2.setLong(2, a_id);
                                                int r2 = p2.executeUpdate();
                                                if (r2 > 0) {
                                                    out.println("Delete Successful!");
                                                }
                                            }
                                            out.println("Delete Successful!");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                out.println("Delete Successful!");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_art_requests.jsp");'>
            <%
            } else {
                out.println("Delete Unsuccessful!");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_art_requests.jsp");'>
            <%
                                        }
                                    }
                                } else {
                                    out.println("Delete Unsuccessful");
                                }
                            }
                            rs.close();
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
        </div>
    </body>
</html>
