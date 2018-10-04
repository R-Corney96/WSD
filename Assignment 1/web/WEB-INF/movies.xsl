<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : movies.xsl
    Author     : Sebastian
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:test="http://www.uts.edu.au/31284/wsd-movies"
>
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../style.css"/>
                <style>
                    .movies {  }
                    .movie { border: 1px solid black; width: 500;}
                    .title { font-weight: bold; display: inline-block;}
                    .release_date { font-style: italic; display: inline-block;}
                    .genre { font-style: italic; font-size: 0.75em; }
                    .price { text-decoration: underline; text-align: right; font-size: 0.9em;}
                    .avaliable_copies {font-size: 0.9em; }
                    .purchase_button { text-align: right; }
                </style>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="test:movies">
        <table class="movies">
            <thead>
                <tr>
                    <th>Movies</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    
    
    <xsl:template match="test:movie">
        <table class="movie">
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    
    
    <xsl:template match="test:movie/test:title">
        <tr>
            <td>
                <div class="title"><xsl:apply-templates/></div>
                <div class="release_date">(<xsl:value-of select="../release_date"/>)</div>
            </td>
        </tr>
    </xsl:template>
    
    
    <xsl:template match="test:movie/test:release_date"/>

    
    <xsl:template match="test:movie/test:genre">
        <tr>
        <td class="genre"> 
            Genre: <xsl:apply-templates/> 
        </td>
        </tr>
    </xsl:template>
    
    
    <xsl:template match="test:movie/test:price">
        <tr>
            <td/>
        <td class="price"> 
            Price: $<xsl:apply-templates/> 
        </td >
        </tr>
    </xsl:template>
    
    
    <xsl:template match="test:movie/test:available_copies">
        <tr>
            <td class="avaliable_copies">
            In Stock: <xsl:apply-templates/>
            </td>
            <td class="purchase_button">
            <xsl:choose>
                <xsl:when test="current() > 0">
                    <button type="button" onclick="alert('This should do something')">BUY</button>
                </xsl:when>
                <xsl:otherwise>
                    <button type="button" disabled="true">OUT OF STOCK</button>
                </xsl:otherwise>
            </xsl:choose>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>