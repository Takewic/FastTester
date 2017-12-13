#!/bin/bash
sair(){
exit 0 & 
clear 
}
esc(){
	escolha=$(for x in $(fdisk -l 2> /dev/null | grep 'Disk /dev' | cut -d" " -f2 | cut -b1-8) ; do
 echo $x' "-"' ; done)
	var=$(dialog --stdout --menu "Escolha uma opção:" 0 0 0 $escolha)

}
veloo(){ esc ; clear ; echo ; echo "Teste de velocidade de leitura do HD" 
	echo 
	hdparm -tT $var 
	read -p "Pressione [enter] para voltar ao menu" 
	voltar1 
}
escrita(){  
	clear
	echo
	echo "Teste de velocidade de escrita do HD"
	echo
	dd bs=16k count=102400 oflag=direct if=/dev/zero of=arquivo_teste 
	read -p "Pressione [enter] para voltar ao menu"
	rm arquivo_teste
	voltar1
}
voltar(){ 
	/usr/share/takewic/dialog.sh 
}
voltar1(){ 
	/usr/share/takewic/hdteste.sh 
}

	rep=$(dialog --stdout 			\
	--title 'Teste de Hard Disk (HD)' 	\
	--menu 'Escolha uma das opções:' 	\
	0 0 0 					\
	1 "Teste de leitura" 		\
	2 "Teste de escrita" 			\
	3 "Voltar ao menu"			\
	4 'Sair'
)
	[ $? -ne 0 ] && break
	case $rep in
		1) veloo ;;
		2) escrita ;;
		3) /usr/share/takewic/menu.sh  ;;
		4) sair ;;
esac

clear
echo "Obrigado por utilizar o programa Takewic fast tester."

