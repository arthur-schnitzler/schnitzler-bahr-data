<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="tei:text[not(child::tei:back)]">
        <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
        <xsl:copy-of select="tei:body"/>
        <xsl:copy-of select="parent::tei:TEI/tei:back"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:back[parent::tei:TEI]"/>
    
</xsl:stylesheet>
