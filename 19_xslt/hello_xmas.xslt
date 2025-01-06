<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    
    <xsl:template match="/HelloXmas">
      <xsl:variable name="groups" select="@groups" />
      
      <xsl:call-template name="create-tree">
        <xsl:with-param name="groups" select="$groups" />
      </xsl:call-template>
    </xsl:template>

    <xsl:template name="create-tree">
      <xsl:param name="groups" />
      
      <xsl:call-template name="create-groups">
        <xsl:with-param name="groups" select="$groups" />
        <xsl:with-param name="n" select="0" />
      </xsl:call-template>

      <xsl:call-template name="divider">
        <xsl:with-param name="n" select="$groups * 2 + 2" />
      </xsl:call-template>
      <xsl:text>&#xa;</xsl:text>

      <xsl:call-template name="create-trunk">
        <xsl:with-param name="groups" select="$groups" />
      </xsl:call-template>

    </xsl:template>

    <xsl:template name="create-groups">
      <xsl:param name="groups" />
      <xsl:param name="n" />

      <xsl:if test="$n &lt; $groups">
        <xsl:call-template name="create-group">
          <xsl:with-param name="groups" select="$groups" />
          <xsl:with-param name="n" select="$n" />
        </xsl:call-template>

        <xsl:call-template name="create-groups">
          <xsl:with-param name="groups" select="$groups" />
          <xsl:with-param name="n" select="$n + 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:template>

    <xsl:template name="create-group">
      <xsl:param name="groups" />
      <xsl:param name="n" />

      <!-- First line -->
      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="$groups - $n" />
      </xsl:call-template>
      <xsl:text>/</xsl:text>
      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="$n * 2" />
      </xsl:call-template>
      <xsl:text>\</xsl:text>
      <xsl:text>&#xa;</xsl:text>

      <!-- Second line -->
      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="$groups - $n - 1" />
      </xsl:call-template>
      <xsl:text>/</xsl:text>
      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="($n+1) * 2" />
      </xsl:call-template>
      <xsl:text>\</xsl:text>
      <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="spaces">
      <xsl:param name="n" />
      <xsl:if test="$n &gt; 0">
        <xsl:text> </xsl:text>
        <xsl:call-template name="spaces">
          <xsl:with-param name="n" select="$n - 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:template>

    <xsl:template name="divider">
      <xsl:param name="n" />
      <xsl:if test="$n &gt; 0">
        <xsl:text>-</xsl:text>
        <xsl:call-template name="divider">
          <xsl:with-param name="n" select="$n - 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:template>

    <xsl:template name="create-trunk">
      <xsl:param name="groups" />

      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="$groups" />
      </xsl:call-template>
      <xsl:text>||&#xa;</xsl:text>

      <xsl:call-template name="spaces">
        <xsl:with-param name="n" select="$groups" />
      </xsl:call-template>
      <xsl:text>||&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
