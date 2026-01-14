<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="tools.IdGenerator"%>
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
                <%
                    String value = null;
                    value = IdGenerator.uniqueid();
                    session.setAttribute("a_reg", value);
                %>
                <form action="artist_registration_display.jsp" onsubmit="return(validateareg())" name="areg" method="post">
                    <table>
                        <tr><td>First Name</td>
                            <td><input type="text" name="fname" placeholder="First Name" required></td></tr>
                        <tr><td>Last Name</td>
                            <td><input type="text" name="lname" placeholder="Last Name" required></td></tr>
                        <tr><td>Address</td>
                            <td colspan="5"><textarea rows="5" columns="70" name="address" placeholder="Address" required>
                                </textarea></td></tr>
                        <tr><td>E-Mail</td>
                            <td><input type="text" name="email" placeholder="Email-ID" required></td></tr>
                        <tr><td>Contact</td>
                            <td><input type="text" name="contact" maxlength="10" accept="number" placeholder="Contact No." required></td></tr>
                        <tr><td>Gender</td>
                            <td>
                                <select name="gender" required>
                                    <option>(Choose Gender)</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>                   
                                    <option value="Other">Other</option>                   
                                </select>
                            </td></tr>
                        <tr><td>Security Question</td>
                            <td><input type="text" name="sq" placeholder="Question" required>
                            </td></tr>
                        <tr><td>Security Answer</td>
                            <td><input type="text" name="sa" placeholder="Answer" required>
                            </td></tr>
                        <tr><td>Password</td>
                            <td><input type="password" name="pass" placeholder="Password" required>
                            </td></tr>
                        <tr>
                            <td><input type="reset" class="formbutton" value="Reset"</td>
                            <td><input type="submit" class="formbutton" value="Submit"</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
