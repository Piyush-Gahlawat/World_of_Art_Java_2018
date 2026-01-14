<%-- 
    Document   : sold_stat_change
    Created on : 31 Mar, 2018, 9:46:34 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="tools.getdata"%>
<%@page import="tools.getdata"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String sstat;
            String artid;
            long art_id;
            private String dburl = getdata.url();
            private String dbuser = getdata.user();
            private String dbpass = getdata.password();
            private String q;
        %>
        <%
            sstat = request.getParameter("sstat");
            artid = request.getParameter("art_id");
            art_id = Long.parseLong(artid);
            if (sstat.equals("1")) {
                q = "update artdb set sold_status=? where art_id=?";
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement p1 = con.prepareStatement(q)) {
                        p1.setString(1, "0");
                        p1.setLong(2, art_id);
                        int b = p1.executeUpdate();
                        if (b > 0) {
                            out.print("Sold Status Changed");
                        } else {
                            out.print("Sold Status Unchanged");
                        }
                        p1.close();
                    } catch (IOException | SQLException ex) {
                        out.println(ex);
                    }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.println(ex);
                }
            } else {
                out.println("Already Stocked");
            }
        %>
    </body>
</html>
