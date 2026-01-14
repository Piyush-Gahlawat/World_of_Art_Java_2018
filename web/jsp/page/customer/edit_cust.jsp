<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tools.getdata"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>Edit Profile</h1>
            <div class="content">
<%!
                    private String fname;
                    private String lname;
                    private String address;
                    private String phone;
                    private String pass;
                    private String email;
                    private String gender;
                    private String q1;
                    private Date regdate;
private String dburl=getdata.url();
private String dbuser= getdata.user();
private String dbpass=getdata.password();

%>
                <%
                    q1="select * from customerdb where c_id=?";
                    String id = (String) session.getAttribute("customer");
                    long c_id = Long.parseLong(id);
                    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        try (PreparedStatement ps = con.prepareStatement(q1)) {
                            ps.setLong(1, c_id);
                            try (ResultSet rs = ps.executeQuery()) {
                                if (rs.next()) {
                                    fname = rs.getString("c_f_name");
                                    lname = rs.getString("c_l_name");
                                    address = rs.getString("c_address");
                                    phone = rs.getString("c_phone");
                                    pass = rs.getString("c_pass");
                                    email = rs.getString("c_email");
                                    gender = rs.getString("c_gender");
                                    regdate = rs.getDate("c_reg_date");
                %>
                <table>
                    <tr>
                        <td>
                            Name    
                        </td>
                        <td>
                            <%=fname + " " + lname%>
                        </td>
                        <td>
                            <form action="edit_customer_name_req.jsp" method="post">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=fname%>" name="fname">
                                <input type="hidden" value="<%=lname%>" name="lname">
                                <input type="submit" class="formbutton" value="Edit">    
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            XXXXXXXX
                        </td>
                        <td>
                            <form action="edit_customer_password.jsp" method="post">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=pass%>" name="c_pass">
                                <input type="submit" class="formbutton" value="Edit">    
                            </form>
                        </td>
                    <tr>
                        <td>
                            Email 
                        </td>
                        <td>
                            <%=email%>
                        </td>
                        <td>
                            <form action="edit_customer_email_req.jsp" method="post">
                                <input type="hidden" value="<%=email%>" name="email">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="submit" class="formbutton" value="Edit">    
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Contact
                        </td>
                        <td>   
                            <%=phone%>
                        </td>
                        <td>
                            <form action="edit_customer_phone_req.jsp" method="post">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=phone%>" name="phone">
                                <input type="submit" class="formbutton" value="Edit">    
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address   
                        </td>
                        <td>
                            <%=address%>
                        </td>
                        <td>
                            <form action="edit_customer_address_req.jsp" method="post">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=address%>" name="address">
                                <input type="submit" class="formbutton" value="Edit">    
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender   
                        </td>
                        <td>
                            <%=gender%>
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            Registration Date   
                        </td>
                        <td>
                            <%=regdate%>
                        </td>
                        <td>

                        </td>
                    </tr>
                </table>        

                <%
                                } else {
                                    out.println("data not retreived");
                                }
                                rs.close();
                            } catch (SQLException ex) {
                                out.print(ex);
                            }
                            ps.close();
                        } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
                        con.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
                %>        
            </div>
        </div>
    </body>
</html>
