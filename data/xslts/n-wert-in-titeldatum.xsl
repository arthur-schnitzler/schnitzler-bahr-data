<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="tei:title[@type = 'iso-date' and not(@n)]">
        <xsl:element name="title" namespace="http://www.tei-c.org/ns/1.0"> 
        <xsl:copy-of select="@*"/>
        <xsl:variable name="n" select="ancestor::tei:TEI/descendant::tei:date/@n[1]"/>
            <xsl:attribute name="n">
                <xsl:value-of select="$n"/>
            </xsl:attribute>
        <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
