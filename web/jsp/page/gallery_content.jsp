<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Statement"%>
<%@page import="tools.*"%>
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
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body><%!
        
        %>
        <div class="content">
            <h1>Gallery</h1>
            <div class="content">        
                <table border="2">
                    <tr>
                        <td>
                            <form name="sort" action="search.jsp" method="post">
                                <table>
                                    <th><h1>Sorting</h1></th>
                                    <tr><td>Price</td></tr>
                                    <tr><td>Min<br/><input type="text" name="min" value="" /> <br/>
                                    <tr><td> to</td></tr>
                                    <tr><td>Max<br/><input type="text" name="max" value=""/></td></tr>
                                    <tr><td>Art Type<br/></td></tr>
                                    <tr><td><input type="radio" name="arttype" value="" checked />All</td>
                                    <tr><td><input type="radio" name="arttype" value="painting"/>Painting<br/></td></tr>
                                    <tr><td><input type="radio" name="arttype" value="photo"/>Photograph<br/></td></tr>
                                    <tr><td><input type="radio" name="arttype" value="sculpture"/>Sculpture</td></tr>
                                    <tr><td>Availability</td></tr>
                                    <tr><td><input type="radio" name="avail" value="" checked />All</td></tr>
                                    <tr><td><input type="radio" name="avail" value="avail"/>Exclude Sold</td></tr>
                                    <tr><td><input type="submit" class="formbutton" value="sort"/></td></tr>
                                </table>    
                            </form>
                        </td>
                        <td><div class="content">
                                <table class="wide" border="2"><thead>
                                    <th>Art Id</th>
                                    <th>Picture</th>
                                    <th>Price(&#x20b9)</th>
                                    <th>Art Type</th>
                                    <th>Description</th>
                                    <th>Upload Date</th>
                                    <th>Availability</th>
                                    <%
                                        if (session.getAttribute("customer") != null) {
                                    %>
                                    <th> Buy</th>
                                    <div>            
                                        <%
                                            }
                                        %>
                                        <th>
                                            Reviews
                                        </th></thead>
                                        <%                                            
                                            Class.forName("com.mysql.jdbc.Driver");
                                            try (Connection con = DriverManager.getConnection(getdata.url(), getdata.user(), getdata.password())) {
                                                try (PreparedStatement ps = con.prepareStatement("select * from artdb")) {
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
                                                <img src="<%=request.getContextPath()+""+art_path%>" width="300px" height="300px"/>
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
                                            <td><form action="add_cart.jsp">
                                                    <input type="hidden" value="<%=art_id%>" name="art_id">
                                                    <input type="hidden" value="<%=price%>" name="art_price">
                                                    <input type="hidden" value="<%=desc%>" name="desc">
                                                    <input type="hidden" value="<%=art_path%>" name="path">
                                                    <input type="hidden" value="<%=type%>" name="art_type">
                                                    <input type="submit" class="tablebutton" value="Cart">
                                                </form>
                                            </td>
                                            <%
                                                }
                                            %>
                                            <td>
                                                <form action="review.jsp">      
                                                    <input type="hidden" value="<%=art_id%>" name="art_id">
                                                    <input type="submit" class="tablebutton" value="Reviews" >
                                                </form> 
                                            </td>
                                        </tr>                
                                        <%
                                            }
                                        %>           
                                </table> 
                            </div>
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
                        </td>
                    </tr>   
                </table> 
            </div>
        </div>
    </body>
</html>
