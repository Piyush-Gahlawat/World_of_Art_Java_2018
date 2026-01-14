<%-- 
    Document   : up_req_list
    Created on : 20 Mar, 2018, 11:10:46 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
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
            <h1>Edit Art</h1>
            <div class="content">
<%!
String id;
long aid;
private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
private String query;
%>
                <%
                     id = String.valueOf(session.getAttribute("artist"));
                    aid = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                      query = "select * from artdb where aid=?";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setLong(1, aid);
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table><thead>
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
                        while (r.next()) {
                            long art_id = r.getLong("art_id");
                            int price = r.getInt("art_price");
                            String type = r.getString("art_type");
                            String desc = r.getString("description");
                            Date up_date = r.getDate("date_of_upload");
                            String upload_date = up_date.toString();
                            String sold_stat = r.getString("sold_status");
                            String art_path = r.getString("art_path");
                    %>
                    <tr>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=price%>
                            <form action="edit_art_price.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=price%>" name="price">
                                <input type="submit" class="formbutton" value="edit">
                            </form>
                        </td>
                        <td>
                            <%=type%>
                        </td>
                        <td>
                            <%=desc%>
                            <form action="edit_art_desc.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=desc%>" name="desc">
                                <input type="submit" class="formbutton" value="edit">
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
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + art_path%>" width="30%" height="30%"/>
                        </td>
                        <td>
                            <form action="delet_art_req.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="submit"class="formbutton" value="Delete">
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
            </div>
        </div>
    </body>
</html>