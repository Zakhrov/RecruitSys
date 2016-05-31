<%-- 
    Document   : index
    Created on : 31 May, 2016, 10:53:44 AM
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
         <ul>
           
            <% 
                if(request.getSession().getAttribute("user_id")!=null)
                {
                    %>
            <li><a href="Profile.jsp">Profile</a></li>
            <li><a href="Logout">Logout</a></li>
            <%
                }
                else
                {
                    %>
             <li><a href="Login.jsp">Login</a></li>
            <li><a href="UserRegistration.jsp">Jobseeker Register</a></li>
            <%
                }
            %>
            
        </ul>
        <form action="JobSearch.jsp" method="get">
            <input type="text" name="search_term">
            <button type="submit">Search</button>
        </form>
    </body>
</html>
