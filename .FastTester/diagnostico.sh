#!/bin/bash
voltar1(){ read -p "Pressione [enter] para ir ao menu de diagnostico" ; . /usr/share/takewic/diagnostico.sh  
}
usb(){ clear ; echo "Lista dos dispositivos USB" ; lsusb ;  voltar1 ; }
pci(){ clear ; echo "Lista dos dispositivos PCI" ; lspci ; voltar1 ; }
cpu(){ clear ; echo "Informações sobre o processador" ; head -19 /proc/cpuinfo ; voltar1 ; }
ram(){ clear ; echo "Informações sobre memória RAM" ; free -m ; echo ; voltar1 ;}
hd(){ clear ; echo "Informações sobre o Hard Disk (HD)" ; df -h ; voltar1 ;}
placa(){ clear ; echo "Informações sobre a placa mãe" ; lshw -class system ; voltar1 ; }
sair(){ exit 0 ; clear ; }

# Mostra o menu na tela, com as ações disponíveis
resposta=$(
dialog --stdout \
--title 'Diagnóstico dos Hardwares' \
--menu 'Escolha uma das opções:' \
0 0 10 \
1 'Dispositivos USB' \
2 'Dispositivos PCI' \
3 'Informações da CPU' \
4 'Informações sobre a Memoria Ram' \
5 'Informações sobre o Hard Disk(HD)' \
6 'Informações sobre a placa-mãe' \
7 'Voltar ao menu' \
8 'Sair' \
)

# Ela apertou CANCELAR ou ESC, então vamos sair...
[ $? -ne 0 ] && break

# De acordo com a opção escolhida, dispara programas

case $resposta in
	1) usb    ;;
	2) pci    ;;
	3) cpu    ;;
	4) ram    ;;
	5) hd     ;;
	6) placa  ;;
	7) . /usr/share/takewic/menu.sh ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

