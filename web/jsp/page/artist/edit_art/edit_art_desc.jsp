<%-- 
    Document   : edit_art_desc
    Created on : 20 Mar, 2018, 4:50:54 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        <div class="content">
            <%!
 String id;
                private String state;
                private String q1;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
            %>
            <%
                id = request.getParameter("art_id");
                long art_id = Long.parseLong(id);
                String new_desc = request.getParameter("new_desc");
                String fname = (String) session.getAttribute("a_fname");
                String lname = (String) session.getAttribute("a_lname");
                Calendar calendar = Calendar.getInstance();
                java.sql.Date up_date = new java.sql.Date(calendar.getTime().getTime());
                q1 = "insert into editartdb values(?,?,?,?)";
                state = fname + " " + lname + " has requested to update art description";
                String query = "update artdb set a_description ='" + new_desc + "' where art_id='" + id + "'";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setString(1, query);
                        ps.setLong(2, art_id);
                        ps.setString(3, state);
                        ps.setDate(4, up_date);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                        }
                        ps.close();
                    }
                    con.close();
                } catch (IOException ex) {
                    out.print(ex);
                }
            %>
        </div>    </body>
</html>
