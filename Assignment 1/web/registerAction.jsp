<%-- 
    Document   : registerAction
    Created on : 17/09/2018, 5:41:40 PM
    Author     : robert
--%>

<%@page contentType="text/html" import="java.util.*" import="wsd.main.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registering...</title>
</head>
<%
    // here we get all the paramters from the form that was by register.jsp
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone_number = request.getParameter("phone_number");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String tos = request.getParameter("tos");
%>

<%
    // user must accept TOS before they can be registered
    if (tos != null) {
        String filePath = application.getRealPath("WEB-INF/users.xml");
                String secondFilePath = application.getRealPath("WEB-INF/history.xml");%>
<!-- get user manager so the user can be added to the XML, also get history manager, so user can be added to history for when they make a purchase -->
<jsp:useBean id="usersManager" class="wsd.main.UsersManager" scope="application">
    <jsp:setProperty name="usersManager" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
    <jsp:setProperty name = "historyManager" property="filePath" value="<%=secondFilePath%>"/>
</jsp:useBean>
<%
    Users users = usersManager.getUsers();
    History history = historyManager.getHistory();
    email = users.test(email);
    // check if email is already in use
    if (email != null) {
        //add user to user xML
        User user = new User(email, name, password, phone_number, address);
        users.addUser(user);
        usersManager.updateXML(users, filePath);

%>

<%            // create history for user
    UsersHistory usersHistory = new UsersHistory(email, name);

    //historyManager.updateXML(history, secondFilePath);
    history.addUser(usersHistory);
    historyManager.updateXML(history, secondFilePath);

%>
<body> 
    <%     // set session for user and send them to the main page(view history)
        session.setAttribute("user", user);
        response.sendRedirect("main.jsp");
    } else {
        // if user cant be added, it returns one of these two errors
    %>
    <p>Sorry, email already in use.</p>
    <p>Click <a href="register.jsp">here</a> to go back.</p>
    <%}
    } else {%>
    <p>Sorry, you must agree to the Terms of Service.</p>
    <p>Click <a href="register.jsp">here</a> to go back.</p>
    <%}%>
</body>