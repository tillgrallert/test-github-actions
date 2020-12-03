#!/bin/bash

for f in `ls tei/*TEIP5.xml`
do
  echo "First test: generate a TXT file"
  # this very basic test runs as expected
  saxon -s:"$f" -xsl:xslt/test.xsl
  # try and run XSLT to generate @xml:id on all new nodes
  # this works when the output is specified with a fixed file name
  # it currently fails when I attempt to overwrite the input file with `-o:"$f"`
  echo "Second test: transform the input XML"
  saxon -s:"$f" -xsl:xslt/tei_generate-xml-id.xsl -o:test_output.xml p_id-editor=github
done