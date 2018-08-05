#!/bin/bash

pushd $(dirname "$0")

rm ../buttons/*.png

for f in *.svg **/*.svg
do
	if [ -f $f ]
	then
		mkdir -p $(dirname ../${f%.*})
		inkscape -f $f -e ../${f%.*}.png
	fi
done

for f in ../buttons/*.png
do
	convert $f -alpha set -background none -channel A -evaluate multiply 3 +channel ${f%.*}_down.png
done

popd
