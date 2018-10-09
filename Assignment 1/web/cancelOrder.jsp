<%-- 
    Document   : cancelOrder
    Created on : 09/10/2018, 4:39:46 PM
    Author     : Sebastian
--%>


<%@page contentType="text/html charsetEncoding=UTF-8" pageEncoding="UTF-8" import="wsd.main.*"%>


<% String historyFilePath = application.getRealPath("WEB-INF/history.xml");%>
<jsp:useBean id="historyManager" class="wsd.main.HistoryManager" scope="application">
    <jsp:setProperty name="historyManager" property="filePath" value="<%=historyFilePath%>"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancelling Order...</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String orderID = request.getParameter("order");
                UsersHistory usersHistory = historyManager.getHistory().getUserHistory(user.getEmail());

                //If the user has history and an order with this id
                if (usersHistory != null) {
                    if (usersHistory.containsOrder(orderID)) {
                        usersHistory.cancelOrder(orderID);
                        response.sendRedirect("main.jsp?var=1");
                    } else {
                        for(Order order : usersHistory.getOrders().getList()){
                            out.write(order.getID() + ", ");
                        }
                        out.write("1");
                        //response.sendRedirect("main.jsp?var=0");
                    }
                }
            } else {
                out.write("2");
                //response.sendRedirect("main.jsp?var=0");
            }
            

        %>
    </body>
</html>
