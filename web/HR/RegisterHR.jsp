<%-- 
    Document   : RegisterHR
    Created on : 30 May, 2016, 1:35:04 PM
    Author     : aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../RegHR" method="post">
            <input type="text" placeholder="Name" name="user_name">
            <input type="email" placeholder="Email" name="user_email">
            <input type="password" placeholder="password" name="user_password">
            <button type="submit">Login</button>
        </form>
    </body>
</html>
