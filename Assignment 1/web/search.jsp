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
            //get variable from search form that was sent
            String element = request.getParameter("element");
            String query = request.getParameter("query");

            // check to see if the user has a value besides default, if not error is sent back.
            if (query.equals("search")) {
                session.setAttribute("queryError", "Please make a Selection");
                response.sendRedirect("index.jsp");
            } else {
                // if value is not default search for the movies and output to xml
                session.setAttribute("search", "http://localhost:8080/Assignment_1/rest/search/query?element=" + element + "&query=" + query);
                session.setAttribute("submitted", true);
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
