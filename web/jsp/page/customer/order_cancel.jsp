<%-- 
    Document   : update_artist
    Created on : 21 Mar, 2018, 11:51:04 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Date"%>
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
            <%!
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                String userid;
                 private String q;
                long uid;
String cid;
String id;
String aid;
String ostat;
String odate;
Date o_date;
long art_id;
long c_id;
long o_id;
            %>

        <div class="content">
            <%
       cid = (String) session.getAttribute("customer");
       id = request.getParameter("order_id");
       aid = request.getParameter("art_id");
       ostat = request.getParameter("o_stat");
       odate = request.getParameter("o_date");
       o_date = Date.valueOf(odate);
      o_id = Long.parseLong(id);
                c_id = Long.parseLong(cid);
      art_id = Long.parseLong(aid);
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                q = "update orderdb set order_status='1' where order_id=? and c_id=? and art_id=?";
                if (ostat.equals("0")) {
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        try (PreparedStatement ps = con.prepareStatement(q)) {
                            ps.setLong(1, o_id);
                            ps.setLong(2, c_id);
                            ps.setLong(3, art_id);
                            int rs = ps.executeUpdate();
                            if (rs > 0) {
                                out.println("Status Updated");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/cart.jsp");'>
            <%
            } else {
                out.println("Status Update Failed");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/cart.jsp");'>
            <%
                            }
                            ps.close();
                        } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                }
            %>
        </div>
    </body>
</html>
