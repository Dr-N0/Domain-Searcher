#!/bin/bash

echo "How would you like to proceed?"
echo "1) Read entire network"
echo "2) Read specific subnet"
read quest

if [ $quest == "1" ]
then
	echo "Enter first two numbers in ip (0.0)"
	read ip

	echo "Enter the name of the output file [txt]:"
	read name

	echo "" > $name.txt

	counter1=0
	counter2=0
	while [ $counter1 -lt 226 ]
	do
		while [ $counter2 -lt 226 ]
		do
			
			if nslookup $ip.$counter1.$counter2 | grep -q "** server can't find" ; then
				echo -e $counter1"-"$counter2
			else 
				nslookup $ip.$counter1.$counter2 >> $name.txt
				echo -e $counter1"-"$counter2"*"	
			fi
			counter2=$[$counter2+1]
		done
		counter2=0
		counter1=$[$counter1+1]
	done

else
	echo "Enter first three numbers in ip (0.0.0)"
	read ip2
	COUNTER4=0

	echo "Enter the name of the output file [txt]:"
	read name1

	echo "" > $name1.txt
	while [ $COUNTER4 -lt 226 ];do
		if nslookup $ip2.$COUNTER4 | grep -q "** server can't find" ; then
			echo -e $COUNTER4
		else 
			nslookup $ip2.$COUNTER4 >> $name1.txt
			echo -e $COUNTER4"*"
		fi
		let COUNTER4=COUNTER4+1
	done
fi

