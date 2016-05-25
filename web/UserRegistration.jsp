<%-- 
    Document   : UserRegistration
    Created on : 24 May, 2016, 4:39:46 PM
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
        <form action="RegUser" method="post">
            <label>Name</label><input type="text" name="uname" required>
            <label>Email</label><input type="email" name="uemail" required>
            <label>Password</label><input type="password" name="upassword" required>
        </form>
    </body>
</html>
