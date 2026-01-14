<%-- 
    Document   : update_artist
    Created on : 21 Mar, 2018, 11:51:04 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.net.URI"%>
<%@page import="java.io.File"%>
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
                private String q;
                private String q2;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
long art_id;
long a_id;
            %>
            <%
                id = request.getParameter("art_id");
                aid = request.getParameter("a_id");
                art_id = Long.parseLong(id);
                a_id = Long.parseLong(aid);
                q = "select * from dummyartdb where art_id=? and a_id=?";
                q2 = "delete from dummyartdb where art_id=? and a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q)) {
                        ps.setLong(1, art_id);
                        ps.setLong(2, a_id);
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                String uri = rs.getString("art_path");
                                String path = getdata.ppath() + "" + uri;
                                URI url = URI.create(path);
                                File file = new File(path);
                                if (file.exists()) {
                                    file.delete();
                                    out.print("Deleted");
                                } else {
                                    out.print(url);
                                }
                            }
                            rs.close();
                        } catch (SQLException ex) {
                            out.print(ex);
                        }
                        ps.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                    try (PreparedStatement p = con.prepareStatement(q2)) {
                        p.setLong(1, art_id);
                        p.setLong(2, a_id);
                        int r = p.executeUpdate();
                        if (r > 0) {
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/upload_request_list.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/upload_request_list.jsp");'>
            <%
                        }
                        p.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.print(ex);
                }
            %>
        </div>    </body>
</html>
