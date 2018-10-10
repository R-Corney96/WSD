<%-- 
    Document   : loginAction
    Created on : 17/09/2018, 5:18:16 PM
    Author     : robert
--%>

<%@page import="wsd.main.UsersHistory"%>
<%@page import="wsd.main.History"%>
<%@page import="wsd.main.User"%>
<%@page import="wsd.main.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in...</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");
        String secondFilePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="usersManager" class="wsd.main.UsersManager" scope="application">
            <jsp:setProperty name="usersManager" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
          <jsp:setProperty name = "historyManager" property="filePath" value="<%=secondFilePath%>"/>
      </jsp:useBean>

        <%
            History history = historyManager.getHistory();
            Users users = usersManager.getUsers();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            User user = users.login(email, password);

            if (user != null) {
                if (history.getUserHistory(user.getEmail()) == null) {
                    UsersHistory usersHistory = new UsersHistory(user.getEmail(), user.getName());
                    history.addUser(usersHistory);
                }
                session.setAttribute("user", user);
                response.sendRedirect("main.jsp");
                
            } else {
                response.sendRedirect("login.jsp?var=1");
            }
        %>
    </body>
</html>

