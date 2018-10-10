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
                    } else {
                %>
                <td><a href="main.jsp">History</a></td>
                <td><a href="logoutAction.jsp">Logout</a></td>
                <%
                    }
                %>
                <td><a href="checkout.jsp">Checkout</a></td>
            </tr>
        </table>
        <form action='search.jsp' method='post'>
            <table>
                <tr>
                    <td><input type="text" name="query"></td>
                    <td>Genre<input type='radio' name='element' value='genre'>Title<input type='radio' name='element' value='title'>Year<input type='radio' name='element' value='year'></td>
                </tr>
                <tr><td><input type="hidden" name="submitted" value="submitted" ><input type="submit" value="Search"></td></tr>
        </form>

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
        <!-- Generate HTML for Movies List using XSL Transform -->
        <div>
            <%
                String queryError = (String) session.getAttribute("queryError");
                if (queryError != null) {
            %><p><%=queryError%></p><%
                    session.setAttribute("queryError", null);
                }
            %>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
            <%
                if (session.getAttribute("submitted") != null) {
                    String url = (String) session.getAttribute("search");
                    session.setAttribute("submitted", null);
            %>
            <c:import var="xml" url="<%=url%>"/>
            <%
            } else {%>
            <c:import var="xml" url="/WEB-INF/movies.xml"/>
            <%}%>
            <c:import var="xslt" url="/WEB-INF/movies.xsl"/>
            <x:transform xml="${xml}" xslt="${xslt}"/>
        </div>
    </body>
</html>
