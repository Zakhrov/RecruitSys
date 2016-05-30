<%-- 
    Document   : MyJobs
    Created on : 30 May, 2016, 12:49:52 PM
    Author     : aaron
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.JStatusParser"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="Logout">Logout</a>
        <h1>MyJobs</h1>
       <% Database db=new Database();
            PreparedStatement GetJobs=db.conn.prepareStatement("select job_name, applied_status from jobs inner join applied_jobs on jobs.job_id=applied_jobs.job_id where applied_jobs.user_id=?");
            GetJobs.setString(1, request.getSession().getAttribute("user_id").toString());
            
            ResultSet JobSet=GetJobs.executeQuery();
            
        %>
        <table>
            <tr>
                <th>Job Name</th><th>Application Status</th>
            </tr>
            <% while(JobSet.next())
            {
               %>
               <tr>
                   <td><%=JobSet.getString("job_name")%></td><td><%=JStatusParser.ParseStatus(JobSet.getInt("applied_status"))%></td>
               </tr>
            <% 
            }%>
        </table>
    </body>
</html>
