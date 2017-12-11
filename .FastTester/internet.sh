#!/bin/bash
internet(){ clear ; speedtest-cli ; voltar ; }
voltar(){ read -p "Pressione [enter] para voltar ao menu" ; /usr/share/takewic/internet.sh ; }

resposta=$(
dialog --stdout \
--title 'Teste de velocidade da internet' \
--menu 'Escolha uma das opções:' \
0 0 10 \
1 "Teste de velocidade da internet" \
2 "Voltar ao menu" \
4 'Sair' \
)

[ $? -ne 0 ] && break

case $resposta in 
	1) internet ;;
	2) /usr/share/takewic/menu.sh ;;
	3) killall takewic ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

