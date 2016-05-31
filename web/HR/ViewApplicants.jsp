<%-- 
    Document   : ViewApplicants
    Created on : 30 May, 2016, 1:43:13 PM
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
        <a href="Landing.jsp">Home</a>
        <% Database db=new Database();
            PreparedStatement GetJobs=db.conn.prepareStatement("select user_name,users.user_id from users inner join applied_jobs on applied_jobs.user_id=users.user_id and applied_jobs.job_id=?");
            GetJobs.setString(1, request.getParameter("job_id"));
            ResultSet JobSet=GetJobs.executeQuery();
            
        %>
        <table>
            <tr>
                <th>User Name</th><th>Options</th>
            </tr>
            <% while(JobSet.next())
            {
               %>
               <tr>
                           <td><%=JobSet.getString("user_name")%></td><td><form action="../DownloadResume" method="post">
                                   <input type="hidden" name="user_id" value="<%=JobSet.getString("users.user_id")%>">
                                   <input type="hidden" name="job_id" value="<%=request.getParameter("job_id")%>">
                                   <button type="submit">Download Resume</button>
                               </form><form action="../Shortlist" method="post">
                                   <input type="hidden" name="user_id" value="<%=JobSet.getString("users.user_id")%>">
                                   <input type="hidden" name="job_id" value="<%=request.getParameter("job_id")%>">
                                   <button type="submit">Shortlist</button>
                               </form>
                                   </form><form action="../Reject" method="post">
                                   <input type="hidden" name="user_id" value="<%=JobSet.getString("users.user_id")%>">
                                   <input type="hidden" name="job_id" value="<%=request.getParameter("job_id")%>">
                                   <button type="submit">Reject</button>
                               </form>
                           </td>
               </tr>
            <% 
            }%>
        </table>
    </body>
</html>
