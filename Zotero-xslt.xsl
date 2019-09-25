<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns:z="http://www.zotero.org/namespaces/export#"
 xmlns:dcterms="http://purl.org/dc/terms/"
 xmlns:bib="http://purl.org/net/biblio#"
 xmlns:foaf="http://xmlns.com/foaf/0.1/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:link="http://purl.org/rss/1.0/modules/link/"
 xmlns:vcard="http://nwalsh.com/rdf/vCard#"
 xmlns:prism="http://prismstandard.org/namespaces/1.2/basic/">

<xsl:template match="/">
  <html>
  <body>
  <h2>Biblical references by topic - from CH reading</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Topic</th>
      <th>Pericope</th>
      <th>Citation</th>
      <th>Page no.</th>
    </tr>
    <xsl:for-each select="//dc:subject[contains(.,'Bible')]">
	<xsl:variable name="bible" select="tokenize(.,'\|')"/>
	<xsl:variable name="book" select="../@rdf:about"/>
	<xsl:variable name="isbn" select="substring($book, 10, string-length($book))"/>
    <tr>
      <td><xsl:copy-of select="$bible[3]"/></td>
      <td><a href="{concat('https://www.biblegateway.com/passage/?search=', $bible[2])}"><xsl:copy-of select="$bible[2]"/></a></td>
	  <td><a href="{concat('https://worldcat.org/isbn/',$isbn)}"><xsl:copy-of select="$isbn"/></a></td>
      <td><xsl:copy-of select="$bible[4]"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 
