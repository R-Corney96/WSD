<%-- 
    Document   : accountAction
    Created on : 25/09/2018, 8:35:38 PM
    Author     : robert
--%>

<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
    <jsp:useBean id="diaryApp" class="wsd.main.DiaryApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    User user = (User) session.getAttribute("user");
    Users users = diaryApp.getUsers();
    users.removeUser(user);
    
    user.setName(name);
    user.setPassword(password);
    user.setPhone_number(phone);
    user.setAddress(address);
    
    users.addUser(user);
    diaryApp.setUsers(users);
    diaryApp.updateXML(users, filePath);
    session.setAttribute("user", user);
    response.sendRedirect("account.jsp");
%>
</html>
