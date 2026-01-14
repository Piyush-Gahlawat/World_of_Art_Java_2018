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
int art_id;
int a_id;
                private String uri;
                private String path;
                private String q1;
                private String q2;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();

%>
            <%
                id = request.getParameter("art_id");
                aid = request.getParameter("a_id");
                art_id = Integer.parseInt(id);
                a_id = Integer.parseInt(aid);
                q1 = "select * from artdb where art_id=? and a_id=?";
                q2 = "delete from artdb where art_id=? and a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setInt(1, art_id);
                        ps.setInt(2, a_id);
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                 uri = rs.getString("art_path");
                                path = getdata.ppath() + "/" + uri;
                                URI url = URI.create(path);
                                File file = new File(path);
                                if (file.exists()) {
                                    file.delete();
                                    out.print("Deleted");
                                } else {
                                    out.print("Not Found");
                                }
                            }
                            rs.close();
                        } catch (IOException | SQLException ex) {
                            out.println(ex);
                        }
                        ps.close();
                    } catch (SQLException ex) {
                        out.println(ex);
                    }
                    try (PreparedStatement p = con.prepareStatement(q2)) {
                        p.setInt(1, art_id);
                        p.setInt(2, a_id);
                        int rs = p.executeUpdate();
                        if (rs > 0) {
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/stock_manager.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/stock_manager.jsp");'>
            <%
                        }
                        p.close();
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
