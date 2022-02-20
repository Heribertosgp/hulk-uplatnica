#!/bin/bash

GODINA=$(date +"%Y")
mkdir ../kreirane-uplatnice/$GODINA

exec 3<"../hulk-clanstvo.csv"
	while read <&3 -r LINE
	do
		IME_PREZIME=`echo "$LINE" | awk -F "," '{print $1;}'`
		IME=`echo "$IME_PREZIME" | awk -F " " '{print $1;}'`
		PREZIME=`echo "$IME_PREZIME" | awk -F " " '{print $2;}'`
		OIB=`echo "$LINE" | awk -F "," '{print $2;}'`
		cp oib-ime_prezime.py ../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py
		sed -i "s/OIB/$OIB/" "../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py"
		sed -i "s/IME/$IME/" "../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py"
		sed -i "s/PREZIME/$PREZIME/" "../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py"
		sed -i "s/GODINA/$GODINA/" "../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py"
		sed -i "s/GODINA/$GODINA/" "../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py"		
		python3 ../kreirane-uplatnice/$GODINA/$GODINA-$OIB-$IME"_"$PREZIME.py
	done
exec 3>&-
