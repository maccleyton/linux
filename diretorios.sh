#!/bin/bash
# A partir de uma lista de diretórios, este script avalia o # espaço em disco ocupado por cada um deles.
# Os diretórios # que ocuparem espaço acima de um determinado # limite terão seus tamanhos somados e o resultado é exibido # ao final.
# Os diretórios cuja ocupação for inferior ao limite não
# são considerados na soma final dos tamanhos.
# Abaixo, variáveis para configurar o comportamento
# do SCRIPT.
# Variável DETALHES, permite definir se o SCRIPT exibirá
# detalhes enquanto executa. Esse tipo de recurso auxilia
# durante o desenvolvimento e na depuração de erros.
# Quando DETALHES=1 as informações são exibidas.
DETALHES=0
# A relação de diretórios a serem avaliados será obtida a
# partir do arquivo ‘diretorios’ e atribuída como conteúdo
# partir do arquivo ‘diretorios’ e atribuída como conteúdo
DIRETORIOS=$(< lista_diretorios)
# O tamanho mínimo que os arquivos em um diretório devem
# ocupar para que esse tamanho seja considerado na soma
# final.
# Nesse SCRIPT, foi adotada a unidade KBYTES. O comando 'du'
# usará o parâmetro '-k' para que a saída seja em KBYTES.
LIMITE_MIN=5000
# ---------------------------------------------------------
# Desse ponto em diante, não há mais variáveis para
# configuração do SCRIPT por usuários.
# ---------------------------------------------------------
#
# Variáveis auxiliares para o funcionamento do SCRIPT.
# Variável na qual serão acumulados os tamanhos dos diretórios
# incluídos (Soma total).
TAMANHO_TOTAL=0
# Variável para contar quantos diretórios foram avaliados.
# Será incrementada em uma unidade a cada item na variável
# DIRETORIOS.
CONTADOR_TOTAL=0
# Variável para contar quantos diretórios ocupavam tamanho
# SUPERIOR ao limite e, portanto, entraram na soma total.
CONTADOR_INCLUIDOS=0
# Variável para contar quantos diretórios ocupavam tamanho
# INFERIOR ao limite e, portanto, não entraram na soma total.
CONTADOR_NAO_INCLUIDOS=0
for dir in $DIRETORIOS
do
# Incrementa o $CONTADOR_TOTAL a cada diretório avaliado
((CONTADOR_TOTAL++))
# Utilizando o comando 'du' obtém o tamanho do diretório
# (-k em KBytes).
# A saída é passada, por pipe (|), ao comando 'cut -f1',
# que extrai somente a primeira coluna da resposta,
# correspondente ao tamanho.
# O valor é então armazenado na variável $tamanho
tamanho=$(du -sk $dir | cut -f1)
# Avaliar se o tamanho é maior ou igual ao limite mínimo
# (variável $LIMITE_MIN)
if [[ $tamanho -ge $LIMITE_MIN ]]
then
# Se for maior ou igual:
# 1 - Incrementa em uma unidade o contador de
# diretórios incluídos na soma
# 2 - Soma o tamanho na variável $TAMANHO_TOTAL
((CONTADOR_INCLUIDOS++))
((TAMANHO_TOTAL+=$tamanho))
# Avalia se deve exibir detalhes (variável
# $DETALHES=1 ?)
if [[ $DETALHES -eq 1 ]]
then
# Exibe mensagem com detalhes
echo "+ Diretório incluído na soma: $dir ($tamanho KB) --- Resultado parcial $TAMANHO_TOTAL KB"
fi
else
# Se o tamanho for inferior ao limite, incrementa o
# contador de diretórios não incluídos na soma.
((CONTADOR_NAO_INCLUIDOS++))
# Avalia se deve exibir detalhes (variável
# $DETALHES=1 ?)
if [[ $DETALHES -eq 1 ]]
then
# Exibe mensagem com detalhes
echo "- Diretório não incluído na soma: $dir ($tamanho KB)"
fi
fi
done
# Encerrado o LOOP, exibe o resultado final
echo "RESULTADO"
echo "Total de diretórios avaliados: $CONTADOR_TOTAL"
echo "Total de diretórios incluídos na soma de tamanho: $CONTADOR_INCLUIDOS"
echo "Total de diretórios não incluídos na soma de tamanho: $CONTADOR_NAO_INCLUIDOS"
echo "---------------------------------------------------"
# O cálculo (somatório) do espaço ocupado foi feito em
# KBYTES. Para exibir de forma mais adequada, será convertido
# para MBYTES, dividindo-se o valor por 1024.
echo "Tamanho total ocupado pelos diretórios incluídos: $((TAMANHO_TOTAL/1024)) MB"
# Encerrar o SCRIPT
exit 0