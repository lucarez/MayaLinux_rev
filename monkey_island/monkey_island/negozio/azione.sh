#!/bin/bash

# non ho messo il controllo: "attenzione, hai fatto il furbo, vieni rispedito nelle fogne

if [ -e monkey ]; then

	echo GRANDIOSO!!!
	echo Hai trovato la giusta decodifica!
	echo
	echo Corri a comprare una nave, poi sarai pronto per partire con il tuo equipaggio verso Monkey Island!
	echo
	echo
	sleep 3
	echo
	echo
	echo   ... sei riuscito a comprare una nave dal venditore Stan, ora tu, Carla, Otis e Murray
	echo   siete pronti per salpare, destinazione: M o n k e y   I s l a n d!!!
	echo
	
	rm monkey
	touch banana
	#chmod +x ../uscita/*
	dd if=/dev/zero of=../uscita/anstis_fs bs=2M count=2 &> /dev/null
	dd if=/dev/zero of=../uscita/tucker_fs bs=2M count=2 &> /dev/null
	dd if=/dev/zero of=../uscita/wood_fs bs=2M count=2 &> /dev/null	
	dd if=/dev/zero of=../uscita/murray_fs bs=2M count=2 &> /dev/null


	cd ../uscita

	alias mkfs.ext4="./.pippo"	
	
	if [ ! -e ../uscita/.stiva/winter ]; then
		touch  ../uscita/.stiva/winter
	fi

	if [ ! -e ../uscita/..stiva/kechulc ]; then
		touch  ../uscita/.stiva/kechulc
	fi

	if [ ! -e ../uscita/.stiva/taylor ]; then
		touch  ../uscita/.stiva/taylor
	fi

	if [ ! -e ../uscita/.stiva/cooper ]; then
		touch  ../uscita/.stiva/cooper
	fi

	if [ ! -e ../uscita/.stiva/blake ]; then
		touch  ../uscita/.stiva/blake
	fi
	
	
else
	echo
	echo Risposta errata! Riprova...
	echo
	touch banana
fi
