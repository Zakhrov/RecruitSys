<%-- 
    Document   : Login
    Created on : 26 May, 2016, 12:00:03 PM
    Author     : aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <% if(request.getParameter("err")=="1")
        {
           %>
           <h1>Invalid Credentials</h1>
        <% 
        }%>
        <form action="LoginServlet" method="post">
            <input type="email" placeholder="Email" name="user_email">
            <input type="password" placeholder="password" name="user_password">
            <button type="submit">Login</button>
        </form>
    </body>
</html>
