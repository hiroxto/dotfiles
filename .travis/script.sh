#!/bin/sh

for file in `find . -type "f" -name "*.sh"`; do
  echo $file
  bash -n $file
done

for file in `find . -type "f" -name "*.rb"`; do
  echo $file
  ruby -wc $file
done