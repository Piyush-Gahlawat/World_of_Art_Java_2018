<%-- 
    Document   : order_history
    Created on : 20 Jan, 2018, 3:47:54 PM
    Author     : mkl
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Calendar"%>
<%@page import="tools.getdata"%>
<%@page import="tools.one"%>
<%@page import="tools.two"%>
<%@page import="tools.three"%>
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
                    private String rating;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
private String q1;
private String q2;
private String q3;
                %>
                <%
                        cid = request.getParameter("cid");
                        artid = request.getParameter("art_id");
                        rating = request.getParameter("rating");
                        long c_id = Long.parseLong(cid);
                        long art_id = Long.parseLong(artid);
                        int rate = Integer.parseInt(rating);
                        one o = new one();
                        two t  = new two();
                        three th = new three();
                        int rate1 = o.one(rate);
                        int rate2 = t.two(rate);
                        int rate3 = th.three(rate);
                        if(rate!=0){
                        Class.forName("com.mysql.jdbc.Driver");
                        try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                             q1 = "select * from ratings where c_id=? and art_id=?";
                             q2 = "update ratings set one=?,two=?,three=?  where c_id=? and art_id=?";
                             q3 = "insert into ratings values(?,?,?,?,?)";
                            try (PreparedStatement p1 = con.prepareStatement(q1)) {
                                p1.setLong(1, c_id);
                                p1.setLong(2, art_id);
                                try (ResultSet r1 = p1.executeQuery()) {
                                    while (r1.next()) {
                                        try (PreparedStatement p2 = con.prepareStatement(q2)) {
                                            p2.setInt(1, rate1);
                                            p2.setInt(2, rate2);
                                            p2.setInt(3, rate3);
                                            int a = p2.executeUpdate();
                                            while (a > 0) {
                                                if (a > 0) {
                                                    out.print("Rating Successful");
                                                } else {
                                                    out.print("Rating Unsuccessfill");
                                                }
                                            }
                                            p2.close();
                                        } catch (IOException | SQLException ex) {
                                            out.println(ex);
                                        }
                                    }
                                    try (PreparedStatement p3 = con.prepareStatement(q3)) {
                                        p3.setLong(1, art_id);
                                        p3.setLong(2, c_id);
                                        p3.setInt(3, rate1);
                                        p3.setInt(4, rate2);
                                        p3.setInt(5, rate3);
                                        int b = p3.executeUpdate();
                                        if (b > 0) {
                                            out.print("Rating Successful");
                                        } else {
                                            out.print("Rating Unsuccessful");
                                        }
                                        p3.close();
                                    } catch (IOException | SQLException ex) {
                                        out.println(ex);
                                    }
                                    r1.close();
                                } catch (SQLException ex) {
                                    out.println(ex);
                                }
                                p1.close();
                            } catch (IOException | SQLException ex) {
                                out.println(ex);
                            }
                            con.close();
                        }
                    catch(IOException|SQLException ex){
                                        out.println(ex);
                    }
                        }else{
                            out.print("invalid input");
                        }
                %>
            </div>
        </div>
    </body>
</html>