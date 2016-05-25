<%-- 
    Document   : PostResume
    Created on : 25 May, 2016, 1:40:50 PM
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
        <form action="UploadResumeServlet" method="post">
            <label>Upload Resume (.docx format only) </label><input type="file" name="resume">
            <button type="submit">upload resume</button>
        </form>
    </body>
</html>
