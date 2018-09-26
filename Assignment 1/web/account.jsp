<%-- 
    Document   : account
    Created on : 17/09/2018, 4:46:19 PM
    Author     : robert
--%>

<%@page import="wsd.main.*"%>
<%-- 
    Allow for account detail modification
    Allow for account deletion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>jsp page</title>
    </head>
    <%
        User user = (User) session.getAttribute("user");
    %>
    <body>
        <h1>My Account</h1>
                <form action='accountAction.jsp' method='post' name='update'>
        <table style='border:none'>
            <tr>
                <td>Email</td>
                <td><input type='email' name='email' value="<%=user.getEmail()%>"></td>
            </tr>
            <tr>
                <td>Full name</td>
                <td><input type='text' name='name' value="<%=user.getName()%>"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type='password' name='password' value="<%=user.getPassword()%>"></td>
            </tr>
            <tr>
                <td><input type='submit' value='Save'></td>
            </tr>
        </table>
        </form>
        <p>Return to the <a href="main.jsp">main page</a>.</p>
    </body>
</html>
