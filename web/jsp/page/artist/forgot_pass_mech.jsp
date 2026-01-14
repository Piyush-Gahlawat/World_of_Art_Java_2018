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
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                String userid;
                String valid;
                String pass;
                String ans;
                long uid;
                String query;
            %>

            <%
                userid = request.getParameter("a_id");
                valid = request.getParameter("ans");
                ans = request.getParameter("ansg");
                pass = request.getParameter("p");
                uid = Long.parseLong(userid);
                query = "Select * from artistdb where a_id=? and a_pass=md5(?)";
                if (ans.equals(valid)) {
                    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                    try (Connection con = DriverManager.getConnection(dburl,dbuser ,dbpass )) {
                        try (PreparedStatement ps = con.prepareStatement(query)) {
                            ps.setLong(1, uid);
                            ps.setString(2, pass);
                            try (ResultSet rs = ps.executeQuery()) {
                                if (rs.next()) {
                                    String bflag = rs.getString("a_block_f");
                                    if (bflag.equals("0")) {
                                        String fname = rs.getString("a_f_name");
                                        String lname = rs.getString("a_l_name");
                                        String email = rs.getString("a_email");
                                        String password = rs.getString("a_pass");
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
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
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
                            }
                        }
                    }
                } catch (SQLException ex) {

                }
            } else {
                out.println("Wrong Answer");
            %>
            <input type="button" class="navbutton" value="Home" onclick="redirect('<%=request.getContextPath()%>/home.jsp');">
            <%
                }
            %>
        </div></body>
</html>