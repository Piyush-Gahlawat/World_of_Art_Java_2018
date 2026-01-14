<%-- 
    Document   : stock_display
    Created on : 21 Mar, 2018, 3:52:19 PM
    Author     : mkl
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <h1>Stock Manager</h1>
            <div class="content">
                <%!
String id;
int aid;
                    private String query;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
long art_id;
long a_id;
int price;
String type;
String desc;
Date up_date;
String upload_date;
String sold_stat;
String art_path;
                %>                
                <%
                    id = String.valueOf(session.getAttribute("admin"));
                    aid = Integer.parseInt(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        query = "select * from artdb";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide" border="2"><thead>
                    <th>Art Id</th>
                    <th>Artist Id</th>
                    <th>Price(&#x20b9)</th>
                    <th>Art Type</th>
                    <th>Description</th>
                    <th>Upload Date</th>
                    <th>Sold Status</th>
                    <th>Picture</th>
                    <th>Delete</th></thead>
                        <%
                            while (r.next()) {
                                art_id = r.getLong("art_id");
                                a_id = r.getLong("a_id");
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
                            <%=art_id%>
                        </td>
                        <td>
                            <%=a_id%>
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
                            <%
                                if (sold_stat.equals("0")) {
                                    out.print("Unsold");
                                } else {
                                    out.print("Sold");
                                }
                            %>
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + art_path%>" width="300px" height="300px"/>
                        </td>
                        <td>
                            <form action='delete_art_manager.jsp' method="post">
                                <input type="hidden" value='<%=a_id%>' name='a_id'>
                                <input type="hidden" value='<%=art_id%>' name='art_id'>
                                <input type="submit" class="tablebutton" value='Delete'>
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
                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/status_manager.jsp');" >
            </div>
        </div>
    </body>
</html>
