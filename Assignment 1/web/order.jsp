<%-- 
    Document   : order
    Created on : 03/10/2018, 7:52:40 PM
    Author     : user
--%>
<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
    </head>
    <%
        User user = (User) session.getAttribute("user");
    %>
    <body>
        
        <% String userName = "";
        if (user != null) {
            userName = user.getName();
        
        } else {
        userName = "Unknown User, who dis?";
        }
        
        %>
         <h2 class="header">Orders</h2>
        <table class="main_table" >
            <tr ><td align="right" class="userName" >You are logged in as  <%=userName%></td></tr>
    </body>
</html>
