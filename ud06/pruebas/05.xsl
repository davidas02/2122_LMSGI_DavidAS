<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
    <xsl:text>
</xsl:text>
        <personas>
            <xsl:apply-templates select="edificio/vivienda/vecinos/nombre"/>
        </personas>
    </xsl:template>
    <xsl:template match="edificio/vivienda/vecinos/nombre">
    <xsl:element name="nombre">
        <xsl:attribute name="piso">
            <xsl:value-of select="../../piso"/>
        </xsl:attribute>
        <xsl:attribute name="puerta">
            <xsl:value-of select="../../puerta"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="current()"></xsl:value-of>
    </xsl:element>
    </xsl:template>
</xsl:stylesheet>