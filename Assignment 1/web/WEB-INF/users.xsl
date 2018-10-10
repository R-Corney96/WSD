<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : users.xsl
    Created on : 10 October 2018, 7:16 PM
    Author     : robert
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:test="http://www.uts.edu.au/31284/wsd-users">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>users.xsl</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="test:users">
        <table class="users">
            <thead>
                <tr>
                    <th>Users</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Email</td>
                    <td>Name</td>
                    <td>Password</td>
                    <td>Phone</td>
                    <td>Address</td>
                </tr>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="test:user">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="test:user/test:email">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="test:user/test:name">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="test:user/test:password">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="test:user/test:phone_number">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="test:user/test:address">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
