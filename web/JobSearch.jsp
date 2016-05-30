<%-- 
    Document   : JobSearch
    Created on : 30 May, 2016, 11:51:55 AM
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
            PreparedStatement GetJobs=db.conn.prepareStatement("select * from jobs where job_desc LIKE ? or job_name LIKE ?");
            GetJobs.setString(1, "%"+request.getParameter("search_term")+"%");
            GetJobs.setString(2, "%"+request.getParameter("search_term")+"%");
            ResultSet JobSet=GetJobs.executeQuery();
        %>
        <ul>
            <% if(request.getSession().getAttribute("user_id")!=null)
                   { %>
            <li>My Jobs</li>
            <li>Logout</li>
            <% }
                else{
            %>
            <li><a href="Login.jsp">Login</a></li>
            <%
}
%>
            
        </ul>
        <% while(JobSet.next())
        {
           %>
           <div>
               <ul>
                   <li><strong><%=JobSet.getString("job_name")%></strong></li>
                   <li><%=JobSet.getString("job_min_qual")%></li>
                   <li><%=JobSet.getString("job_cat")%></li>
                   <li><%=JobSet.getString("job_desc")%></li>
               </ul>
                   <% if(request.getSession().getAttribute("user_id")!=null)
                   { %>
               <form action="ApplyJob" method="post">
                   <input type="hidden" value="<%=JobSet.getString("job_id")%>" name="job_id" >
                   <button type="submit">Apply</button>
               </form>
                   <% }
                      else{
                            out.println("You need to be logged in to Apply");

                            }
                    %>
           </div>
        <% 
        }%>
    </body>
</html>
