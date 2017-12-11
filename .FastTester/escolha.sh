#!/bin/bash
um(){ clear ; memtester 1024 1  ;  parar ; }
dois(){ clear ; memtester 2048 1 ; parar ; }
quatro(){ clear ; memtester 4096 1 ; parar ; }
oito(){ clear ; memtester 8192 1 ; parar ; }
dez(){ clear ; memtester 15000 ; parar ; }
trinta(){ clear ; memtester 30000 ; parar ;}
parar(){ read -p "Pressione [enter] para voltar para o menu 'teste de Memória Ram'" ; . /usr/share/takewic/testememoria.sh ; }
voltar(){ . /usr/share/takewic/testememoria.sh ; }


# Mostra o menu na tela, com as ações disponíveis
resposta=$(
dialog --stdout \
--title 'Teste de Memória Ram' \
--menu 'Escolha a quantidade de memória que deseja testar:' \
0 0 10 \
1 '1024MB 1(GB)' \
2 '2048MB 2(GB)' \
3 '4096MB 4(GB)' \
4 '8192MB 8(GB)' \
5 '15200MB 16(GB)' \
6 '30000MB 32(GB)' \
7 'Voltar' \
)

# Ela apertou CANCELAR ou ESC, então vamos sair...
[ $? -ne 0 ] && break

# De acordo com a opção escolhida, dispara programas
case "$resposta" in
1) um ;;
2) dois ;;
3) quatro ;;
4) oito ;;
5) dez ;;
6) trinta ;;
7) voltar ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

