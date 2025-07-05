#!/bin/bash

A=$1
B=$2

if [[ "$A" -eq "$B" ]]
then
echo "A e B são iguais"
fi

if [[ "$A" -ne "$B" ]]
then
echo "A e B são diferentes"
fi

if [[ "$A" -gt "$B" ]]
then
echo "A é maior que B"
fi

if [[ "$A" -lt "$B" ]]
then
echo "A é menor que B"
fi