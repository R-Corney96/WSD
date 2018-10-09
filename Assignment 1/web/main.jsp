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
<!DOCTYPE html>
<html>
    <head>
        <% User user = (User) session.getAttribute("user");%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>

        <div>
            <table>
                <td>
                <tr><a href="account.jsp">My Account</a></tr>
                <tr><a href="logoutAction.jsp">Logout</a></tr>
                <tr><a href="index.jsp">Movies</a></tr>
                </td>
            </table>
        </div>

        <div>
            <h1><%=user.getEmail()%> History</h1>

            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
            <c:import var="xml" url="/WEB-INF/history.xml" />

            <c:set var="xslt">
                <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                                xmlns:history="http://www.uts.edu.au/31284/wsd-history"
                                >
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
                            <td class="order_id">Order <xsl:value-of select="@id" /></td>
                        <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
                        <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
                        <td class="status">
                            Status: <xsl:value-of select="translate(history:status, $lowercase, $uppercase)" />
                        </td>

                        </tr>
                        <xsl:apply-templates/>
                    </xsl:template>

                    <xsl:template match="history:status"/>

                    <xsl:template match="history:movie">
                        <xsl:apply-templates/>
                    </xsl:template>

                    <xsl:template match="history:movie/history:release_date"/>
                    <xsl:template match="history:movie/history:movie_id"/>
                    <xsl:template match="history:movie/history:price"/>
                    <xsl:template match="history:email"/>
                    <xsl:template match="history:name"/>
                    <xsl:template match="history:payment_method"/>

                    <xsl:template match="history:movie/history:title">
                        <tr  class="order_info">
                            <td class="tableline">
                                <div class="title"><xsl:apply-templates/></div>
                                <div class="release_date">(<xsl:value-of select="../history:release_date"/>)</div>
                            </td>
                            <td class="tableline"/>
                        </tr>
                    </xsl:template>


                    <xsl:template match="history:movie/history:genre">
                        <tr class="order_info">
                            <td class="genre" colspan="2"> Genre: <xsl:apply-templates/> </td>
                        </tr>
                    </xsl:template>

                    <xsl:template match="history:movie/history:copies_purchased">
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
                                            <xsl:attribute name="onclick">location.href='cancelOrder.jsp?order=<xsl:value-of select="../@id"/>'</xsl:attribute>
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
