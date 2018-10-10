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
                        } else{
                            //Add to cart
                        }
                    }
                }
            }
        %>
    </body>
</html>
