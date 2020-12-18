#!/bin/bash
for f in `ls tei/*.TEIP5.xml`
do
	echo "Add @xml:id to all new elements"
	saxon -s:"$f" -xsl:https://openarabicpe.github.io/tools/xslt/tei_generate-xml-id.xsl -o:"$f" p_id-editor='github'
	echo "Add @xml:lang to all new elements"
	saxon -s:"$f" -xsl:https://openarabicpe.github.io/tools/xslt/tei_generate-xml-lang.xsl -o:"$f" p_id-editor='github'
	echo "Update sitemap.xml for Google's programmable search"
	saxon -s:"$f" -xsl:https://openarabicpe.github.io/tools/xslt/generate_sitemap.xsl
  	echo "Update / generate bibliographic metadata"
  	echo "MODS"
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-mods_issues.xsl
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-mods_articles.xsl
  	echo "BibTeX"
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-bibtex_issues.xsl
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-bibtex_articles.xsl
  	echo "YAML"
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-yaml_issues.xsl
  	echo "Zotero RDF"
  	saxon -s:"$f" -xsl:https://openarabicpe.github.io/convert_tei-to-bibliographic-data/xslt/convert_tei-to-zotero-rdf_issues.xsl
done