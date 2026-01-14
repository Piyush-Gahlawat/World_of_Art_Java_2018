<%-- 
    Document   : up_req_list
    Created on : 20 Mar, 2018, 11:10:46 AM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="tools.search_query"%>
<%@page import="tools.getdata"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <table border="2">
            <thead>
            <th>Art Id</th>
            <th>Picture</th>
            <th>Price</th>
            <th>Art Type</th>
            <th>Description</th>
            <th>Upload Date</th>
            <th>Availability</th>

            <%
                if (session.getAttribute("customer") != null) {
            %>  
            <th> Buy</th>
                <%
                    }
                %>  
            <th>
                Reviews
            </th>                       
        </thead>
        <%
            int min;
            int max;
            if (request.getParameter("min").length() != 0) {
                min = Integer.parseInt(request.getParameter("min"));
            } else {
                min = 0;
            }
            if (request.getParameter("max").length() != 0) {
                max = Integer.parseInt(request.getParameter("max"));
            } else {
                max = 0;
            }
            String arttype;
            if (request.getParameter("arttype").length() != 0) {
                arttype = request.getParameter("arttype");
            } else {
                arttype = "";
            }
            String avail;
            if (request.getParameter("avail").length() != 0) {
                avail = "on";
            } else {
                avail = "";
            }
            search_query sq = new search_query();
            String query = sq.search_query(min, max, arttype, avail);
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            int art_id = rs.getInt("art_id");
                            int price = rs.getInt("art_price");
                            String type = rs.getString("art_type");
                            String desc = rs.getString("description");
                            Date up_date = rs.getDate("date_of_upload");
                            String upload_date = up_date.toString();
                            String sold_stat = rs.getString("sold_status");
                            String art_path = rs.getString("art_path");
        %>
        <tr>
            <td>
                <%=art_id%>
            </td>
            <td>
                <img src="<%=request.getContextPath() + "" + art_path%>" width="300px" height="300px"/>
            </td>
            <td>
                <%=price%>
            </td>
            <td>
                <%=type%>
            </td>
            <td>
                <%=desc%>    
            </td>
            <td>
                <%=upload_date%>
            </td>
            <td>
                <%
                    if (sold_stat.equals("0")) {
                        out.print("Unsold");
                    } else {
                        out.print("Sold");
                    }
                %>
            </td>
            <%
                if (session.getAttribute("customer") != null) {
            %>  
            <td><form action="add_cart.jsp" method="post">
                    <input type="hidden" vlaue="<%=art_id%>" name="art_id">
                    <input type="submit" class="tablebutton" value="Cart">
                </form>
            </td>
            <%
                }
            %>
            <td>
                <form action="review.jsp" method="post">      
                    <input type="hidden" value="<%=art_id%>" name="art_id">
                    <input type="submit" class="tablebutton" value="Reviews" >
                </form> 
            </td>
        </tr>                
        <%
            }
        %>
    </table>     
    <%
                    rs.close();
                } catch (SQLException ex) {
                    out.println(ex);
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
</body>
</html>