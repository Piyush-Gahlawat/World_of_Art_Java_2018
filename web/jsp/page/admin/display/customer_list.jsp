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
            <h1>Customer Report</h1>
            <div class="content">
                <%!
 String id;
 long aid;
                    private String dburl = getdata.url();
                    private String dbuser = getdata.user();
                    private String dbpass = getdata.password();
                    private String query;
 long c_id;
 String fname;
       String lname;
                    private Date reg_date;
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
                        String query = "select * from customerdb;";
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            try (ResultSet r = ps.executeQuery()) {
                %>
                <table class="wide"><thead>
                    <th>Customer Id</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Registration Date</th>
                    <th>Gender</th>
                    <th>Status</th>
                    </thead>
                    <%
                        while (r.next()) {
                    c_id = r.getLong("c_id");
                    fname = r.getString("c_f_name");
                    lname = r.getString("c_l_name");
                    reg_date = r.getDate("c_reg_date");
                    address = r.getString("c_address");
                    email = r.getString("c_email");
                    gender = r.getString("c_gender");
                    phone = r.getLong("c_phone");
                    blockf = r.getString("c_block_f");
                    %>
                    <tr>
                        <td>
                            <%=c_id%>
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