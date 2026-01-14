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
            <h1>Update Customer's Information</h1>
            <div class="content">
<%!
String id;
long aid;
long c_id;
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
                    try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                     query = "select * from editcustomer order by up_date;";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Customer Id</th>
                    <th>Request Detail</th>
                    <th>Decide</th>
                    </thead>
                    <%
                        while (r.next()) {
                            c_id = r.getLong("c_id");
                             state = r.getString("query");
                     desc = r.getString("state");
                             req_date = r.getDate("up_date");
                    %>
                    <tr>
                        <td>
                            <%=c_id%>
                        </td>
                        <td>
                            <%=desc%>
                        </td>
                        <td>
                            <%=req_date%>
                        </td>
                        <td>
                            <form action="update_customer_details.jsp" method="post">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=desc%>" name="state">
                                <input type="hidden" value="<%=state%>" name="state">
                                <input type="submit" value="Accept">
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
                <input type="button" class="formbutton" value="back" onclick="redirect('<%=request.getContextPath()%>/notification_manager.jsp');" >
            </div>
        </div>
    </body>
</html>