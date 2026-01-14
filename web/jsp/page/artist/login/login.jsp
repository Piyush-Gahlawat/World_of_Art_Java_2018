<%-- 
    Document   : login
    Created on : 12 Mar, 2018, 9:26:48 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
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
    </head>
    <body>
        <div class="content">
            <%!
                String userid;
                String password;
                long uid;
                private String q1;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
            %>
            <%
                response.setContentType("text/html;charset=UTF-8");
                /* TODO output your page here. You may use following sample code. */
                userid = request.getParameter("uid");
                password = request.getParameter("pass");
                uid = Long.parseLong(userid);
                q1 = "Select * from artistdb where a_id=? and a_pass=md5(?)";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setLong(1, uid);
                        ps.setString(2, password);
                        try (ResultSet rs = ps.executeQuery()) {
                            if (rs.next()) {
                                String bflag = rs.getString("a_block_f");
                                if (bflag.equals("0")) {
                                    String fname = rs.getString("a_f_name");
                                    String lname = rs.getString("a_l_name");
                                    String email = rs.getString("a_email");
                                    String address = rs.getString("a_address");
                                    String gender = rs.getString("a_gender");
                                    String phone = rs.getString("a_phone");
                                    String regdate = rs.getString("a_reg_date");
                                    session.setAttribute("artist", userid);
                                    session.setAttribute("a_fname", fname);
                                    session.setAttribute("a_lname", lname);
                                    session.setAttribute("a_email", email);
                                    session.setAttribute("a_pass", password);
                                    session.setAttribute("a_address", address);
                                    session.setAttribute("a_gender", gender);
                                    session.setAttribute("a_phone", phone);
                                    session.setAttribute("a_regdate", regdate);
                                    session.setAttribute("a_bflag", bflag);
            %>
            Valid Credentials
            <br/>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/artist.jsp');">
            <%
            } else {
            %>
            YOUR_ACCOUNT IS BLOCKED
            <br/><form action="unblock_artist.jsp">
                <input type="hidden" value="<%=uid%>" name="uid"> 
                <input type="submit" value="Unblock" >
            </form>
            <%
                }
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