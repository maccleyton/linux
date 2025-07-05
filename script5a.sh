#!/bin/bash

# Atribuir os parâmetros como as variáveis A e B
A=$1
B=$2

# Teste de validade dos parâmetros. Se algum deles for nulo
# o SCRIPT aborta a execução e retorna valor 1 para indicar
# que ocorreu uma falha.
# Testa se o primeiro valor é válido.
if [[ -n "$A" ]]
then
echo "O primeiro valor é válido: $A"
else
echo "O primeiro valor é nulo"
exit 1
fi

# Testa se o segundo valor é válido.
if [[ -n "$B" ]]
then
echo "O segundo valor é válido: $B"
else
echo "O segundo valor é nulo"
exit 1
fi

# Inicia as comparações entre $A e $B
if [[ "$A" -eq "$B" ]]
then
echo "A e B são iguais"
fi

if [[ "$A" -ne "$B" ]]
then
echo "A e B são diferentes"
f1

if [[ "$A" -gt "$B" ]]
then
echo "A é maior que B"
fi

if [[ "$A" -lt "$B" ]]
then
echo "A é menor que B"
fi

exit 0