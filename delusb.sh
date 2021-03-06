#!/bin/bash

#
#Colores
#
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#
#Panel que muestra lo que hace el script
#
clear
echo -e "${redColour}########################################################################${endColour}"
echo -e "${redColour}###${endColour}           ${turquoiseColour}DO NOT EDIT THIS FILE TO CHANGE THE CONFIG!!!${endColour}          ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} ${greenColour}----------------------------------------------------------------${endColour} ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} Este script sirve para borrar los dispositivos añadidos en       ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} rules.d, lo que podremos hacer es borrar el dispositivos         ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} que queramos.                                                    ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} Hay que tener cuidado con cual borramos para que despues no      ${redColour}###${endColour}"
echo -e "${redColour}###${endColour} de fallos                                                        ${redColour}###${endColour}"
echo -e "${redColour}########################################################################${endColour}"
#sleep 3

#
#Dice Saliendo...
#
function goodbye() {
    # say goodbye
    echo -e "\n${purpleColour}[+]${endColour} Saliendo...\n"
}

#
#Cuando das control+C sale del programa
#
trap "goodbye" EXIT

#
#Variables
#
seleccion="Seleccionar linea"
hcopia="Hacer copia de seguridad"
rcopia="Restaurar copia de seguridad"

#
#Pregunta si quiere borrar determinada linea, TODO o Salir
#
clear
echo -e "${greenColour}[+]${endColour} ¿Quiere ${redColour}borrar${endColour} ${yellowColour}seleccionar linea${endColour}, ${redColour}TODO${endColour}, ${purpleColour}Copias${endColour} o ${turquoiseColour}Salir${endColour}? [${yellowColour}1${endColour}/${redColour}2${endColour}/${turquoiseColour}3${endColour}]"
select yn in "$seleccion" "TODOS" "Copias" "Salir"; do
     case $yn in

#
#Sale a la pregunta TODOS
#
TODOS )

#
#Pregunta si quiere borrar TODOS los dispositivos en el archivo rules.d
#
clear
echo -e "¿Seguro que quiere borrar ${redColour}TODOS${endColour} los dispositivos guardados?[1/2]"
select yn in "No" "Borrar"; do
    case $yn in
       No )
		clear
		echo -e "${greenColour}[+]${endColour} Saliendo sin borrar ningun archivo..."
		sleep 1
	exit 1;;

#
#Cierra la pregunta de BORRAR todos los dispositivos en el archivo rules.d
#
	   Borrar )
			  clear
              echo -e "\n${redColour}[-]${endColour} Borrando ${redColour}TODOS${endColour} los USB..."
		rm -r /etc/udev/rules.d/99-usb-serial.rules
			  echo -e "\n${redColour}[-]${endColour} USB's borrados perfectamente..."
		exit 1;;
        esac
done;;


#
#Empezamos Determinada linea
#
$seleccion )
clear
echo -e "${greenColour}[+]${endColour} Acabas de elegir seleccionar linea"
sleep 2
clear

#
#Cuenta las lineas del fichero /etc/udev/rules.d/99-usb-serial.rules
#
lineas=$(sudo /usr/bin/cat /etc/udev/rules.d/99-usb-serial.rules | wc -l)
echo -e "${greenColour}[+]${endColour} El archivo ${yellowColour}99-serial.rules${endColour} tiene ${redColour}$lineas${endColour} lineas"
echo -e "Si solo hay ${redColour}1${endColour} linea no la podra ${redColour}borrar${endColour}"
sleep 2


#
#Muestra el fichero /etc/udev/rules.d/99-usb-serial.rules
#
echo -e "\n${greenColour}[+]${endColour} Me tienes que decir que linea quieres ${redColour}borrar${endColour}"
archivo=$(sudo /usr/bin/cat -n /etc/udev/rules.d/99-usb-serial.rules)
echo -e "\n--------------------------------------------------------------------------------\n"
echo -e "$archivo"
echo -e "\n--------------------------------------------------------------------------------\n"

#
#Pregunta al usuario que linea en concreto quiere borrar
#
re='^[0-9]+$'
while :
do
	echo -e "${greenColour}[+]${endColour} Introduce el ${yellowColour}numero${endColour} de linea que quieres borrar: "
	read numero
	if [[ $numero =~ $re ]];then
		echo -e "\nUsted, ha elegido la linea ${redColour}$numero${endColour}"
			sleep 2
			echo -e "\nBorrando linea ${redColour}$numero${endColour}..."
			sed -i "$numero"d /etc/udev/rules.d/99-usb-serial.rules
			mv /etc/udev/rules.d/99-usb-serial.rules /etc/udev/rules.d/99-usb-serial.ruless
			mv /etc/udev/rules.d/99-usb-serial.ruless /etc/udev/rules.d/99-usb-serial.rules
			echo -e "\n${greenColour}[+]${endColour} Linea borrada correctamente\n"
			echo -e "${greenColour}[+]${endColour} Desconecte y vuelva a conectar el ${redColour}dispositvo${endColour}"
		break

	else
		echo -e "\n$numero no es un ${redColour}numero${endColour}\n"
	fi
done
		exit 1;;

#
#Copias
#
Copias )
clear
mkdir -p /etc/.Copias/.USB 2>/dev/null
echo -e "${greenColour}[+]${endColour} Acabas de entrar a Copias de Seguridad, me tienes que decir si quieres ${yellowColour}Hacer copia de seguridad${endColour} o ${turquoiseColour}Volver a una copia${endColour} del archivo ${redColour}/etc/udev/rules.d/99-usb-serial.rules${endColour}"

#
#El usuario escoge entre Hacer copia de seguridad o Restaurar copia de seguridad
#
select yn in  "$hcopia" "$rcopia" "Salir"; do
     case $yn in

#
#Hacer copia de seguridad
#
$hcopia )
	clear
		echo -e "${greenColour}[+]${endColour} Acabas de elegir ${redColour}$hcopia${endColour}...\n"
		read -p "Introduce el nombre de la copia a guardar: " copia
		if [ "$copia" != "" ]
			then
		echo -e "Creando la copia ${redColour}$copia${endColour}...\n"
		cp /etc/udev/rules.d/99-usb-serial.rules /etc/.Copias/.USB/$copia
		echo -e "${greenColour}[+]${endColour} Copia creada correctamente..."
		exit 1
break
                else
                echo -e "\n$copia esta ${redColour}vacia${endColour}\n"
        fi

	exit 1;;
#
#Restaurar copia de seguridad
#
$rcopia )
	clear
		echo -e "${greenColour}[+]${endColour} Acabas de elegir ${redColour}$rcopia${endColour} te voy a enseñar las copias que tienes y eliges la que quieres restaurar..."

		echo -e "\n${turquoiseColour}--------------------------------------------------------------------------------${endColour}\n"
		ls /etc/.Copias/.USB/ | awk 'BEGIN{FS=" "; OFS="\n"} {print $1}'
		echo -e "\n${turquoiseColour}--------------------------------------------------------------------------------${endColour}\n"

		read -p "Introduce el nombre de la copia a restaurar (entero): " nombre
		if [ "$nombre" != "" ]
			then
		echo -e "Restaurando la copia ${redColour}$nombre${endColour}..."
		cp /etc/.Copias/.USB/$nombre /etc/udev/rules.d/99-usb-serial.rules
		echo -e "\n${greenColour}[+]${endColour} Copia restaurada correctamente"
		exit 1
	break
        	else
                echo -e "\n$numero no es un ${redColour}numero${endColour}\n"
        fi


	exit 1;;

#
#Cierra el salir de Restaurar copia de seguridad, Hacer copia de seguridad o/y Salir
#
Salir )
	clear
		echo -e "\n${redColour}[-]${endColour} Cerrando Script..."
	exit 1 ;;
esac
done
;;


#
#Cierra la pregunta determinada linea, TODO o Salir
#
        Salir )
             echo -e "\n${redColour}[-]${endColour} Cerrando Script..."
        exit 1;;
esac
done
;;
