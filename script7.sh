#!/bin/bash

echo -n "Digite o primeiro valor (A): "
read A
echo -n "Digite o segundo valor (B): "
read B
echo -n "Digite o terceiro valor (C): "
read C

MEDIA=$(echo "scale=2;($A+$B+$C)/3" | bc)

echo “A média dos três valores é: $MEDIA”
exit 0