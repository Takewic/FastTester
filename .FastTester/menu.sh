#!/bin/bash
# Funções para chamar os outros scripts
memoria(){ . /usr/share/takewic/testememoria.sh ; }
cpu(){ . /usr/share/takewic/cpu.sh ; }
hd(){ . /usr/share/takewic/hdteste.sh ; }
diagnostico(){ . /usr/share/takewic/diagnostico.sh ; }
internet(){ . /usr/share/takewic/internet.sh ; }
sair(){ exit 0 & ; clear ; echo "Obrigado por utilizar o programa Takewic fast tester." ; }
# Mostra o menu na tela, com as ações disponíveis
resposta=$(
	dialog --stdout \
	--backtitle 'Takewic fast tester' \
	--title 'Faça testes nos hardwares do seu computador.' \
	--menu 'Bem-Vindo ao programa Takewic, escolha uma das opções:' \
	0 0 0 \
	1 'Teste de Memória Ram' \
	2 'Teste de Hard Disk(HD)' \
	3 'Teste de CPU' \
	4 'Teste de Velocidade da Internet' \
	5 'Diagnóstico dos Hardwares' \
	6 'Sair'
)

[ $? -ne 0 ] && break

# De acordo com a opção escolhida, dispara programas
case "$resposta" in
	1) memoria ;;
	2) hd ;;
	3) cpu ;;
	4) internet ;;
	5) diagnostico ;;
	6) sair ;;

esac




