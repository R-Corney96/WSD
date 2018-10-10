<?xml version="1.0" encoding="UTF-8"?>

<!-- Transforms the movies.xml into a formatted table where the user can add movies to their cart -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:test="http://www.uts.edu.au/31284/wsd-movies"
>
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../style.css"/>
                <style>
                    .movies {  border: 0px solid transparent; width: 500; border-spacing: 0px 0;}
                    .tableline { border-top: 3px solid #ddd; }
                    .title { font-weight: bold; display: inline-block; padding: 5px 0px 0px 5px; }
                    .release_date { font-style: italic; display: inline-block; }
                    .genre { font-style: italic; font-size: 0.75em; padding: 1px 0px 0px 5px; }
                    .price { text-decoration: underline; text-align: right; font-size: 0.9em; padding: 0px 5px 0px 0px;}
                    .avaliable_copies {font-size: 0.9em; padding: 5px;}
                    .purchase_button { text-align: right; padding: 5px;}
                    
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
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="test:movie/test:release_date"/>
    <xsl:template match="test:movie/test:movie_id"/>
    
    <xsl:template match="test:movie/test:title">
        <tr>
            <td class="tableline">
                <div class="title"><xsl:apply-templates/></div>
                <div class="release_date">(<xsl:value-of select="../test:release_date"/>)</div>
            </td>
            <td class="tableline"/>
        </tr>
    </xsl:template>
    
    
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
                    <button type="button"> 
                        <xsl:attribute name="onclick">location.href='movieAddToCartAction.jsp?movie=<xsl:value-of select="../test:movie_id"/>'</xsl:attribute>
                        BUY</button>
                </xsl:when>
                <xsl:otherwise>
                    <button type="button" disabled="disabled">OUT OF STOCK</button>
                </xsl:otherwise>
            </xsl:choose>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>