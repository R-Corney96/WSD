<%-- 
    Document   : movieAddToCartAction
    Created on : 03/10/2018, 5:25:05 PM
    Author     : Sebastian
--%>

<%@page import="java.util.List"%>
<%@page import="wsd.main.Orders"%>
<%@page import="java.util.ArrayList"%>
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
            User user = (User) session.getAttribute("user");

            Movies movies = movieRental.getMovies();
            
            String movie_id = request.getParameter("movie");
            
            Movie movie = movies.getMovie(movie_id);
            Orders orders = null;
            Order currentOrder = null;
            if (user != null) {
            user.addMovie(movie, "1");
            orders = user.getOrders();
            
            }
            if(movie == null){
                out.print("Empty Movie");
            } else if (user != null && orders != null)
            {
                for (Order order : orders.getList()) {
                    if (!order.getStatus().equals("cancelled")) {
                        currentOrder = order;
                    }
                }
                out.println("Added " + movie.getTitle() + " to order ID " + currentOrder.getID());
                out.println("Current total price = " + currentOrder.getSaleTotal());
                }
                else {
            out.print(movie.getTitle() + " - ");
            out.print(movie.getRelease_date() + " - $");
            out.print(movie.getPrice());
            }
        %>
    </body>
</html>

