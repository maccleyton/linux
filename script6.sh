#!/bin/bash
# Pede a digitação dos valores e os armazena nas
# variáveis A e B


echo -n "Digite o primeiro valor (A): "
read A
echo -n "Digite o segundo valor (B): "
read B


# Calcula A+B e atribui o resultado na variável C
(( C=A+B ))

# Exibe o resultado
echo "O resultado de A+B = $C"

# Exibe o mesmo resultado, porém indicando o cálculo
# no echo, sem a necessidade da variável C.
echo "O resultado de A+B = $(( A+B ))"

exit 0