<%-- 
    Document   : home
    Created on : 31 Dec, 2017, 11:02:40 AM
    Author     : mkl
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="user">
            <%
                if (session.getAttribute("admin") != null) {
                    String ad = (String) session.getAttribute("admin");
                    long admin = Long.valueOf(ad);
                    String admin_pass = (String) session.getAttribute("admin_pass");
                    String fname = (String) session.getAttribute("admin_fname");
                    String lname = (String) session.getAttribute("admin_lname");
                    String name = fname + " " + lname;
                    out.print(name);
                } else if (session.getAttribute("artist") != null) {
                    String ar = (String) session.getAttribute("artist");
                    long artist = Long.valueOf(ar);
                    String a_pass = (String) session.getAttribute("a_pass");
                    String a_fname = (String) session.getAttribute("a_fname");
                    String a_lname = (String) session.getAttribute("a_lname");
                    String name = a_fname + " " + a_lname;
                    out.print(name);
                } else if (session.getAttribute("customer") != null) {
                    String ar = (String) session.getAttribute("customer");
                    long cust = Long.valueOf(ar);
                    String c_pass = (String) session.getAttribute("c_pass");
                    String c_fname = (String) session.getAttribute("c_fname");
                    String c_lname = (String) session.getAttribute("c_lname");
                    String name = c_fname + " " + c_lname;
                    out.print(name);
                } else {
                    out.print("User");
                }
            %>
        </div>
    </body>
</html>
