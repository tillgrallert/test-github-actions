#!/bin/bash

for f in `ls tei/*TEIP5.xml`
do
  echo "Converting $f"
  # this very basic test runs as expected
  saxon -s:"$f" -xsl:xslt/test.xsl
  # try and run XSLT to generate @xml:id on all new nodes
  saxon -s:"$f" -xsl:xslt/tei_generate-xml-id.xsl -o:test_output.xml p_id-editor=#github
done