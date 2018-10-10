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
        <title>Moving Item to Cart...</title>
    </head>
    <body>
        <a href="index.jsp">Home</a>
        <% String moviesFilePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieRental" class="wsd.main.MovieRental" scope="application">
            <jsp:setProperty name="movieRental" property="filePath" value="<%=moviesFilePath%>"/>
        </jsp:useBean>

        <% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
            <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
        </jsp:useBean>

        <%
            MoviesOrdered moviesOrdered = (MoviesOrdered) session.getAttribute("cart");
            if (moviesOrdered == null) {
                moviesOrdered = new MoviesOrdered();
            }
            String movie_id = request.getParameter("movie");
            Movies movies = movieRental.getMovies();
            Movie movie = movies.getMovie(movie_id);

            if (movie != null) {
                boolean movieExistsInCart = false;

                for (MovieOrdered movieOrdered : moviesOrdered.getList()) {
                    if (movieOrdered.getMovie_id().equals(movie_id)) {
                        movieExistsInCart = true;
                        if (Integer.parseInt(movie.getAvailable_copies()) > Integer.parseInt(movieOrdered.getCopies_purchased())) {
                            movieOrdered.setCopies_purchased((Integer.parseInt(movieOrdered.getCopies_purchased()) + 1) + "");
                            session.setAttribute("success", "Successfully added " + movieOrdered.getTitle() + " to cart. Amount in Cart:[" + movieOrdered.getCopies_purchased() +"]");
                        } else {
                            session.setAttribute("error", "No More Stock Left of this Item.");
                        }
                        break;
                    }
                }
                if (!movieExistsInCart) {
                    MovieOrdered movieOrdered = new MovieOrdered(movie.getMovie_id(), movie.getTitle(), movie.getGenre(), movie.getPrice(), movie.getRelease_date(), "1");
                    moviesOrdered.addMovie(movieOrdered);
                    session.setAttribute("success", "Successfully added " + movieOrdered.getTitle() + " to cart. Amount in Cart:[" + movieOrdered.getCopies_purchased() +"]");
                }

                session.setAttribute("cart", moviesOrdered);

                for (MovieOrdered movieOrdered : moviesOrdered.getList()) {
                    out.print(movieOrdered.getTitle() + " " + movieOrdered.getCopies_purchased() + ", ");
                }
                response.sendRedirect("index.jsp");
            }
            /*
            User user = (User) session.getAttribute("user");
            
            Movies movies = movieRental.getMovies();
            History history = historyManager.getHistory();
            UsersHistory usersHistory;
            String movie_id = request.getParameter("movie");
            
            Movie movie = movies.getMovie(movie_id);
            Orders orders = null; 
            int availablePre = Integer.parseInt(movie.getAvailable_copies());
                String availablePost = String.valueOf(availablePre - 1);
            Order currentOrder = null;
            if (user != null) {
                
                usersHistory = history.getUserHistory(user.getEmail());
                if (usersHistory != null) {
                //usersHistory = history.getUserHistory(user.getEmail());
               
                if (Integer.parseInt(availablePost) >= 0) {
                    usersHistory.addMovie(movie, "1");
                    movie.setAvailable_copies(availablePost);
                }
                
                historyManager.updateXML(history, historyFilePath);
                movieRental.updateXML(movies, moviesFilePath);
                orders = usersHistory.getOrders();
                //usersHistory.addOrders(orders);
                } else {
                    usersHistory = new UsersHistory(user.getEmail(), user.getName());
                    if (Integer.parseInt(availablePost) >= 0) {
                    usersHistory.addMovie(movie, "1");
                    movie.setAvailable_copies(availablePost);
                    history.addUser(usersHistory);
                    }
                    //movie.setAvailable_copies(availablePost);
                }
                    
                    historyManager.updateXML(history, historyFilePath);
                    movieRental.updateXML(movies, moviesFilePath);
                    orders = usersHistory.getOrders();
                    
                }
            

            if (movie == null) {
                out.print("Empty Movie");
            } else if (user != null && orders != null) {
                for (Order order : orders.getList()) {
                    if (!order.getStatus().equals("cancelled")) {
                        currentOrder = order;
                    }
                }
                out.println("Added " + movie.getTitle() + " to order ID " + currentOrder.getID());
                out.println(" Current total price = " + currentOrder.getSaleTotal());
                out.println(" You have " + currentOrder.getQuantityTotal(movie) + " of this movie in your cart");
            } else {
                out.print(movie.getTitle() + " - ");
                out.print(movie.getRelease_date() + " - $");
                out.print(movie.getPrice());
            }
             */
        %>
    </body>
</html>

