<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <listatickets>
                <xsl:apply-templates select="listatickets/ticket"/>
        </listatickets>
    </xsl:template>
    <xsl:template match="ticket">
        <xsl:element name="ticket">
            <xsl:attribute name="numero">
                <xsl:value-of select="numero"/>
            </xsl:attribute>
            <xsl:attribute name="fecha">
                <xsl:value-of select="fecha"/>
            </xsl:attribute>
            <xsl:attribute name="hora">
                <xsl:value-of select="hora"/>
            </xsl:attribute>
            <xsl:apply-templates select="producto"/>
            <total>
                <xsl:value-of select="total"/>
            </total>
            
        </xsl:element>
    </xsl:template>
    <xsl:template match="producto">
        <producto>
            <nombre>
                <xsl:value-of select="nombre"/>
            </nombre>
            <precio>
                <xsl:value-of select="precio"/>
            </precio>
        </producto>
    </xsl:template>
</xsl:stylesheet>