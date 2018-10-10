<%-- 
    Document   : search
    Created on : 10/10/2018, 3:01:54 PM
    Author     : robert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String element = request.getParameter("element");
    String query = request.getParameter("query");
    
    if(element == null || query == null){
    session.setAttribute("queryError", "Please make sure proper selection");
    response.sendRedirect("index.jsp");
    }
    
    session.setAttribute("search", "http://localhost:8080/Assignment_1/rest/search/query?element="+element+"&query="+query);
    session.setAttribute("submitted", true);
    response.sendRedirect("index.jsp");
    
%>
    </body>
</html>
