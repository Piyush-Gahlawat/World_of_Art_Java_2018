<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>World of Art!</h1>
            <div class="content">
                <table><tr><td class="home1">
                            <div>
                                <ul>
                                    <%
                                        List list = new ArrayList();
                                        Class.forName("com.mysql.jdbc.Driver");
                                        try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                                            try (PreparedStatement ps = con.prepareStatement("select * from artdb")) {
                                                try (ResultSet r = ps.executeQuery()) {
                                                    while (r.next()) {
                                                        list.add(r.getString("art_path"));
                                                    }
                                                    int a = list.size();
                                                    if (a != 0) {
                                                        int i;
                                                        Random ran = new Random();
                                                        i = ran.nextInt((a - 0) - 1) + 0;
                                    %>
                                    <img src="<%=request.getContextPath() + "" + list.get(i)%>" heighht="600px" width="600px">
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                        </td>
                        <%
                                        r.close();
                                    }
                                    ps.close();
                                }
                                con.close();
                            }
                        %>
                        <td class="home2">
                            The main objective of this website is to streamline the process of Gallery view. This website helps in maintaining the flow of information among the concern art viewers and interested purchasers. This is implemented to increase the Viewer ship, reliability and speed of flow of information using the online methodology.<br>
                            World of Art runs as a business, with the purpose of displaying the artwork to promote it to potential buyers as well as give artists a platform to display their art.
                        </td></tr>
                </table>
            </div>
        </div>
    </body>
</html>
