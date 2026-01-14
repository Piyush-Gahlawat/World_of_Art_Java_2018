<%-- 
    Document   : edit_art_desc
    Created on : 20 Mar, 2018, 4:50:54 PM
    Author     : mkl
--%>

<%@page import="java.util.Date"%>
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
long id;
String arid;
long aid;
long artid;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
                    private String q1;
                    private String fname;
                    private String lname;
                    private String state;
                %>
            <%
                id = Long.parseLong(request.getParameter("art_id"));
                 fname = (String) session.getAttribute("a_fname");
                 lname = (String) session.getAttribute("a_lname");
                Calendar calendar = Calendar.getInstance();
                java.sql.Date up_date = new java.sql.Date(calendar.getTime().getTime());
                state = fname + " " + lname + " has requested to delete " + id;
                query = "delete from artdb where art_id='" + id + "'";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                q1 = "insert into editartdb values(?,?,?,?);";
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setString(1, query);
                        ps.setLong(2, id);
                        ps.setString(3, state);
                        ps.setDate(4, up_date);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
            } else {
                out.println("Update Unuccessful");
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
