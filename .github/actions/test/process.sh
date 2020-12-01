#!/bin/bash

REGEX="[[:digit:]]{4}\.xml"
for f in `ls *.xml`
do
  echo "Checking $f"
  if [[ $f =~ $REGEX ]]
  then
    echo "Converting $f"
    saxon -s:"$f" -xsl:xslt/tei_generate-xml-id.xsl -o:"$f"
  fi
done