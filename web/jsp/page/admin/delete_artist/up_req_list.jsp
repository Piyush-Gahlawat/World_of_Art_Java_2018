<%-- 
    Document   : up_req_list
    Created on : 20 Mar, 2018, 11:10:46 AM
    Author     : mkl
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="tools.getdata"%>
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
            <h1>Artist Manager</h1>
            <div class="content">
                <%!
String id;
long aid;
private String query;
                    private String q2;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
long a_id;
     String fname;
     String lname;
     Date reg_date;
                    private String address;
                    private String email;
                    private String gender;
                    private long phone;
String blockf;
                %>                
                <%
                    id = String.valueOf(session.getAttribute("admin"));
                    aid = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        query = "select * from artistdb";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Artist Id</th>
                    <th>Artist Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Registration Date</th>
                    <th>Gender</th>
                    <th>Status</th>
                    <th>Delete</th>
                    </thead>
                    <%
                        while (r.next()) {
                            a_id = r.getLong("a_id");
                            fname = r.getString("a_f_name");
                            lname = r.getString("a_l_name");
                            reg_date = r.getDate("a_reg_date");
                            address = r.getString("a_address");
                            email = r.getString("a_email");
                            gender = r.getString("a_gender");
                            phone = r.getLong("a_phone");
                            blockf = r.getString("a_block_f");

                    %>
                    <tr>
                        <td>
                            <%=a_id%>
                        </td>
                        <td>
                            <%=fname + " " + lname%>
                        </td>
                        <td>
                            <%=address%>
                        </td>
                        <td>
                            <%=phone%>
                        </td>
                        <td>
                            <%=email%>
                        </td>
                        <td>
                            <%=reg_date%>
                        </td>
                        <td>
                            <%=gender%>
                        </td>
                        <td>
                            <%
                                if (blockf.equals("0")) {
                                    out.print("Valid");
                                } else {
                                    out.print("Blocked");
                                }
                            %>
                        </td>
                        <td>
                            <form action='delete_artist_manager.jsp' method="post">
                                <input type="hidden" value='<%=a_id%>' name='a_id'>
                                <input type="hidden" value='<%=phone%>' name='phone'>
                                <input type="submit" class="formbutton" value='Delete'>
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