<%-- 
    Document   : login
    Created on : 17/09/2018, 4:29:42 PM
    Author     : robert
--%>

<%--
    Display movie list
    Allow user to register/login
    Can make movie selection on this page
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
    <h1>Login</h1>
    <%
    String var = request.getParameter("var");
    if(var != null){
        %>
        Login was not successful!
    <%
    }
    %>
        <form action="loginAction.jsp" method="post">
            <table>                
                <tr><td>Email</td><td><input type="text" name="email"></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"></td></tr>                
                <tr><td></td>
                    <td><input class="button" type="submit" value="Login"> 
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
