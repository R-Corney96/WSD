<%-- 
    Document   : index
    Created on : 17/09/2018, 4:29:12 PM
    Author     : robert
--%>

<%@page contentType="text/html charsetEncoding=UTF-8" pageEncoding="UTF-8" import="wsd.main.*"%>
<%
User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="menu">
            <table>
                <td>
                    <% if(user == null){%>
                        <tr><a href="register.jsp">Register</a></tr>
                        <tr><a href="login.jsp">Login</a></tr>
                    <%}
                    else{%>
                        <tr><a href="account.jsp">My Account</a></tr>
                        <tr><a href="cart.jsp">Cart?</a></tr>
                        <tr><a href="logoutAction.jsp">Logout</a></tr>
                    <%}
                    %>
                </td>
            </table>
        </div>
    </body>
</html>
