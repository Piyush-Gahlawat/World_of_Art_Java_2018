<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
            <h1>Edit Profile</h1>
            <div class="content">        
                <table >
<%!
String id;
long a_id;
private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
private String query;

%>
                    <%
                        String id = (String) session.getAttribute("artist");
                        long a_id = Long.parseLong(id);
                        query="select * from artistdb where a_id=?";
                        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                        try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                            try (PreparedStatement ps = con.prepareStatement(query)) {
                                ps.setLong(1, a_id);
                                try (ResultSet r = ps.executeQuery()) {
                                    if (r.next()) {
                                        String pass = r.getString("a_pass");
                                        String fname = r.getString("a_f_name");
                                        String lname = r.getString("a_l_name");
                                        Date regdate = r.getDate("a_reg_date");
                                        String address = r.getString("a_address");
                                        String email = r.getString("a_email");
                                        String gender = r.getString("a_gender");
                                        String phone = r.getString("a_phone");
                                        String blockf = r.getString("a_block_f");
                    %>
                    <tr>
                        <td>
                            Name    
                        </td>
                        <td>
                            <%=fname + " " + lname%>
                        </td>
                        <td>
                            <form action="edit_artist_name_req.jsp" method="post">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
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
                            <form action="artist_change_password.jsp" method="post">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
                                <input type="hidden" value="<%=pass%>" name="a_pass">
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
                            <form action="edit_artist_email_req.jsp" method="post">
                                <input type="hidden" value="<%=email%>" name="email">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
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
                            <form action="edit_artist_phone_req.jsp" method="post">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
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
                            <form action="edit_artist_address_req.jsp" method="post">
                                <input type="hidden" value="<%=a_id%>" name="a_id">
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
                    <%
                                    } else {
                                        out.println("Data not Retreived");
                                    }
                                    r.close();
                                } catch (IOException | SQLException ex) {
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
                </table>
            </div>
        </div>
    </body>
</html>
