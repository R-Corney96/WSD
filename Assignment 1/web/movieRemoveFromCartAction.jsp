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
        <title>JSP Page</title>
    </head>
    <body>
        <%

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
                    t.removeMovie(toRemove);
                }
                
                t.removeMovie(toRemove);
            }
        %>
        <h1>Movie Removed</h1>
        <a href="index.jsp">Home</a>
    </body>
</html>
