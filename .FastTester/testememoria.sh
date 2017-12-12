#!/bin/bash
voltar(){ . /usr/share/takewic/menu.sh ; }
teste(){ /usr/share/takewic/escolha.sh ; }
sair(){
exit 0 &
clear
}


OPZAO=$(
dialog --stdout \
--title 'Teste de Memória Ram' \
--menu 'Escolha uma das opções:' \
0 0 0 \
1 "Teste de memória RAM" \
2 "Voltar ao menu" \
3 'Sair' \
)

[ $? -ne 0 ] && break

case $OPZAO in
	1) teste ;;
	2) voltar ;;
	3) sair ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

