<%-- 
    Document   : checkout
    Created on : 08/10/2018, 6:03:50 PM
    Author     : robert
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="index.jsp">Movies</a>
        <h1>Checkout</h1>

        <%
            String var = request.getParameter("var");
            if (var != null) {
                if (var.equals("1")) {
                    %><h2>Please log in to buy movies</h2><%
                } else if (var.equals("2")) {
                    %><h2>Please select a payment option</h2><%
                }
            }
        %>

        <% String filePath = application.getRealPath("WEB-INF/history.xml");%>
        <% String historyFilePath = application.getRealPath("WEB-INF/history.xml"); %>
    <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
    <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
    </jsp:useBean>
        <jsp:useBean id="moviesordered" class="wsd.main.MoviesOrdered" scope="application">
        </jsp:useBean>
        <table>
        <%
            User user = (User) session.getAttribute("user");
            History history = historyManager.getHistory();
            UsersHistory currentUser = null;
            for (UsersHistory usersHistory : history.getList()) {
                if (usersHistory.getEmail().equals(user.getEmail()))
                {
                    currentUser = usersHistory;
                }
            }
            ArrayList<Order> orders = currentUser.getOrders().getList();
                int i=0;
                Order t = orders.get(0);
                ArrayList<MovieOrdered> movies = t.getMovies().getList();
                for(MovieOrdered movie : movies){
                    %><tr><td><%
                    out.println(movie.getTitle());
                    out.println(movie.getGenre());
                    out.println(movie.getPrice());
                    out.println(movie.getRelease_date());
                    out.println(movie.getCopies_purchased());
                    %>
                    <form action="movieRemoveFromCartAction.jsp" method="post"><input type="hidden" name="var" value="<%=i%>"><input type="submit" value="Remove"></form></td></tr>
            <%
                i++;
            }
        %>
        </table>
        <form action='checkoutAction.jsp' method='post'>
            <table>
                <tr>
                    <td><p>Payment Method</p></td>
                </tr>
                <tr>
                    <td>
                        <p>Master Card<input type='radio' name='payment' value='mastercard'></p>     
                        <p>Pay Pal<input type='radio' name='payment' value='paypal'></p>     
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
