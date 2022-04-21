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
            <footer>
                <xsl:value-of select="concat('Numero total de peliculas: ',count(peliculas/pelicula))"/>
            </footer>
        </body>
    </html>
</xsl:template>
<xsl:template match="//pelicula">
<div class="pelicula">
    <p>
    <xsl:value-of select="concat('Dirigida a: ',publico)"/>
    </p>
    <p>
        Puntuacion:
        <xsl:when test="valoracion/@puntos=1||valoracion/@puntos=2">
        <xsl:value-of select=" MUY BAJA"/>
        </xsl:when>
        <xsl:when test="valoracion/@puntos=3||valoracion/@puntos=4">
        <xsl:value-of select=" MEDIA"/>
        </xsl:when>
        <xsl:when test="valoracion/@puntos &lt;=5">
        <xsl:value-of select=" ALTA"/>
        </xsl:when>
        <xsl:value-of select="concat('Puntuacion: ',valoracion/@puntos)"/>
    </p>
    <p>
    <xsl:value-of select="nombre"/>
    </p>
</div></xsl:template>
</xsl:stylesheet>