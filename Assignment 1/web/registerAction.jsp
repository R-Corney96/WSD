<%-- 
    Document   : registerAction
    Created on : 17/09/2018, 5:41:40 PM
    Author     : robert
--%>

<%@page contentType="text/html" import="java.util.*" import="wsd.main.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
            <% 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String tos = request.getParameter("tos");
        %>
        
        <%if(tos != null){
      String filePath = application.getRealPath("WEB-INF/users.xml");
      String secondFilePath = application.getRealPath("WEB-INF/history.xml");%>
    <jsp:useBean id="diaryApp" class="wsd.main.DiaryApplication" scope="application">
    <jsp:setProperty name="diaryApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
      <jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
          <jsp:setProperty name = "historyManager" property="filePath" value="<%=secondFilePath%>"/>
      </jsp:useBean>
    <%
    Users users = diaryApp.getUsers();
    History history = historyManager.getHistory();
    email = users.test(email);
    
    if(email != null){
        User user = new User(email,name,password,phone_number,address);
        users.addUser(user);
        diaryApp.updateXML(users, filePath);
        UsersHistory usersHistory = new UsersHistory(email, name);
        historyManager.updateXML(history, secondFilePath);
        
        %>
        <body> 
 <%
        session.setAttribute("user", user);
        response.sendRedirect("main.jsp");
    }else{
%>
    <p>Sorry, email already in use.</p>
    <p>Click <a href="register.jsp">here</a> to go back.</p>
    <%}
    }
    else{%>
    <p>Sorry, you must agree to the Terms of Service.</p>
    <p>Click <a href="register.jsp">here</a> to go back.</p>
    <%}%>
        </body>