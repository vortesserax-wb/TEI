<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		>

  <xsl:param name="input" select="tokenize( base-uri(/), '/')[last()]"/>
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
  <xsl:mode on-no-match="shallow-copy"/>

  <xsl:template match="xsl:import/@href">
    <xsl:attribute name="href" select="
                   replace( .,
		 	    'http://www.tei-c.org/release/xml/tei/stylesheet/',
			    '/usr/share/xml/tei/stylesheet/'
			  ) "/>
  </xsl:template>

  <xsl:template match="/xsl:stylesheet | /*/xsl:strip-space | /*/xsl:template | /*/xsl:function" expand-text="yes">
    <xsl:text>&#x0A;</xsl:text>
    <xsl:comment> ***************************************************************** </xsl:comment>
    <xsl:comment> WARNING: This is a derived file. You probably do not want to edit </xsl:comment>
    <xsl:comment>          this file, but rather ./{$input} instead.    </xsl:comment>
    <xsl:comment> ***************************************************************** </xsl:comment>
    <xsl:text>&#x0A;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@elements | @test">
    <xsl:attribute name="{name(.)}">
      <xsl:sequence select="normalize-space(.)"/>
    </xsl:attribute>
  </xsl:template>    

</xsl:stylesheet>
