#!/bin/bash

echo -n "Digite um número de 3 dígitos: "
read numero
if [[ $numero =~ ^[0-9]{3}$ ]]
then
echo "OK"
else
echo "O número não possui 3 dígitos."
fi