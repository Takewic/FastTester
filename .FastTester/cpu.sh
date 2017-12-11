#!/bin/bash
estresse(){ 
	clear
	echo "Teste de stress na CPU"
	echo "Pressione a tecla F10 ou a combinação CTRL+C  para fechar a aplicação."
	read -p "Pressione [enter] para continuar..." 
	read -p "Escolha a quantidade de núcleos para o stress: " TEST 
	stress -c $TEST & 
	htop 
	killall stress 	
	echo 
	voltar 
}
pross(){ clear ; echo ; echo "Teste de velocidade de processamento" ; echo ; echo "Para parar o teste de velocidade de processamento pressione CTRL+C" ; echo ; sysbench --test=cpu --cpu-max-prime=9999 run ; echo ; voltar ; }
voltar(){ read -p "Pressione [enter] para voltar ao menu 'Teste de CPU'" ; . /usr/share/takewic/cpu.sh ; }
sair(){ exit 0 ; clear ; }
resposta=$(
dialog --stdout \
--title 'Diagnostico de Hardware' \
--menu 'Escolha uma das opções' \
0 0 10 \
1 "Teste de stress da CPU" \
2 "Teste de velocidade de processamento" \
3 "Voltar ao menu principal" \
4 "Sair" \
)

[ $? -ne 0 ] && break

case $resposta in
	1) estresse ;;
	2) pross  ;;
	3) . /usr/share/takewic/menu.sh  ;;
	4) sair ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

