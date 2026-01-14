<%-- 
    Document   : order_history
    Created on : 20 Jan, 2018, 3:47:54 PM
    Author     : mkl
--%>

<%@page import="tools.*"%>
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
            <h1>Placing Order</h1>
            <div class="content">
            <%!
                String userid;
                 private String q;
                long uid;
String cid;
String id;
String oid;
String aid;
String pric;
String arttype;
String art_path;
String desc;
String artid;
String ostat;
String odate;
String address;
long art_id;
long c_id;
long o_id;
int amount;
int com;
            %>

                <%
                     oid = IdGenerator.orderid();
                     cid = (String) session.getAttribute("customer");
                    pric = request.getParameter("art_price");
                    artid = request.getParameter("art_id");
                    art_path = request.getParameter("path");
                    arttype = request.getParameter("art_type");
                    desc = request.getParameter("desc");
                    c_id = Long.parseLong(cid);
                    art_id = Long.parseLong(artid);
                    o_id = Long.parseLong(oid);
                    amount = Integer.parseInt(pric);
                    com = getdata.commission(amount);
                    amount = amount + com;
                     address = (String) session.getAttribute("c_address");
                    session.setAttribute("o_ses", o_id);
                %>
                <table>
                    <tr>
                        <td>
                            Order ID   
                        </td>
                        <td>
                            <%=o_id%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Art Type
                        </td>
                        <td>
                            <%=arttype%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Art ID
                        </td>
                        <td>
                            <%=art_id%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Art Description   
                        </td>
                        <td>
                            <%=desc%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Picture
                        </td>
                        <td>
                            <img src="<%=request.getContextPath() + "" + art_path%>" width="300px" height="300px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Amount
                        </td>
                        <td>
                            &#x20b9  <%=amount %><div class="pr"><%="("+pric+"+"+com+" )"%></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="making_order.jsp" method="post">
                                <input type="hidden" value="<%=o_id%>" name="o_id">
                                <input type="hidden" value="<%=c_id%>" name="c_id">
                                <input type="hidden" value="<%=art_id%>" name="art_id">
                                <input type="hidden" value="<%=address%>" name="address">
                                <input type="hidden" value="<%=amount%>" name="amount">  
                                <input type="hidden" value="<%=com%>" name="com">  
                                <input type="submit" class="formbutton" value="Process"/>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>