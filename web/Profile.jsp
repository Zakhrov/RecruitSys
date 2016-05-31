<%-- 
    Document   : Profile
    Created on : 31 May, 2016, 10:44:08 AM
    Author     : aaron
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Database db=new Database();
            PreparedStatement GetJobs=db.conn.prepareStatement("select user_name from users where user_id=?");
            GetJobs.setString(1, request.getSession().getAttribute("user_id").toString());
            
            ResultSet UserNames=GetJobs.executeQuery();
          UserNames.first();
        %>
        <h1>Hello <%=UserNames.getString("user_name") %> </h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="PostResume.jsp">Upload Resume</a></li>
        </ul>
    </body>
</html>
