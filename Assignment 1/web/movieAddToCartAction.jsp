<%-- 
    Document   : movieAddToCartAction
    Created on : 03/10/2018, 5:25:05 PM
    Author     : Sebastian
--%>

<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Moving Item to Cart</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieRental" class="wsd.main.MovieRental" scope="application">
            <jsp:setProperty name="movieRental" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%
            Movies movies = movieRental.getMovies();
            
            String movie_id = request.getParameter("movie");
            
            Movie movie = movies.getMovie(movie_id);
            
            
            if(movie_id.equals("")){
                out.print("Empty String");
            } else{
            out.print(movie_id);
            }
        %>
    </body>
</html>

