<%-- 
    Document   : change_password_mech
    Created on : 22 Mar, 2018, 6:12:22 PM
    Author     : mkl
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="tools.getdata"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
String id;
private String pass;
long c_id;
private String query;
private String dburl=getdata.url();
private String dbuser= getdata.user();
private String dbpass=getdata.password();
%>
<%                
                id = (String) session.getAttribute("customer");
                 pass = request.getParameter("new");
                c_id = Long.parseLong(id);
                query="update customerdb set c_pass=? where c_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setString(1, pass);
                        ps.setLong(2, c_id);
                        int rs = ps.executeUpdate();
                        if (rs > 0) {
                            out.println("Update Successful");
                            session.setAttribute("c_pass", pass);
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
                            out.print(ex);
                        }
                    con.close();
                } catch (IOException | SQLException ex) {
                            out.print(ex);
                        }
            %>
        </div>
    </body>
</html>
