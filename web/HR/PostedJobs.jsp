<%-- 
    Document   : PostedJobs
    Created on : 30 May, 2016, 1:30:41 PM
    Author     : aaron
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.JStatusParser"%>
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
        <h1>Hello World!</h1>
        <% Database db=new Database();
            PreparedStatement GetJobs=db.conn.prepareStatement("select job_id, job_name from jobs where jobs.hr_id=?");
            GetJobs.setString(1, request.getSession().getAttribute("hr_id").toString());
            ResultSet JobSet=GetJobs.executeQuery();
            
        %>
        <table>
            <tr>
                <th>Job Name</th><th>Options</th>
            </tr>
            <% while(JobSet.next())
            {
               %>
               <tr>
                   <td><%=JobSet.getString("job_name")%></td><td><form action="ViewApplicants.jsp" method="post"><input type="hidden" value="<%=JobSet.getString("job_id")%>" name="job_id"><button type=submit">View Applicants</button></form></td>
               </tr>
            <% 
            }%>
        </table>
    </body>
</html>
