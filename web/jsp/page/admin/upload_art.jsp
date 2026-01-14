<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <div class="content">
            <h1>Upload Art</h1>
            <div class="content">
                <%!
String id;
long aid;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
long a_id;
long art_id;
private int price;
                    private String type;
                    private String desc;
                    private Date up_date;
                    private String upload_date;
                    private String sold_stat;
                    private String art_path;
                %>
                <%
                    id = String.valueOf(session.getAttribute("admin"));
                    aid = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                     query = "select * from dummyartdb";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Artist Id</th>
                    <th>Art Id</th>
                    <th>Price</th>
                    <th>Art Type</th>
                    <th>Description</th>
                    <th>Upload Date</th>
                    <th>Picture</th>
                    <th>Decision</th>
                    </thead>
                    <%
                        while (r.next()) {
                            a_id = r.getLong("a_id");
                            art_id = r.getLong("art_id");
                            price = r.getInt("art_price");
                            type = r.getString("art_type");
                            desc = r.getString("description");
                            up_date = r.getDate("date_of_upload");
                            upload_date = up_date.toString();
                            sold_stat = r.getString("sold_status");
                            art_path = r.getString("art_path");
                    %>
                    <tr>
                        <td>
                            <%=a_id%>

                        </td>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=price%>
                        </td>
                        <td>
                            <%=type%>
                        </td>
                        <td>
                            <%=desc%>
                        </td>   
                        <td>
                            <%=upload_date%>
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + art_path%>" width="300px" height="300px"/>
                        </td>
                        <td>
                            <form action="uploading_art.jsp" method="post">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=price%>" name="price">
                                <input type="hidden" value="<%=type%>" name="arttype">
                                <input type="hidden" value="<%=desc%>" name="desc">
                                <input type="hidden" value="<%=up_date%>" name="up_date">    
                                <input type="hidden" value="<%=sold_stat%>" name="sold_stat">
                                <input type="hidden" value="<%=art_path%>" name="picture">
                                <input type="submit" class="tablebutton" value="Upload">
                            </form>
                        </td>
                    </tr>                
                    <%
                        }
                    %>

                </table>     
                <%
                                r.close();
                            } catch (SQLException ex) {
                                out.println(ex);
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
                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/artist_requests.jsp');" >
            </div>
        </div>
    </body>
</html>
