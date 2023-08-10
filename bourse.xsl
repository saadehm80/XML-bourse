<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>La bourse</title>
            </head>
            <body>  
         <xsl:for-each select="/bourse/societe[@type='Banque']">
            <ul>
                <li>Code de la societe: <xsl:value-of select="codeSociete"/></li>
                <li>Nom de la societe: <xsl:value-of select="nomSociete"/></li>
            </ul>        
            <table border="1" width="90%">
                <tr>
                    <th>Num. cotation</th> <th>Date cotation</th><th>Valeur Action</th>
                </tr>
                <xsl:for-each select="cotations/cotation">
                    <tr>
                        <td><xsl:value-of select="@num"></xsl:value-of></td>
                        <td><xsl:value-of select="@dateCotation"></xsl:value-of></td>
                        <td><xsl:value-of select="@valeurAction"></xsl:value-of></td>
                    </tr>
                </xsl:for-each>
                <tr>
                    <th colspan="2">Moyenne de cotations: </th>
                    <th>
                        <xsl:value-of select="avg(cotations/cotation/@valeurAction)"></xsl:value-of>
                    </th>
                </tr>
              
            </table>
             </xsl:for-each>
                <ul><li>Nomre total des societes:  <xsl:value-of select="count(bourse/societe)"></xsl:value-of></li></ul>
                <ul><li>Nomre total des societes de type banque:  <xsl:value-of select="count(bourse/societe[@type='Banque'])"></xsl:value-of></li></ul>
                <ul><li>Nomre total des societes de type assurancae:  <xsl:value-of select="count(bourse/societe[@type='Assurance'])"></xsl:value-of></li></ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>