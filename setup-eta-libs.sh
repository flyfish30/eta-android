#!/bin/sh

for library in ghc-prim base rts integer; do
  DIR="$(eta-pkg field $library library-dirs --simple-output)"
  JAR="$(eta-pkg field $library hs-libraries --simple-output).jar"
  cp "$DIR/$JAR" app/libs
done
