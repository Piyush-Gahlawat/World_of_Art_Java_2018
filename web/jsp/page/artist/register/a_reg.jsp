<%--    
    Document   : c_reg
    Created on : 13 Mar, 2018, 10:44:17 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
                String id;
                String aid;
                long uid;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                private String query;
                private String q2;
                private String fname;
                private String lname;
                Calendar calendar = Calendar.getInstance();
                private java.sql.Date regdate = new java.sql.Date(calendar.getTime().getTime());
                private String address;
                private String email;
                private String gender;
                private String contact;
                private long phone;
                private int i;
                private int j;
                private String bflag;
                private String sq;
                private String sa;
                private String pass;
            %>
            <%
                aid = String.valueOf(session.getAttribute("a_reg"));
                uid = Long.parseLong(aid);
                fname = request.getParameter("fname");
                lname = request.getParameter("lname");
                address = request.getParameter("address");
                email = request.getParameter("email");
                gender = request.getParameter("gender");
                contact = request.getParameter("contact");
                phone = Long.parseLong(contact);
                sq = request.getParameter("sq");
                sa = request.getParameter("sa");
                pass = request.getParameter("pass");
                bflag = "0";
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    query = "insert into artistdb values(?,?,?,?,?,?,?,md5(?),?,?)";
                    q2 = "insert into a_security_question values(?,?,?,md5(?))";
                    try (PreparedStatement p1 = con.prepareStatement(query)) {
                        p1.setLong(1, uid);
                        p1.setString(2, fname);
                        p1.setString(3, lname);
                        p1.setString(4, address);
                        p1.setString(5, email);
                        p1.setString(6, gender);
                        p1.setLong(7, phone);
                        p1.setString(8, pass);
                        p1.setDate(9, regdate);
                        p1.setString(10, bflag);
                        i = p1.executeUpdate();
                        if (i > 0) {
                            try (PreparedStatement p2 = con.prepareStatement(q2)) {
                                p2.setLong(1, uid);
                                p2.setString(2, sq);
                                p2.setString(3, sa);
                                p2.setString(4, pass);
                                j = p2.executeUpdate();
                                if (j > 0) {
                                    out.println("Successful Registration");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                        session.setAttribute("creg", null);
                        session.invalidate();
                    }
                    p2.close();
                } catch (IOException | SQLException ex) {
                    out.println(ex);
                }
            } else {
                out.println("Unsuccessful Registration");
                session.setAttribute("creg", null);
                session.invalidate();
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
                        }
                        p1.close();
                    } catch (IOException | SQLException e) {
                        out.print(e);
                    }
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.print(ex);
                }
            %>
        </div>
    </body>
</html>
