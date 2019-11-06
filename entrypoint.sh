#!/bin/bash

set -e

if [[ -z "$GITHUB_WORKSPACE" ]]; then
  echo "Set the GITHUB_WORKSPACE env variable."
  exit 1
fi

echo "--> outputting cert and key to files"
mkdir /certs
# The quotations around the cert/key vars are very import to handle line breaks
echo "${WINDOWS_CERT}" > /certs/bundle.crt
echo "${WINDOWS_KEY}" > /certs/codesign.key

echo "--> signing binary"
/osslsigncode/osslsigncode-1.7.1/osslsigncode sign -certs /certs/bundle.crt -key /certs/codesign.key -h sha256 -n ${NAME} -i ${DOMAIN} -t "http://timestamp.verisign.com/scripts/timstamp.dll" -in ${BINARY} -out /signedbinary

echo "--> overwriting existing binary with signed binary"
cp /signedbinary ${BINARY}