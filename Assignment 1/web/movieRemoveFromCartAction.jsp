<%-- 
    Document   : movieRemoveFromCartAction
    Created on : 09/10/2018, 1:50:53 AM
    Author     : robert
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="wsd.main.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String i = request.getParameter("var");
        if(i == null){
        out.print("no movie selected to remove");
        }
        else{
            int a = Integer.parseInt(i);
            User user = (User) session.getAttribute("user");
            ArrayList<Order> orders = user.getOrders().getList();
            Order t = orders.get(0);
            ArrayList<MovieOrdered> movies = t.getMovies().getList();
            MovieOrdered movie = movies.get(a);
            t.removeMovie(movie);
        }            
        %>
        <h1>Movie Removed</h1>
        <a href="index.jsp">Home</a>
    </body>
</html>
