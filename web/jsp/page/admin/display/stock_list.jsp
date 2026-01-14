<%-- 
    Document   : stock_display
    Created on : 21 Mar, 2018, 3:52:19 PM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <h1>Stock Report</h1>
            <div class="content">
                <%!
String id;
                    long aid;
long art_id;
long a_id;
                    private int price;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
                    private String type;
                    private String desc;
                    private Date up_date;
                    private String upload_date;
String sold_stat;
String art_path;
                %>
                <%
                    String id = String.valueOf(session.getAttribute("admin"));
                    long aid = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        query = "select * from artdb";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Art Id</th>
                    <th>Artist Id</th>
                    <th>Price(&#x20b9)</th>
                    <th>Art Type</th>
                    <th>Description</th>
                    <th>Upload Date</th>
                    <th>Sold Status</th>
                    <th>Picture</th>
                    </thead>
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
                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/report_manager.jsp');" >
            </div>
        </div>
    </body>
</html>

