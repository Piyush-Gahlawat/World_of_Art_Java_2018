<%-- 
    Document   : homecontent
    Created on : 11 Jan, 
2018, 3:29:05 PM
    Author     : mkl
--%>
<%@page import="tools.getdata"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
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
        <script type="text/javascript" src="javascript/javascript.js"></script>
        <link type="text/css" href="resources\style.css" rel="stylesheet">
    </head>
    <body>
        <div class="content">
            <h1>Log-In</h1>
            <div class="content">   
                            
                                <form action="c_login.jsp" name="clog" onsubmit="return(validateclogin())" method="post">
                                <div class="login">
                                    <table>
                                    <tr><td><label id="uid">Userid</label></td>
                                        <td><input type="text" name="uid" placeholder="UserID"/></td></tr>
                                    <tr><td><label id="pass">Password</label></td>
                                        <td><input type="password" name="pass" placeholder="Password"/></td></tr>
                                    <tr><td><input type="button"  class="formbutton" value="Forgot Password"onclick="redirect('<%=request.getContextPath()%>/customer_forgot_password.jsp');"/></td>    
                                        <td><input type="submit" class="formbutton" value="submit"/></td></tr>    
                                </table>         
                            </div>
                                </form>                                 
            </div>
        </div>
    </body>
</html>
