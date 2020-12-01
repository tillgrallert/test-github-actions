#!/bin/bash

for f in `ls tei/*TEIP5.xml`
do
  echo "Converting $f"
  # saxon -s:"$f" -xsl:xslt/tei_generate-xml-id.xsl -o:"$f"
  saxon -s:"$f" -xsl:xslt/test.xsl
done