<%-- 
    Document   : homecontent
    Created on : 11 Jan, 
2018, 3:29:05 PM
    Author     : mkl
--%>

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
                <table>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div class="login">
                                <form action="admin_logging.jsp" name="adlog" onsubmit="return(validateadlogin())" method="post">
                                    <label>Userid</label>
                                    <input type="text" name="uid" placeholder="UserID"/><br/>
                                    <label>Password</label>
                                    <input type="password" name="pass" placeholder="Password"/><br/>
                                    <input type="submit" value="submit"/>               
                                </form>
                            </div>
                        </td>
                    </tr>   
                </table>         
            </div>
        </div>
    </body>
</html>
