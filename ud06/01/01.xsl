<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="/edificio">
<html>
    <head>
        <title>XSLT01 David Aparicio</title>
        <meta charset="utf-8"/>
    </head>
    <body>
        <xsl:apply-templates select="vivienda"/>
        <p>  
            Numero de viviendas: <xsl:value-of select="count(vivienda)"/>
        </p>
        <p>Numero de vecinos: <xsl:value-of select="count(//nombre)"/>
        </p>
    </body>
</html>
</xsl:template>
<xsl:template match="vivienda">
   <xsl:value-of select="concat('Piso:',piso,' Puerta:',puerta)"/> 
   <ol>
        <xsl:apply-templates select="vecinos/nombre"/>
   </ol>
   
</xsl:template>
<xsl:template match="vecinos/nombre">
        <li>
            <xsl:apply-templates select="current() /text()"/>
        </li>
</xsl:template>
</xsl:stylesheet>