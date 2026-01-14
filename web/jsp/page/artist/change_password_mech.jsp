<%-- 
    Document   : change_password_mech
    Created on : 22 Mar, 2018, 6:12:22 PM
    Author     : mkl
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.DriverManager"%>
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
        <div class="content">
            <%!
                String id;
                String pass;
                long a_id;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
            %>
            <%
                id = (String) session.getAttribute("artist");
                pass = request.getParameter("new");
                a_id = Long.parseLong(id);
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement("update artistdb set a_pass=md5(?) where a_id=?")) {
                        ps.setString(1, pass);
                        ps.setLong(2, a_id);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
                            session.setAttribute("a_pass", pass);
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_artist.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/edit_art_requests.jsp");'>
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
