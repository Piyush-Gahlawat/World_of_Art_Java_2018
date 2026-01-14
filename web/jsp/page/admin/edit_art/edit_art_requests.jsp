<%-- 
    Document   : edit_art_requests
    Created on : 19 Mar, 2018, 7:23:58 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <h1>Update Art</h1>
            <div class="content">
<%!
String id;
long aid;
long art_id;
long a_id;
private String state;
private String desc;
private Date req_date;
private String query;
private String dburl=getdata.url();
private String dbuser= getdata.user();
private String dbpass=getdata.password();

%>
                <%
                     id = String.valueOf(session.getAttribute("admin"));
                    aid = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl,dbuser, dbpass)) {
                     query = "select * from editartdb order by up_date";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Art Id</th>
                    <th>Artist Id</th>
                    <th>Request Detail</th>
                    <th>Request Date</th>
                    <th>Accept</th>
                    </thead>
                    <%
                        while (r.next()) {
                    art_id = r.getLong("art_id");
                    a_id = r.getLong("a_id");
                     state = r.getString("query");
                     desc = r.getString("state");
                     req_date = r.getDate("up_date");
                    %>
                    <tr>
                        <td>
                            <%=art_id%>
                        </td>
                        <td>
                            <%=a_id%>
                        </td>
                        <td>
                            <%=desc%>
                        </td>
                        <td>
                            <%=req_date%>
                        </td>
                        <td>
                            <form name="<%=art_id%>" action="update_art_details.jsp" method="post">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
                                <input type="hidden" value="<%=desc%>" name="desc">
                                <input type="hidden" value="<%=state%>" name="state">
                                <input type="submit" class="formbutton" value="Accept">
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
