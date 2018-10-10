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

        <% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
            <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
        </jsp:useBean>

        <% String moviesFilePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieRental" class="wsd.main.MovieRental" scope="application">
            <jsp:setProperty name="movieRental" property="filePath" value="<%=moviesFilePath%>"/>
        </jsp:useBean>
        <title>Removing From Cart...</title>
    </head>
    <body>
        <%
            MoviesOrdered moviesOrdered = (MoviesOrdered) session.getAttribute("cart");
            if (moviesOrdered == null) {
                moviesOrdered = new MoviesOrdered();
            }
            String movie_id = request.getParameter("movie");
            Movies movies = movieRental.getMovies();
            Movie movie = movies.getMovie(movie_id);

            if (movie != null) {

                for (MovieOrdered movieOrdered : moviesOrdered.getList()) {
                    if (movieOrdered.getMovie_id().equals(movie_id)) {
                        movieOrdered.setCopies_purchased((Integer.parseInt(movieOrdered.getCopies_purchased()) - 1) + "");
                        session.setAttribute("success", "Successfully Removed " + movieOrdered.getTitle() + " from cart. Amount in Cart:[" + movieOrdered.getCopies_purchased() + "]");

                        if (movieOrdered.getCopies_purchased().equals("0")) {
                            moviesOrdered.removeMovie(movieOrdered);
                        }
                        break;
                    }
                }

                session.setAttribute("cart", moviesOrdered);

                for (MovieOrdered movieOrdered : moviesOrdered.getList()) {
                    out.print(movieOrdered.getTitle() + " " + movieOrdered.getCopies_purchased() + ", ");
                }
            }
            
            response.sendRedirect("checkout.jsp");
            
            /*
            String i = request.getParameter("var");
            if (i == null) {
                out.print("no movie selected to remove");
            } else {
                History history = historyManager.getHistory();
                UsersHistory usersHistory = null;
                int a = Integer.parseInt(i);
                User user = (User) session.getAttribute("user");
                usersHistory = history.getUserHistory(user.getEmail());
                ArrayList<Order> orders = usersHistory.getOrders().getList();
                Order t = null;
                for (Order order : orders) {
                    if (order.getStatus().equals("submitted")) {
                        t = order;
                    }
                }
                if (t.getStatus().equals("submitted")) {
                    ArrayList<MovieOrdered> movies = t.getMovies().getList();
                    MovieOrdered movie = movies.get(a);
                    t.removeMovie(movie);
                }
                
            }*/
        %>
        <h1>Movie Removed</h1>
        <a href="index.jsp">Home</a>
    </body>
</html>
