<%-- 
    Document   : uploading_art
    Created on : 19 Mar, 2018, 11:43:34 PM
    Author     : mkl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="tools.getdata"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>uploading</h1>           
                <%!
String id;
String arid;
long aid;
long artid;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
                    private String pric;
long a_id;
long art_id;
                    private int price;
                    private String arttype;
                    private String image;
                    private Date up_date;
                    private String description;
                    private String update;
                    private String sold_f;
                    private String art_path;
                %>
            <%
                 id = request.getParameter("a_id");
                arid = request.getParameter("art_id");
               aid = Long.parseLong(id);
               artid = Long.parseLong(arid);
                arttype = request.getParameter("arttype");
                pric = request.getParameter("price");
               price = Integer.parseInt(pric);
                image = request.getParameter("picture");
                description = request.getParameter("desc");
                update = request.getParameter("up_date");
                up_date = Date.valueOf(update);
                sold_f = "0";
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                     query = "insert artdb values(?,?,?,?,?,?,?,?)";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setLong(1, artid);
                        ps.setInt(2, price);
                        ps.setString(3, arttype);
                        ps.setLong(4, aid);
                        ps.setString(5, description);
                        ps.setDate(6, up_date);
                        ps.setString(7, sold_f);
                        ps.setString(8, image);
                        int i = ps.executeUpdate();
                        if (i > 0) {
                            try (PreparedStatement p = con.prepareStatement("delete from dummyartdb where art_id=? and a_id=?")) {
                                p.setLong(1, artid);
                                p.setLong(2, aid);
                                int j = p.executeUpdate();
                                if (j > 0) {
                                    out.println("Successful upload");

            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/unuploaded_art.jsp");'>
            <%
                session.setAttribute("up_req", null);
            } else {
                out.println("Unsuccessful upload");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/unuploaded_art.jsp");'>
            <%
                                    session.setAttribute("up_Req", null);
                                }
                                p.close();
                            } catch (IOException | SQLException ex) {
                                out.println(ex);
                            }
                        }
                        ps.close();
                    }catch (IOException | SQLException ex) {
                    out.println(ex);
                }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.println(ex);
                }
            %>
            </body>
        </div>
</html>
