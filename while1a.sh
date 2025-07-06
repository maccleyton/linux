#!/bin/bash
# Apaga todo o conteúdo do terminal para facilitar
# a visualização
clear

# Pede a digitação de um número
echo -n "Digite um número: "
read num

# Define a variável auxiliar $i
i=1

# Exibe a hora de início
echo "Hora de início: $(date +%H:%M:%S)"

# O while vai executar enquanto a condição for atendida
# A condição é $i MENOR OU IGUAL A $num
while [[ $i -le $num ]]
do

# Exibe o contador $i
echo "Contando... $i"

# Incrementa a variável $i em uma unidade
(( i++ ))

# Testa se o segundo do relógio é igual a zero.
# Se for, interrompe o LOOP por meio do comando break
if [[ $(date +%S) -eq "00" ]]
then
echo "LOOP interrompido: $(date +%H:%M:%S)"
break
fi

# Aguarda um segundo
sleep 1
done

# A execução chegará a esse ponto depois que o LOOP
# estiver encerrado.
exit 0