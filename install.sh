#!/bin/bash
programas="speedtest-cli stress memtester lshw dialog htop hdparm sysbench"
falhou(){
        case $1 in
        instalacao)
                echo "O programa falhou na instalacao do aplicativo $2a" | tee instalacao.log
                exit 0 ;;
        copia)
                echo "O programa falhou durante cópia de backup" | tee instalacao.log
                exit 0 ;;
        *)
                echo "O programa falhou. Causa desconhecida" | tee instalacao.log
                exit 0 ;;
        esac
}
clear

echo "Aguarde um momento..."
echo
echo "1) Isso fara download dos comandos necessarios para o funcionamento deste programa."
echo "2) É necessario você estar como ROOT para prosseguir"
echo "3) Você vai precisar ter acesso a internet"
echo "__________________________________________________________________________________"
read -p "Pressione [enter] para continuar."
[[ $UID -ne 0 ]] && { echo "Programa terminará por falta de privilégios" ; exit 0 ; }

echo "Update"
apt-get update
for x in $(echo $programas) ; do
	echo "Instalando $x"
	apt-get install $x -y || falhou instalacao $x
done

mkdir -p /usr/share/takewic
cp ./.FastTester/* /usr/share/takewic
ln -s /usr/share/takewic/menu.sh /usr/bin/takewic
echo "____________________________"
echo
echo "A instalação foi concluída"
