<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="kommentare"
        select="document('../meta/Kommentar.xml')"/>
    <xsl:param name="sigle" select="document('../indices/siglen.xml')"/>
    <xsl:key name="kommentar-lookup" match="tei:note" use="@xml:id"/>
    

    
 <xsl:template match="tei:anchor[(@type='commentary' or @type='textConst') and (child::* or normalize-space(.)!='')]">
     <xsl:variable name="id" select="@xml:id"/>
     <xsl:element name="anchor" namespace="http://www.tei-c.org/ns/1.0">
         <xsl:copy-of select="@*"/>
     </xsl:element>
     <xsl:apply-templates/>
     <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
         <xsl:copy-of select="@type" copy-namespaces="0"/>
         <xsl:attribute name="xml:id">
             <xsl:value-of select="concat($id,'h')"/>
         </xsl:attribute>
         <xsl:copy-of select="key('kommentar-lookup', $id, $kommentare)/*" copy-namespaces="0"/>
     </xsl:element>
     
     
 </xsl:template>
    

    
    <xsl:template match="@full"/>
    <xsl:template match="@instant"/>
    <xsl:template match="@part"/>
    <xsl:template match="@default"/>
    
</xsl:stylesheet>