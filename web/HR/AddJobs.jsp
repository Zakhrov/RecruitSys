<%-- 
    Document   : AddJobs
    Created on : 25 May, 2016, 1:20:14 PM
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
        <form action="AddJobServlet" method="post">
            <label>Name</label><input type="text" name="job_name" required>
            <label>Minimum Qualification</label><input type="text" name="job_qual" required>
            <label>Description</label><textarea name="job_desc" ></textarea>
            <button type="submit">Add Job</button>
        </form>
    </body>
</html>
