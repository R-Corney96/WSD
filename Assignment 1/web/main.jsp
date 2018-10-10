<%-- 
    Document   : main
    Created on : 17/09/2018, 4:44:33 PM
    Author     : robert
--%>

<%@page import="wsd.main.MovieOrdered"%>
<%@page import="wsd.main.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wsd.main.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-store" />
<meta http-equiv="expires" content="-1" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<!DOCTYPE html>
<html>
    <head>
        <% User user = (User) session.getAttribute("user");
            Object cancelOrderFeedback = (Object) session.getAttribute("cancel");
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
    </head>
    <body>
        <!-- Main Header Menu for Website Directory -->
        <table class="menu">
            <tr>
                <td><a href="index.jsp">Movies</a></td>
                <td><a href="checkout.jsp">Checkout</a></td>
                <td><a href="account.jsp">Edit Account</a></td>
                <td><a href="logoutAction.jsp">Logout</a></td>
            </tr>
        </table>

        <div>
            <h1><%=user.getName()%>'s History</h1>
            <%  if (cancelOrderFeedback != null) {
                    if (cancelOrderFeedback.equals("-1")) { %>
            <p class="error">There was an error cancelling the order.</p>
            <%      } else if (cancelOrderFeedback.equals("1")) {%>
            <p class="success">Order Cancelled. May take a few seconds for XML to update!</p>
            <%      }
                    session.setAttribute("cancel", "0");
                }
            %>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
            <c:import var="xml" url="/WEB-INF/history.xml" />

            <c:set var="xslt">
                <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                                xmlns:history="http://www.uts.edu.au/31284/wsd-history">
                    <xsl:output method="html"/>
                    <xsl:template match="/">
                        <html>
                            <head>
                                <link rel="stylesheet" href="../style.css"/>
                                <style>
                                    .history {  border: 0px solid transparent; width: 500; border-spacing: 0px 0;}
                                    .tableline { border-top: 3px solid #ddd; }
                                    .darktableline { border-top: 1px solid #222; }

                                    .order { background-color: #e1e1e1; }
                                    .order_info { background-color: #f7f7f7; }
                                    .order_id { padding: 5px 0px 0px 5px; border-top: 1px solid #222; }
                                    .status {padding: 5px 5px 0px 0px; border-top: 1px solid #222; }

                                    .title { font-weight: bold; display: inline-block; padding: 5px 0px 0px 5px; }
                                    .release_date { font-style: italic; display: inline-block; }
                                    .genre { font-style: italic; font-size: 0.75em; padding: 1px 0px 0px 5px; }
                                    .price { text-decoration: underline; text-align: right; font-size: 0.9em; padding: 0px 5px 0px 0px;}
                                    .copies_purchased {font-size: 0.9em; padding: 5px;}
                                    .total_price { font-weight: bold; text-decoration: underline; text-align: right; font-size: 0.9em; padding: 0px 5px 0px 0px;}
                                    .cancel_button { text-align: right; padding: 5px;}
                                    .blank_row { height: 30px !important; }
                                </style>
                            </head>
                            <body> <xsl:apply-templates/> </body>
                        </html>
                    </xsl:template>


                    <xsl:template match="history:history">
                        <table class="history">
                            <thead>
                                <tr>
                                    <th>Order History</th>
                                </tr>
                            </thead>
                            <tbody>
                            <xsl:apply-templates/>
                            </tbody>
                        </table>
                    </xsl:template>


                    <xsl:template match="history:users_history">
                        <xsl:choose>
                            <xsl:when test="history:email = '<%=user.getEmail()%>'">
                                <xsl:apply-templates/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:template>

                    <xsl:template match="history:orders">
                        <xsl:apply-templates/>
                    </xsl:template>

                    <xsl:template match="history:order">
                        <tr class="order">
                            <td class="order_id">Order <xsl:value-of select="history:id" /></td>
                        <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
                        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
                        <td class="status">
                            Status: <xsl:value-of select="translate(history:status, $lowercase, $uppercase)" />
                        </td>

                        </tr>
                        <xsl:apply-templates/>
                    </xsl:template>

                    <xsl:template match="history:id"/>
                    <xsl:template match="history:status"/>

                    <xsl:template match="history:movies_ordered">
                        <xsl:apply-templates/>
                    </xsl:template>
                    <xsl:template match="history:movie_ordered">
                        <xsl:apply-templates/>
                    </xsl:template>



                    <xsl:template match="history:release_date"/>
                    <xsl:template match="history:movie_id"/>
                    <xsl:template match="history:price"/>
                    <xsl:template match="history:email"/>
                    <xsl:template match="history:name"/>
                    <xsl:template match="history:payment_method"/>

                    <xsl:template match="history:title">
                        <tr  class="order_info">
                            <td class="tableline">
                                <div class="title"><xsl:apply-templates/></div>
                                <div class="release_date">(<xsl:value-of select="../history:release_date"/>)</div>
                            </td>
                            <td class="tableline"/>
                        </tr>
                    </xsl:template>


                    <xsl:template match="history:genre">
                        <tr class="order_info">
                            <td class="genre" colspan="2"> Genre: <xsl:apply-templates/> </td>
                        </tr>
                    </xsl:template>

                    <xsl:template match="history:copies_purchased">
                        <tr class="order_info">
                            <td class="copies_purchased"> QTY: <xsl:apply-templates/> </td>
                        <td class="price">
                            Price: $<xsl:value-of select="../history:price"/>
                        </td>
                        </tr>
                    </xsl:template>


                    <xsl:template match="history:total_cost">
                        <tr class="order_info">
                            <td class="tableline">Payment Method: <xsl:value-of select="../history:payment_method"/>

                        </td>
                        <td class="tableline">
                            <div class="total_price"> Total: $<xsl:apply-templates/> </div>
                        </td>
                        </tr>
                        <xsl:choose>
                            <xsl:when test="../history:status = 'submitted'">
                                <tr class="order_info">
                                    <td/>
                                    <td class="cancel_button">
                                        <button type="button"> 
                                            <xsl:attribute name="onclick">location.href='cancelOrder.jsp?order=<xsl:value-of select="../history:id"/>'</xsl:attribute>
                                            CANCEL</button>
                                    </td>
                                </tr>
                                <tr class="blank_row"><td class="darktableline" colspan="2"/></tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr class="order_info blank_row"><td colspan="2"/></tr>
                                <tr class="blank_row"><td class="darktableline" colspan="2"/></tr>
                            </xsl:otherwise>
                        </xsl:choose>

                    </xsl:template>


                </xsl:stylesheet>
            </c:set>

            <x:transform xml="${xml}" xslt="${xslt}"/>

        </div>
    </body>
</html>
