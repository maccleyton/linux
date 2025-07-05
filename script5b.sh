#!/bin/bash
# Pedir ao usuário a digitação dos valores
# O parâmetro '-n' no echo faz com que ele não insira uma quebra de linha apos o texto
echo -n "Digite o primeiro valor: "
read A
echo -n "Digite o segundo valor: "
read B

### O RESTANTE DO SCRIPT É IGUAL AO script5
# Teste de validade dos parâmetros. Se algum deles for nulo
# o SCRIPT aborta a execução e retorna valor 1 para indicar
# que ocorreu uma falha.
# Testa se o primeiro valor é nulo.
if [[ -n "$A" ]]
then
echo "O primeiro valor é valido: $A"
else
echo "O primeiro valor é nulo"
exit 1
fi

# Testa se o segundo valor é nulo.
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
fi

if [[ "$A" -gt "$B" ]]
then
echo "A é maior que B"
fi

if [[ "$A" -lt "$B" ]]
then
echo "A é menor que B"
fi

exit 0