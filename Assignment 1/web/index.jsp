<%-- 
    Document   : index
    Created on : 17/09/2018, 4:29:12 PM
    Author     : robert
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html charsetEncoding=UTF-8" pageEncoding="UTF-8" import="wsd.main.*"%>
<link rel="stylesheet" href="style.css">
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
    </head>
    <body>
        <!-- Main Header Menu for Website Directory -->
        <table class="menu">
            <tr>
                <%
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

        <!-- Generate HTML for Movies List using XSL Transform -->
        <div>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
            <c:import var="xml" url="/WEB-INF/movies.xml" />
            <c:import var="xslt" url="/WEB-INF/movies.xsl"/>
            <x:transform xml="${xml}" xslt="${xslt}"/>
        </div>
    </body>
</html>
