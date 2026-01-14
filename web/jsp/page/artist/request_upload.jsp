<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

<%@page import="tools.IdGenerator"%>
<%@page import="tools.UploadServlet"%>
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
            <h1>Request Upload</h1>
            <div class="content">        
                <form action="UploadServlet" method="post" enctype="multipart/form-data" name="upform" onsubmit="return (validateupload())" method="post">
                    <table>            
                        <tr><td>Art Type</td>
                            <%
                                String value = null;
                                value = IdGenerator.artid();
                                session.setAttribute("up_req", value);
                            %>
                        <tr><td><input type="radio" name="arttype" value="painting">Painting</td></tr>
                        <tr><td><input type="radio" name="arttype" value="photo">Photograph</td></tr>
                        <tr><td><input type="radio" name="arttype" value="sculpture">Sculpture</td></tr></tr>
                        <tr><td>Price</td><td><input type="text" name="price"></td></tr>
                        <tr><td>Image</td><td><input type="file" accept=".jpg"  name="picture" required></td></tr>
                        <tr><td>Description</td><td><input type="text" name="description" required>
                            <input type="hidden" value="<%=value%>" name="art_id" required></tr>
                        <tr><td><input type="reset" class="formbutton" value="reset"></td>
                            <td><input type="submit" class="formbutton" value="submit"></td></tr>    
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
