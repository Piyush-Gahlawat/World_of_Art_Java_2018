<%-- 
    Document   : login
    Created on : 12 Mar, 2018, 9:26:48 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
        <%!
String userid;
private String password;
private int uid;
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
        uid = Integer.parseInt(userid);
        q1="Select * from customerdb where c_id=? and c_pass=md5(?)";
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
            try (PreparedStatement ps = con.prepareStatement(q1)) {
                ps.setInt(1, uid);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        String bflag = rs.getString("c_block_f");
                        if (bflag.equals("0")) {
                            String fname = rs.getString("c_f_name");
                            String lname = rs.getString("c_l_name");
                            String email = rs.getString("c_email");
                            String address = rs.getString("c_address");
                            String gender = rs.getString("c_gender");
                            String phone = rs.getString("c_phone");
                            String regdate = rs.getString("c_reg_date");
                            session.setAttribute("customer", userid);
                            session.setAttribute("c_fname", fname);
                            session.setAttribute("c_lname", lname);
                            session.setAttribute("c_email", email);
                            session.setAttribute("c_pass", password);
                            session.setAttribute("c_address", address);
                            session.setAttribute("c_gender", gender);
                            session.setAttribute("c_phone", phone);
                            session.setAttribute("c_regdate", regdate);
                            session.setAttribute("c_bflag", bflag);
        %>
        Valid Credentials
        <br/>
        <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
        <%
        } else {
        %>
        YOUR_ACCOUNT IS BLOCKED
        <br/><form action="unblock_customer.jsp">
            <input type="hidden" value="<%=uid%>" name="uid"> 
            <input type="submit" value="Unblock" >
        </form>
        <%
            }
        } else {
            out.println("invalid Credentials");
        %>
        <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
        <%
                        }
                        rs.close();
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
        %>  </body>
</html>