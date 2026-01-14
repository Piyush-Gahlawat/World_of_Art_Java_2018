<%-- 
    Document   : get_question
    Created on : 28 Mar, 2018, 12:07:55 PM
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
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                String userid;
                String q1;
                long uid;
            %>
            <%
                userid = request.getParameter("uid");
                uid = Long.parseLong(userid);
                q1 = "Select * from a_security_question where a_id=?";
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                    try (PreparedStatement p1 = con.prepareStatement(q1)) {
                        p1.setLong(1, uid);
                        try (ResultSet r1 = p1.executeQuery()) {
                            while (r1.next()) {
                                String q = r1.getString("question");
                                String ans = r1.getString("answer");
                                String pass = r1.getString("pass");
            %>
            <form action="artist_forgot_password_mecha.jsp" name="secq" onsubmit="return (validatesq())" method="post">
                <input type="hidden" value="<%=ans%>" name="ans">
                <input type="hidden" value="<%=userid%>" name="a_id">
                <input type="hidden" value="<%=pass%>" name="p">
                <table>
                    <tr><td>Security Question</td><td><%=q%></td></tr>
                    <tr><td>Answer</td><td><input type="text" name="ansg"</td></tr>
                    <tr><td></td><td><input type="submit" value="Submit"</td></tr>
                </table></form>
                <%
                                }
                                r1.close();
                            } catch (SQLException ex) {
                                out.println(ex);
                            }
                            p1.close();
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
