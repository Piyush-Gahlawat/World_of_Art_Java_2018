<%-- 
    Document   : order_history
    Created on : 20 Jan, 2018, 3:47:54 PM
    Author     : mkl
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Calendar"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placing Order</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>Add Review</h1>
            <div class="content">        
<%!
String cid;
String artid;
private String review;
private String query;
private String dburl = getdata.url();
private String dbuser = getdata.user();
private String dbpass = getdata.password();

%>
                <%

                     cid = request.getParameter("c_id");
                     artid = request.getParameter("art_id");
                     review = request.getParameter("review");
                    int c_id = Integer.parseInt(cid);
                    int art_id = Integer.parseInt(artid);
                    Calendar calendar = Calendar.getInstance();
                    java.sql.Date revdate = new java.sql.Date(calendar.getTime().getTime());
                    session.setAttribute("rev_ses", c_id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
  query = "insert into review values(?,?,?,?)";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setInt(1, art_id);
                            ps.setInt(2, c_id);
                            ps.setString(3, review);
                            ps.setDate(4, revdate);
                            int a = ps.executeUpdate();
                            if (a > 0) {
                                out.print("Review Send");
                            } else {
                                out.print("Review Failed");
                            }
                            ps.close();
                        } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                %>
            </div>
        </div>
    </body>
</html>