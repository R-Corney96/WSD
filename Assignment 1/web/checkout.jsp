<%-- 
    Document   : checkout
    Created on : 08/10/2018, 6:03:50 PM
    Author     : robert
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <table class="menu">
                <tr>
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user == null) {
                    %>
                    <td><a href="register.jsp">Register</a></td>
                    <td><a href="login.jsp">Login</a></td>
                    <%
                        }
                    %>
                    <td><a href="checkout.jsp">Checkout</a></td>
                    <%
                        if (user != null) {
                    %>
                    <td><a href="main.jsp">History</a></td>
                    <td><a href="logoutAction.jsp">Logout</a></td>
                    <%
                        }
                    %>
                </tr>
            </table>
                
        <h1>Checkout</h1>

        <%
            String var = request.getParameter("var");
            if (var != null) {
                if (var.equals("1")) {
                    %><p class="error">Please <a href="login.jsp">log in</a> to buy movies</p><%
                } else if (var.equals("2")) {
                    %><p class="error">Please select a payment option</p><%
                } else if (var.equals("3")) {
                    %><p class="error">Your cart is empty.</p><%
                }
            }
        %>

                <%
            String error = (String) session.getAttribute("error");
            if (error != null) {
                %><p class="error"><%=error%></p><%
                            session.setAttribute("error", null);
                        }
                        String success = (String) session.getAttribute("success");
                        if (success != null) {
                %><p class="success"><%=success%></p><%
                            session.setAttribute("success", null);
                        }
            %>
        
        <% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
            <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
        </jsp:useBean>
        <table>
            <%

                /*User user = (User) session.getAttribute("user");
                if (user == null) {

                    History history = historyManager.getHistory();
                    UsersHistory currentUser = null;
                    for (UsersHistory usersHistory : history.getList()) {
                        if (usersHistory.getEmail().equals(user.getEmail())) {
                            currentUser = usersHistory;
                        }
                    }
                    ArrayList<Order> orders = currentUser.getOrders().getList();
                    int i = 0;
                    Order t = null;
                    for (Order order : orders) {
                        if (order.getStatus().equals("submitted")) {
                            t = order;
                        }
                    }
                }*/
                
                MoviesOrdered moviesOrdered = (MoviesOrdered) session.getAttribute("cart");

                //if (t.getStatus().equals("submitted")) {
                //ArrayList<MovieOrdered> movies = t.getMovies().getList();
                for (MovieOrdered movie : moviesOrdered.getList()) {
            %><tr><td><%
                out.println(movie.getTitle());
                out.println(movie.getGenre());
                out.println(movie.getPrice());
                out.println(movie.getRelease_date());
                out.println(movie.getCopies_purchased());
                
                    %>
                    <form action="movieRemoveFromCartAction.jsp" method="post"><input type="hidden" name="movie" value="<%=movie.getMovie_id()%>"><input type="submit" value="Remove"></form></td></tr>
                        <% //}
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
