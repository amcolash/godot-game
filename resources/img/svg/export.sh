#!/bin/sh

for f in *.svg
do
	inkscape -f $f -e ../${f%.*}.png
done
