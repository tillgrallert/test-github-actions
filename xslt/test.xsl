<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs xd html" version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.pnp-software.com/XSLTdoc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output name="text" method="text" encoding="UTF-8"/>
    
    <!-- run on root and write a txt file -->
    <xsl:template match="/">
        <!-- the path is relative to the XSLT is run locally and the repository if run through Github actions -->
        <xsl:result-document href="test_{current-dateTime()}.txt" method="text">
            <xsl:text>this is a test document generated by running an GitHub action on </xsl:text><xsl:value-of select="base-uri()"/><xsl:text>.</xsl:text>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>