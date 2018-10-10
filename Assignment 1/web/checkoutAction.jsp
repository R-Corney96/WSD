<%-- 
    Document   : checkoutAction
    Created on : 08/10/2018, 6:29:03 PM
    Author     : robert
--%>
<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checking out...</title>
    </head>
    <body>
        <% String moviesFilePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieRental" class="wsd.main.MovieRental" scope="application">
            <jsp:setProperty name="movieRental" property="filePath" value="<%=moviesFilePath%>"/>
        </jsp:useBean>

        <% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
            <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
        </jsp:useBean>

        <%
            String payment = request.getParameter("payment");
            MoviesOrdered moviesOrdered = (MoviesOrdered) session.getAttribute("cart");

            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("checkout.jsp?var=1");
            } else {
                if (payment == null) {
                    response.sendRedirect("checkout.jsp?var=2");
                } else {
                    if (moviesOrdered == null) {
                        response.sendRedirect("checkout.jsp?var=3");
                    } else {
                        if (moviesOrdered.getList().size() == 0) {
                            response.sendRedirect("checkout.jsp?var=3");
                        } else {
                            //Add to cart
                            History history = historyManager.getHistory();
                            UsersHistory usersHistory = history.getUserHistory(user.getEmail());
                            if (usersHistory != null) {
                                Order order = new Order(payment, moviesOrdered);
                                usersHistory.addOrder(order);
                            } else {
                                usersHistory = new UsersHistory(user.getEmail(), user.getName());
                                Order order = new Order(payment, moviesOrdered);
                                usersHistory.addOrder(order);
                            }
                            Movies movies = movieRental.getMovies();

                            for (MovieOrdered movieOrdered : moviesOrdered.getList()) {
                                for (Movie movie : movies.getList()) {
                                    if (movieOrdered.getMovie_id().equals(movie.getMovie_id())) {
                                        movie.setAvailable_copies(String.valueOf(Integer.parseInt(movie.getAvailable_copies()) - Integer.parseInt(movieOrdered.getCopies_purchased())));
                                    }
                                }
                            }

                            historyManager.updateXML(history, historyFilePath);
                            movieRental.updateXML(movies, moviesFilePath);
                            session.setAttribute("payment", null);
                            session.setAttribute("cart", null);
                            session.setAttribute("success", "Order Completed!");
                            response.sendRedirect("index.jsp");
                        }
                    }
                }
            }
        %>
    </body>
</html>
