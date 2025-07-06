#!/bin/bash

contador=1

for arquivo in *
do
echo "Arquivo #$contador: $arquivo"
(( contador++ ))
done