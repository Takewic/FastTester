#!/bin/bash
voltar(){ . /usr/share/takewic/menu.sh ; }
teste(){ /usr/share/takewic/escolha.sh ; }


OPZAO=$(
dialog --stdout \
--title 'Teste de Memória Ram' \
--menu 'Escolha uma das opções:' \
0 0 0 \
1 "Teste de memória RAM" \
2 "Voltar ao menu" \
)

[ $? -ne 0 ] && break

case $OPZAO in
	1) teste   ;;
	2) voltar  ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

