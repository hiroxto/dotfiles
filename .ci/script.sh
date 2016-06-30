#!/bin/sh

for file in `find . -type "f" -name "*.sh"`; do
  echo $file
  bash -n $file
done