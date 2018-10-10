<%-- 
    Document   : cancelOrder
    Created on : 09/10/2018, 4:39:46 PM
    Author     : Sebastian
--%>


<%@page contentType="text/html charsetEncoding=UTF-8" pageEncoding="UTF-8" import="wsd.main.*"%>


<% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
<jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
    <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
</jsp:useBean>
<% String moviesFilePath = application.getRealPath("WEB-INF/movies.xml");%>
        <jsp:useBean id="movieRental" class="wsd.main.MovieRental" scope="application">
            <jsp:setProperty name="movieRental" property="filePath" value="<%=moviesFilePath%>"/>
        </jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelling Order...</title>
    </head>
    <body>
        <%
           // Movies movies = movieRental.getMovies();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String orderID = request.getParameter("order");
                UsersHistory usersHistory = historyManager.getHistory().getUserHistory(user.getEmail());

                //If the user has history and an order with this id
                if (historyManager.getHistory().getUserHistory(user.getEmail()) != null) {
                    if (historyManager.getHistory().getUserHistory(user.getEmail()).containsOrder(orderID)) {
                        
                       // Order order = null;
                       // for (Order order2 : historyManager.getHistory().getUserHistory(user.getEmail()).getOrders().getList()) {
                         //   if (order2.getID() == orderID) {
                         //      order = order2; 
                         //   }
                        //}
                       // for (MovieOrdered movieOrdered : order.getMovies().getList()) {
                        //    for (Movie movie : movies.getList()) {
                        //        if (movieOrdered.getTitle().equals(movie.getTitle())) {
                        //            movie.setAvailable_copies(String.valueOf(Integer.parseInt(movie.getAvailable_copies()) + Integer.parseInt(movieOrdered.getCopies_purchased())));
                        //        }
                       //     }
                       // }
                       // movieRental.updateXML(movies, moviesFilePath);
                        historyManager.getHistory().getUserHistory(user.getEmail()).cancelOrder(orderID);
                        historyManager.updateXML(historyManager.getHistory(), historyFilePath);
                        response.sendRedirect("main.jsp?cancel=1");
                    } else {
                        //User doesn't have this order
                        response.sendRedirect("main.jsp?cancel=-1");
                    }
                }
            } else {
                //User isn't logged in
                response.sendRedirect("main.jsp?cancel=-1");
            }
            

        %>
    </body>
</html>
