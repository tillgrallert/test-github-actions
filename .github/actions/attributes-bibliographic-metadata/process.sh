#!/bin/bash
for f in `ls tei/*.TEIP5.xml`
do
	echo "Add @xml:id to all new elements"
	saxon -s:"$f" -xsl:https://openarabicpe.github.io/tools/xslt/tei_generate-xml-id.xsl -o:"$f" p_id-editor='github'
	echo "Add @xml:lang to all new elements"
	saxon -s:"$f" -xsl:https://openarabicpe.github.io/tools/xslt/tei_generate-xml-lang.xsl -o:"$f" p_id-editor='github'
  	echo "Update / generate bibliographic metadata"
  	echo "MODS"
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-mods_issues.xsl
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-mods_articles.xsl
  	echo "BibTeX"
  	echo "YAML"
done