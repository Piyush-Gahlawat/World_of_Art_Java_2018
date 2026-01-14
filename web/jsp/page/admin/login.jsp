<%-- 
    Document   : login
    Created on : 12 Mar, 2018, 9:26:48 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
    </head>
    <body>
        <div class="content">
            <%!
String userid;
long uid;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                private String query;
                private String fname;
                private String lname;
                private String email;
                private String password;
            %>            <%
                    userid = request.getParameter("uid");
                    password = request.getParameter("pass");
                    uid = Long.parseLong(userid);
                    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                    query = "Select * from admindb where admin_id=? and admin_pass=?";
                    try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setLong(1, uid);
                            ps.setString(2, password);
                            try (ResultSet rs = ps.executeQuery()) {
                                if (rs.next()) {
                                    fname = rs.getString("admin_f_name");
                                    lname = rs.getString("admin_l_name");
                                    email = rs.getString("admin_email");
                                    session.setAttribute("admin", userid);
                                    session.setAttribute("admin_fname", fname);
                                    session.setAttribute("admin_lname", lname);
                                    session.setAttribute("admin_email", email);
                                    session.setAttribute("admin_pass", password);
            %>
            Valid Credentials
            <br/>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
            <%
            } else {
                out.println("invalid Credentials");
            %>
            <br/>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
            <%
                            }
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
        </div>
    </body>
</html>
