<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xmlns:lang="http://www.w3.org/1999/xhtml">
  <xsl:output method="html"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>HTML Output</title>
        <link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
      </head>
      <body>
        <p>
          <p>&#x00A0;</p>
          <xsl:apply-templates/>        
       </p>
      </body>
    </html>
  </xsl:template>
  
  <!-- front -->
  
  
  <xsl:template match="/article/front">
    <h1 class="article-title"><xsl:value-of select="article-meta/title-group/article-title"/></h1>
    <xsl:for-each select="article-meta/contrib-group/contrib">
     <span class="author-name">
       <xsl:value-of select="name/given-names"/><xsl:text>&#x00A0;</xsl:text>
       <xsl:value-of select="name/surname"/><xsl:text>&#x00A0;&#x00A0;</xsl:text>
     </span>
    </xsl:for-each>
       <div class="metadata">
        <xsl:value-of select="journal-meta/journal-title-group/journal-title"/><xsl:text>&#x00A0;Jg.&#x00A0;</xsl:text>
        <xsl:value-of select="article-meta/volume"/><xsl:text>&#x00A0;Nr.&#x00A0;</xsl:text>
        <xsl:value-of select="article-meta/issue"/><xsl:text>.&#x00A0;</xsl:text>
        <xsl:value-of select="journal-meta/issn"/><xsl:text>.&#x00A0;</xsl:text>
        <xsl:value-of select="journal-meta/publisher/publisher-loc"/><xsl:text>:&#x00A0;</xsl:text>
        <xsl:value-of select="journal-meta/publisher/publisher-name"/><xsl:text>&#x00A0;</xsl:text>
        <xsl:value-of select="article-meta/pub-date/year"/><xsl:text>.</xsl:text>
         <br></br>
         <xsl:text>DOI:&#x00A0;</xsl:text>
         <a>
           <xsl:attribute name="href">
             <xsl:text>https://doi.org/</xsl:text>
             <xsl:value-of select="article-meta/article-id"></xsl:value-of>
           </xsl:attribute>
           <xsl:text>https://doi.org/</xsl:text>
           <xsl:value-of select="article-meta/article-id"></xsl:value-of></a>
         <br></br>
    
         <xsl:for-each select="//ext-link">
           <xsl:text>Licence:&#x00A0;</xsl:text>
          <a>
           <xsl:attribute name="href">
             <xsl:value-of select="@xlink:href"/>
           </xsl:attribute>
            <xsl:value-of select="."/>
          </a>
         </xsl:for-each></div>
  </xsl:template>
  
  <!-- end front -->
  <!-- body -->
  
  <xsl:template match="/article/body/sec/title">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  
  <xsl:template match="/article/body/sec/sec/title">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>
  
  <xsl:template match="/article/body/sec/sec/sec/title">
    <h3>
      <xsl:apply-templates/>
    </h3>
  </xsl:template>
  
  <xsl:template match="//xref">
    <xsl:if test="@ref-type='bibr'">
    <a class="xref-bibr">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="@rid"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="."/> 
    </a>
    </xsl:if>
    <xsl:if test="@ref-type='fig'">
      <a class="xref-bibr">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@rid"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="."/> 
      </a>
    </xsl:if>
    <xsl:if test="@ref-type='table'">
      <a class="xref-bibr">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@rid"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="."/> 
      </a>
    </xsl:if>
    <xsl:if test="@ref-type='fn'">
      <sup><a class="xref-bibr">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@rid"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="."/> 
      </a></sup>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="//named-content">
    <xsl:if test="@content-type='rtl'">
      <div>
        <xsl:attribute name="align">
          <xsl:text>right</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="dir">
          <xsl:text>rtl</xsl:text>
        </xsl:attribute>
        <xsl:value-of select="."/> 
      </div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="//table-wrap">
    <br></br>
    <div align="center">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"></xsl:value-of>
      </xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="//fig">
    <p class="pic">
    <img>
      <xsl:attribute name="src">
        <xsl:value-of select="graphic/@xlink:href"></xsl:value-of>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"></xsl:value-of>
      </xsl:attribute>
    </img>
    </p>
    <p class="pic_label"><xsl:value-of select="label"></xsl:value-of></p>
    <p class="pic_caption"><xsl:value-of select="caption"></xsl:value-of></p>
  </xsl:template>
  
  <xsl:template match="//ext-link">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="@xlink:href"></xsl:value-of>
    </xsl:attribute>
    <xsl:value-of select="."></xsl:value-of>
  </a>
  </xsl:template>
  
  <!-- end body -->
  <!-- back -->
  
  <xsl:template match="/article/back/fn-group/fn/p">
    
    <p>
      <div class="fn">
        <xsl:attribute name="id">
          <xsl:value-of select="parent::fn/@id"></xsl:value-of>
        </xsl:attribute>
        <xsl:number level="single" count="fn" format="1. " />
        <xsl:apply-templates/>
      </div>
      </p>
    
  </xsl:template>
  
  <xsl:template match="/article/back/ref-list/ref">
    <div class="fn">
    <p>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"></xsl:value-of>
      </xsl:attribute>
      <xsl:number level="single" count="ref" format="1. " />
      <xsl:apply-templates/>
    </p>
    </div>
   </xsl:template>
  
  <!-- end back -->
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="/article/back/fn-group/fn/@id"/>
  
</xsl:stylesheet>