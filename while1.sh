#!/bin/bash

# Apaga todo o conteúdo do terminal para facilitar
# a visualização
clear

# Pede a digitação de um número
echo -n "Digite um número: "
read num

# Define a variável auxiliar $i
i=1

# O while vai executar enquanto a condição for atendida
# A condição é $i MENOR OU IGUAL A $num
while [[ $i -le $num ]]
do
# Exibe o contador (variável $i)
echo "Contando... $i"

# Incrementa a variável $i em uma unidade
(( i++ ))

# Aguarda um segundo
sleep 1
done

# A execução chegará a esse ponto depois que o LOOP
# estiver encerrado.
exit 0