<%-- 
    Document   : index
    Created on : 30 May, 2016, 1:11:04 PM
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
        <% if(request.getParameter("err")=="1")
        {
           %>
           <h1>Invalid Credentials</h1>
        <% 
        }%>
        <form action="../HRLoginServlet" method="post">
            <input type="email" placeholder="Email" name="user_email">
            <input type="password" placeholder="password" name="user_password">
            <button type="submit">Login</button>
        </form>
        <a href="RegisterHR.jsp">Register</a>
    </body>
</html>
