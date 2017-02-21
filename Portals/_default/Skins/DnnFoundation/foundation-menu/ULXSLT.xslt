<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
  
  <xsl:template match="root">
    <ul>
      <xsl:apply-templates select="node">
        <xsl:with-param name="level" select="0"/>
      </xsl:apply-templates>
    </ul>
  </xsl:template>
  
  <xsl:template match="node">
    <xsl:param name="level" />    
    
    <xsl:choose>
      <xsl:when test="$level=0">   
        
        <li>          
          <xsl:attribute name="class">
            <xsl:if test="@breadcrumb = 1">active</xsl:if>
            <xsl:if test="node"> has-dropdown</xsl:if>
          </xsl:attribute>      
          
          <xsl:choose>            
            <xsl:when test="@enabled = 1">
              <a href="{@url}"><xsl:value-of select="@text" /></a>
            </xsl:when>
            
            <xsl:otherwise>
              <xsl:value-of select="@text" />
            </xsl:otherwise>             
          </xsl:choose>              
          
          <xsl:if test="node">
            <ul class="dropdown">
              <xsl:apply-templates select="node">
                <xsl:with-param name="level" select="$level + 1" />
              </xsl:apply-templates>
            </ul>
          </xsl:if>          
          
        </li>    

      </xsl:when>

      <xsl:otherwise>
        <li>
          <xsl:attribute name="class">
            <xsl:if test="@breadcrumb = 1">active</xsl:if>
            <xsl:if test="node">
              <xsl:text>&#32;dropdown</xsl:text>
            </xsl:if>
          </xsl:attribute>

          <xsl:choose>
            <xsl:when test="@enabled = 1">
              <a href="{@url}">
                <xsl:value-of select="@text" />
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@text" />
            </xsl:otherwise>
          </xsl:choose>

        </li>
        <xsl:if test="node">

        </xsl:if>

      </xsl:otherwise>

    </xsl:choose>
    
  </xsl:template>
</xsl:stylesheet>