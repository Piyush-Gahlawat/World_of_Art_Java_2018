<%-- 
    Document   : edit_art_desc
    Created on : 20 Mar, 2018, 4:50:54 PM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
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
    <body>
        <div class="content">
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
                String newprice = request.getParameter("new_price");
                int new_price = Integer.parseInt(newprice);
                long a_id = (long) session.getAttribute("artist");
                String fname = (String) session.getAttribute("a_fname");
                String lname = (String) session.getAttribute("a_lname");
                q1 = "insert into editartdb values(?,?,?,?)";
                Calendar calendar = Calendar.getInstance();
                java.sql.Date up_date = new java.sql.Date(calendar.getTime().getTime());
                state = fname + " " + lname + " has requested to update art price";
                String query = "update artdb set art_price='" + new_price + "' where art_id='" + id + "'";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setString(1, query);
                        ps.setLong(2, art_id);
                        ps.setLong(3, a_id);
                        ps.setString(4, state);
                        ps.setDate(5, up_date);
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
