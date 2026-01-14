<%-- 
    Document   : edit_address
    Created on : 20 Mar, 2018, 11:23:39 PM
    Author     : mkl
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
                private String phone;
String id;
long a_id;
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                private String fname;
                private String lname;
                private String gender;
                private String state;
                Calendar calendar = Calendar.getInstance();
                private java.sql.Date up_date = new java.sql.Date(calendar.getTime().getTime());
                private String query;
                private String q1;
                private int rs;
            %>         
            <%
                phone = request.getParameter("phone");
                id = (String) session.getAttribute("artist");
                a_id = Long.parseLong(id);
                fname = (String) session.getAttribute("a_fname");
                lname = (String) session.getAttribute("a_lname");
                gender = (String) session.getAttribute("a_gender");
                query = "update artistdb set a_phone ='" + phone + "' where a_id='" + id + "'";
                q1 = "insert into editartist values(?,?,?,?)";
                if (gender.equals("Male")) {
                    state = fname + " " + lname + " has requested to update his phone number";
                } else if (gender.equals("Female")) {
                    state = fname + " " + lname + " has requested to update her phone number";
                } else {
                    state = fname + " " + lname + " has requested to update phone number";
                }
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setString(1, query);
                        ps.setLong(2, a_id);
                        ps.setString(3, state);
                        ps.setDate(4, up_date);
                        rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/artist.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" class="formbutton" value="go to home" onclick='redirect("<%=request.getContextPath()%>/artist.jsp");'>
            <%
                        }
                        ps.close();
                    } catch (IOException | SQLException ex) {
                        out.println(ex);
                    }
                    con.close();
                } catch (IOException|SQLException ex) {
                    out.print(ex);
                }

            %>
        </div>
    </body>
</html>
