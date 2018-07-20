#!/bin/bash

pushd $(dirname "$0")

for f in *.svg
do
	inkscape -f $f -e ../${f%.*}.png
done

popd
