<%-- 
    Document   : order_history
    Created on : 20 Jan, 2018, 3:47:54 PM
    Author     : mkl
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Calendar"%>
<%@page import="tools.getdata"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placing Order</title>
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <%!
                private String dburl = getdata.url();
                private String dbuser = getdata.user();
                private String dbpass = getdata.password();
                String userid;
                long uid;
String cid;
String id;
String oid;
String aid;
String artid;
String address;
String price;
String o_stat;
String p_stat;
String com;
private String query;
private String q;
Date o_date;
long art_id;
long c_id;
long o_id;
int amount;
int commission;
            %>

            <%
                oid = request.getParameter("o_id");
                cid = request.getParameter("c_id");
                artid = request.getParameter("art_id");
                address = request.getParameter("address");
                price = request.getParameter("amount");
                com = request.getParameter("com");
                o_stat = "0";
                p_stat = "0";
               o_id = Long.parseLong(oid);
               c_id = Long.parseLong(cid);
               art_id = Long.parseLong(artid);
               amount = Integer.parseInt(price);
               commission = Integer.parseInt(com);
                Calendar calendar = Calendar.getInstance();
                java.sql.Date o_date = new java.sql.Date(calendar.getTime().getTime());
                session.setAttribute("rev_ses", c_id);
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(dburl, dbuser, dbpass)) {
                     query = "insert into orderdb values(?,?,?,?,?,?,?,?,?)";
                     q = "update artdb set sold_status='1' where art_id=?";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setLong(1, o_id);
                        ps.setLong(2, art_id);
                        ps.setLong(3, c_id);
                        ps.setInt(4, amount);
                        ps.setString(5, o_stat);
                        ps.setString(6, p_stat);
                        ps.setDate(7, o_date);
                        ps.setString(8, address);
                        ps.setInt(9, commission);
                        int a = ps.executeUpdate();
                        if (a > 0) {
            %>
            <form action="print_bill.jsp" method="post">
                <input type="hidden" value="<%=o_id%>" name="o_id">
                <input type="hidden" value="<%=art_id%>" name="art_id">
                <input type="hidden" value="<%=c_id%>" name="c_id">
                <input type="hidden" value="<%=amount%>" name="amount">
                <input type="hidden" value="<%=o_date%>" name="date">
                <input type="hidden" value="<%=address%>" name="address">
                <input type="submit" class="formbutton" value="Print Bill">
            </form>
            <%} else {
                            out.print("Order Failed");
                        }
                        ps.close();
                    } catch (IOException | SQLException ex) {
                        out.print(ex);
                    }
try(PreparedStatement p1=con.prepareStatement(q)){
p1.setLong(1, art_id);
int b= p1.executeUpdate();
if(b>0){
out.print("Sold Status Changed");
}else

out.print("Sold Status Unchanged");
}
                    con.close();
                } catch (IOException | SQLException ex) {
                    out.print(ex);
                }
            %>
        </div>
    </body>
</html>