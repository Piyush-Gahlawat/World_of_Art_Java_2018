<%-- 
    Document   : up_req_list
    Created on : 20 Mar, 2018, 11:10:46 AM
    Author     : mkl
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            <h1>My Art</h1>
            <div class="content">
                <%!
String id;
long aid;
private String query;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
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
                    id = String.valueOf(session.getAttribute("artist"));
                    aid = Long.parseLong(id);
                    query = "select * from artdb where a_id=?";
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setLong(1, aid);
                            try (ResultSet rs = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Art Id</th>
                    <th>Price</th>
                    <th>Art Type</th>
                    <th>Description</th>
                    <th>Upload Date</th>
                    <th>Sold Status</th>
                    <th>Picture</th>
                    <th>Delete</th>
                    </thead>
                    <%
                        while (rs.next()) {
                            art_id = rs.getLong("art_id");
                            price = rs.getInt("art_price");
                            type = rs.getString("art_type");
                            desc = rs.getString("description");
                            up_date = rs.getDate("date_of_upload");
                            upload_date = up_date.toString();
                            sold_stat = rs.getString("sold_status");
                            art_path = rs.getString("art_path");
                    %>
                    <tr>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=price%>
                            <form action="edit_art_price_req.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=price%>" name="price">
                                <input type="submit" class="formbutton" value="Edit">
                            </form>
                        </td>
                        <td>
                            <%=type%>
                        </td>
                        <td>
                            <%=desc%>

                            <form action="edit_art_desc_req.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=desc%>" name="desc">
                                <input type="submit" class="formbutton" value="Edit">
                            </form>
                        </td>
                        <td>
                            <%=upload_date%>
                        </td>
                        <td>
                            <%
                                if (sold_stat.equals("0")) {
                                    out.print("Unsold");
                                } else {
                                    out.print("Sold");
                                }
                            %>
                            <form action="restock.jsp" method="post">
                                <input type="hidden" vlaue="<%=sold_stat%>" name="sstat">
                                <input type="hidden" vlaue="<%=art_id%>" name="art_id">
                                <input type="submit" class="formbutton" value="Restock">
                            </form>
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + art_path%>" width="300px" height="300px"/>
                        </td>
                        <td><form action="delete_artreq.jsp" method="post">
                                <input type="hidden" vlaue="<%=aid%>" name="a_id">
                                <input type="hidden" vlaue="<%=art_id%>" name="art_id">
                                <input type="submit" class="formbutton" value="Delete">
                            </form>
                        </td>
                    </tr>                
                    <%
                        }
                    %>


                </table>     
                <%
                                rs.close();
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
                <input type="button" value="Go Back" class="formbutton" onclick='redirect("<%=request.getContextPath()%>/artist.jsp");'>
            </div>
        </div>
    </body>
</html>