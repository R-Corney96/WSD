<%-- 
    Document   : accountAction
    Created on : 25/09/2018, 8:35:38 PM
    Author     : robert
--%>

<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <% String usersFilePath = application.getRealPath("WEB-INF/users.xml"); %>
    <jsp:useBean id="usersManager" class="wsd.main.UsersManager" scope="application">
    <jsp:setProperty name="usersManager" property="filePath" value="<%=usersFilePath%>"/>
    </jsp:useBean>
    
    <% String historyFilePath = application.getRealPath("WEB-INF/history.xml"); %>
    <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
    <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
    </jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Updating...</title>
    </head>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    User user = (User) session.getAttribute("user");
    Users users = usersManager.getUsers();
    users.removeUser(user);
    
    user.setName(name);
    user.setPassword(password);
    user.setPhone_number(phone);
    user.setAddress(address);
    
    users.addUser(user);
    usersManager.setUsers(users);
    usersManager.updateXML(users, usersFilePath);
    
    
    History history = historyManager.getHistory();
    history.UpdateUserName(email, name);
    historyManager.updateXML(history, historyFilePath);
    
    session.setAttribute("user", user);
    response.sendRedirect("account.jsp");
%>
</html>
