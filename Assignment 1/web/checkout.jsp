<%-- 
    Document   : checkout
    Created on : 08/10/2018, 6:03:50 PM
    Author     : robert
--%>
<%@page import="wsd.main.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Checkout</h1>
        
        <%
            String var = request.getParameter("var");
            switch(var){
                case "1" :%><h2>Please log in to buy.</h2><%break;
                case "2" :%><h2>Please select a payment method.</h2><%break;
                default : break ;
            }
        %>

        <% String filePath = application.getRealPath("WEB-INF/history.xml");%>
        <jsp:useBean id="checkout" class="wsd.main.Checkout" scope="application">
            <jsp:setProperty name="checkout" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <%
        
        %>

        <form action='checkoutAction.jsp' method='post'>
        <table>
            <tr>
                <td><p>Payment Method</p></td>
            </tr>
            <tr>
                <td>
                    <p>Master Card<input type='radio' name='payment' value='mastercard'></p>     
                    <p>Pay Pal<input type='radio' name='payment' value='paypal'></p>     
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit">
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>
