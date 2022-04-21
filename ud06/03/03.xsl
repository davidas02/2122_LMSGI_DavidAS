<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
   <xsl:text disable-output-escaping="yes">
       &lt;!DOCTYPE html&gt;

   </xsl:text> 
    <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <title>03 XSLT David Aparicio</title>
            <link href="03.css"  rel="stylesheet"  type="text/css" />
            <link rel="icon" href="/images/favicon/favicon.ico" type="image/ico" />
        </head>
        <body>
            <h1>Informacion de peliculas</h1>
            <xsl:for-each select="peliculas/preceding-sibling::comment()">
                <xsl:comment>
                    <xsl:value-of select="current()"/>
                </xsl:comment>
            </xsl:for-each>
            <div id="peliculas">
                <xsl:apply-templates select="//pelicula"/>
            </div>
            
        </body>
        <footer>
            <xsl:value-of select="concat('Numero total de peliculas: ',count(peliculas/pelicula))"/>
        </footer>
    </html>
</xsl:template>
<xsl:template match="//pelicula">
<div class="pelicula">
    <p>
    <xsl:value-of select="concat('Dirigida a: ',publico)"/>
    </p>
    <p>
        Puntuacion:
       <xsl:choose>
           <xsl:when test="valoracion/@puntos&lt;=2">
            <p class="baja"><xsl:text>BAJA</xsl:text></p>
        </xsl:when>
        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="valoracion/@puntos&gt;=5">
                    <p class="alta"><xsl:text>ALTA</xsl:text></p>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="valoracion/@puntos&gt;=3">
                            <p class="media"><xsl:text>MEDIA</xsl:text></p>
                        </xsl:when>
                    </xsl:choose>
                </xsl:otherwise>
        </xsl:choose>
        </xsl:otherwise>
       </xsl:choose>
    </p>
    <p>
    <xsl:value-of select="nombre"/>
    </p>
    </div>
</xsl:template>
</xsl:stylesheet>