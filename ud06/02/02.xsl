<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="listatickets">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>02 XSLT David Aparicio</title>

            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                </header>
                <xsl:apply-templates select="ticket"/>
                <div>
                    <p>Numero de tickets <xsl:value-of select="count(ticket)"/></p>
                    <p>total tickets <xsl:value-of select="sum(//total)"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ticket">
    <div>
        
        <h2>
           Tickets: <xsl:value-of select="numero"/>
        </h2>
        
        <table>
        <xsl:apply-templates select="producto"/>
        <tr>
            <td>Total</td>
            <td><xsl:value-of select="total"/></td>
        </tr>
        </table>
           Fecha del ticket: <xsl:value-of select="fecha"/>
    </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
        <xsl:value-of select="nombre"/>
            </td>
            <td>
        <xsl:value-of select="precio"/>
            </td>
            
        </tr>
    </xsl:template>
</xsl:stylesheet>