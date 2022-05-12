<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="solucion" select="'si'"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="utf-8"/>
                <title>05 XSLT David Aparicio</title>
                <link rel="stylesheet" href="estilos.css" type="text/css" />
            </head>
            <body>
                <h1>
                    <xsl:value-of select="examen/datos/nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="examen/datos/nombreModulo"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat('Fecha: ',examen/datos/fecha/dia,' de ',document('meses.xml')/meses/mes[@id=current()/examen/datos/fecha/mes] ,' de ',examen/datos/fecha/anyo)"/>
                </h3>
                <form action="/action_page.php" method="post" name="EXAMEN" id="1" autocomplete="off">
                    <xsl:for-each select="examen/preguntas/pregunta">
                        <fieldset>
                            <div class="respuestas">
                                <div class="enunciado">
                                    <xsl:value-of select="concat(@id,'. ',enunciado)"/>
                                </div>

                                <xsl:for-each select="respuestas/respuesta">
                                    <div class="respuesta">
                                        <label>
                                            <input type="radio" name="pregunta">
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="concat('pregunta',../../@id,position())"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="name">
                                                    <xsl:value-of select="concat('pregunta',../../@id)"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="position()"/>
                                                </xsl:attribute>
                                                <xsl:if test="$solucion!='no'">
                                                    <xsl:attribute name="disabled">
                                                        <xsl:value-of select="disabled"/>
                                                    </xsl:attribute>
                                                    <xsl:if test="@correcta='correcta'">
                                                        <xsl:attribute name="checked">
                                                            <xsl:value-of select="checked"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                </xsl:if>
                                            </input>
                                            <xsl:value-of select="current()"/>
                                        </label>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </fieldset>
                    </xsl:for-each>
                    <xsl:if test="$solucion!='si'">
                        <fieldset>
                            <input type="submit" value="Enviar Formulario"/>
                            <input type="reset" value="Borrar Formulario"/>
                        </fieldset>
                    </xsl:if>
                </form>
            </body>
        </html>

    </xsl:template>


</xsl:stylesheet>