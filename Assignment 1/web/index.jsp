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
                        <tr><a href="register.jsp">Register</a></tr>
                        <tr><a href="login.jsp">Login</a></tr>
                </td>
            </table>
        </div>
        <div>
                    <% String filePath = application.getRealPath("WEB-INF/movies.xml"); %>
    <!--
    <jsp:useBean id="movieApp" class="wsd.main.MovieApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    -->
        </div>
    </body>
</html>
