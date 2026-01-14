<%-- 
    Document   : registration_display
    Created on : 12 Mar, 2018, 4:11:30 PM
    Author     : mkl
--%>

<%@page import="tools.getdata"%>
<%@page import="java.util.Date" %>
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
            <h1>Artist Register</h1>
            <div class="content">
            <div class="t">
                <form action="/artist/register/a_reg.jsp" method="post">
            <table>
                <%
                    session.getAttribute("a_reg");
                %>
                <tr>
                    <td>UID</td>
                    <td>
                        <%
                            String uid = String.valueOf(session.getAttribute("a_reg"));
                        %>
                        <%=uid%>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        <%
                            String fname = request.getParameter("fname");
                            out.println(fname);
                        %>
                        <input type="hidden" name='fname' value="<%=fname%>">
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <%
                            String lname = request.getParameter("lname");
                            out.print(lname);
                        %>
                        <input type="hidden" name="lname" value="<%=lname%>">
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <%
                            String address = request.getParameter("address");
                            out.print(address);
                        %>
                        <input type="hidden" name="address" value="<%=address%>">
                    </td>
                </tr>
                <tr>
                    <td>E-Mail</td>
                    <td>
                        <%
                            String email = request.getParameter("email");
                            out.print(email);
                        %>
                        <input type="hidden" name="email" value="<%=email%>">
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <%
                            String contact = request.getParameter("contact");
                            out.print(contact);
                        %>
                        <input type="hidden" name="contact" value="<%=contact%>">
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <%
                            String gender = request.getParameter("gender");
                            out.print(gender);
                        %>
                        <input type="hidden" name="gender" value="<%=gender%>">
                    </td>
                </tr>
                                            <tr>
                                <td>
                                    Security Question
                                </td>
                                <td>
                                    <%
                                        String sq = request.getParameter("sq");
                                        out.print(sq);
                                    %>
                                    <input type="hidden" name="sq" value="<%=sq%>">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Security Answer
                                </td>
                                <td>
                                    <%
                                        String sa = request.getParameter("sa");
                                        out.print(sa);
                                    %>
                                    <input type="hidden" name="sa" value="<%=sa%>">
                                </td>
                            </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <%
                            String pass = request.getParameter("pass");
out.print("XXXXXXXXXXX");                       
%>
                        <input type="hidden" name="pass" value="<%=pass%>">
                    </td>
                </tr>
                <tr>
                    <td><input type="button" value="Reset" onclick='redirect("<%=request.getContextPath()%>/artist_register.jsp")'></td>
                    <td><input type="button" value="Print" onclick='window.print()'></td>
                    <td><input type="submit" value="Submit"</td>
                </tr>
            </table>
        </form>
            </div></div></div>
    </body>
</html>
