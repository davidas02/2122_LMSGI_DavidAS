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
    </body>
</html>
</xsl:template>
<xsl:template match="vivienda">
   <xsl:value-of select="concat('Piso:',piso,' Puerta:',puerta)"/> 
   <ol>
        <xsl:apply-templates select="vecinos"/>
   </ol>
   
</xsl:template>
<xsl:template match="vecinos">
    <li><xsl:apply-templates select="nombre"/></li>
</xsl:template>
<xsl:template match="nombre">
    <xsl:value-of select="nombre"/>
</xsl:template>
</xsl:stylesheet>