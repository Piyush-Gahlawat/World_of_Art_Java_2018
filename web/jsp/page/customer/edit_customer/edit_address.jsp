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
String address;                
String id;                
private String fname;               
private String lname;               
private String  gender;              
private String state;                
private String query;               
private String q1;               
                Calendar calendar = Calendar.getInstance();
                private java.sql.Date up_date = new java.sql.Date(calendar.getTime().getTime());
private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();

%>
<%
                address = request.getParameter("address");
                id = (String) session.getAttribute("customer");
                fname = (String) session.getAttribute("c_fname");
                lname = (String) session.getAttribute("c_lname");
                gender = (String) session.getAttribute("c_gender");
                if (gender.equals("Male")) {
                    state = fname + " " + lname + " has requested to update his address";
                } else if (gender.equals("Female")) {
                    state = fname + " " + lname + " has requested to update her address";
                } else {
                    state = fname + " " + lname + " has requested to update address";
                }
                q1="insert into editcustomer values(?,?,?,?)";
                query = "update customerdb set c_address ='" + address + "' where c_id='" + id + "'";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(q1)) {
                        ps.setString(1, query);
                        ps.setString(2, id);
                        ps.setString(3, state);
                        ps.setDate(4, up_date);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
            } else {
                out.println("Update Unsuccessful");
            %>
            <input type="button" value="go to home" onclick='redirect("<%=request.getContextPath()%>/home.jsp");'>
            <%
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
