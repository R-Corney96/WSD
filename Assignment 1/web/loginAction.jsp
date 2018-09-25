<%-- 
    Document   : loginAction
    Created on : 17/09/2018, 5:18:16 PM
    Author     : robert
--%>

<%@page import="wsd.main.User"%>
<%@page import="wsd.main.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login_Action_Page</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
    <jsp:useBean id="diaryApp" class="wsd.main.DiaryApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <%
    Users users = diaryApp.getUsers();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    User user = users.login(email, password);
    
            if (user != null) {
                session.setAttribute("user", user);
            %><p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>                        
            <%}else{
            %><p>Username or Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            <%}
    %>
    </body>
</html>

