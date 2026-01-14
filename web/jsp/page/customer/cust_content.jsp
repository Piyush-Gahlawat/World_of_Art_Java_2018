<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="tools.getdata"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
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
            <h1>Customer</h1>
            <div class="content">        
                <table><tr><td>               <table><tr><td>
                            <input type="button" class="c" value="Galley" onclick="redirect('<%=request.getContextPath()%>/gallery.jsp');"><br/>
                <input type="button" class="c" value="Order History" onclick="redirect('<%=request.getContextPath()%>/order_history.jsp');"><br/>
                <input type="button" class="c" value="Edit Profile" onclick="redirect('<%=request.getContextPath()%>/edit_customer.jsp');"><br/>    
                <input type="button" class="c" value="Delete Profile" onclick="redirect('<%=request.getContextPath()%>/customer_delete.jsp');"/>
                        </td><td>
                                                                <%
                                        List list=new ArrayList();
                                        Class.forName("com.mysql.jdbc.Driver");
                                        try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                                            try (PreparedStatement ps = con.prepareStatement("select * from artdb")) {
                                            try(ResultSet r=ps.executeQuery()){
                                            while(r.next()){
                                                list.add(r.getString("art_path"));
                                            }
                                            int a=list.size();
                                int i;
                                Random ran=new Random();
                                i=ran.nextInt((a-0)-1)+0;
                                     %>
<img src="<%=request.getContextPath()+""+ list.get(i) %>" heighht="600px" width="600px">

                                    <%
                               
                                %>
                                </ul>
                        </td>
                        <%
                         r.close();
                         }
ps.close(); 
}
con.close();
}   
                        %>

                                </tr></table></td></tr></table>
                </div>
        </div>
    </body>
</html>
