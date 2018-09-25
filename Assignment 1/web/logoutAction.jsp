<%-- 
    Document   : logout
    Created on : 25/09/2018, 7:56:32 PM
    Author     : robert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        session.invalidate();
        response.sendRedirect("index.jsp");
    %>
</html>
