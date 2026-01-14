<%-- 
    Document   : homecontent
    Created on : 11 Jan, 2018, 3:29:05 PM
    Author     : mkl
--%>

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
            <h1>Search</h1>
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
                        <td>
                            <div class="content">            
                                <%@include file="searching.jsp" %>
                            </div>
                        </td>
                    </tr>   
                </table> 
            </div>
        </div>
    </body>
</html>
