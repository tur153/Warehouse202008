#!/bin/bash
turn=4
count=0
int=0
blackpoint=""

while [ "$count" -le 19 ];
	 do
 	 let "int=0"

 	 while [ "$int" -le 331 ];
		 do
		 	str=" point $count,$int"

		 if [ "$turn" -eq 3 ]; then
		 	blackpoint="$blackpoint$str"
		 	let "turn++"

		 elif [ "$turn" -eq 4 ]; then
		 	blackpoint="$blackpoint$str"
		 	let "turn=1"

		 else
		 	let "turn++"
		 fi
		 let "int++"
	 done

	 let "count++"
	 let "turn--"

	 if [ "$turn" -eq 0 ]; then
		 let "turn=4"
	 fi
done

convert -size "638x331!" xc:black -fill white -draw "$blackpoint" c.jpg

cc=39

while [ "$count" -le 637 ]; 
	do
		blackpointa=""
	while [ "$count" -le "$cc" ];
 		do
		let "int=0"

 		while [ "$int" -le 331 ];
 			do
 				str=" point $count,$int"
			if [ "$turn" -eq 3 ]; then
				blackpointa="$blackpointa$str"
				let "turn++"
			elif [ "$turn" -eq 4 ]; then
				blackpointa="$blackpointa$str"
				let "turn=1"
			else
				let "turn++"
			fi
				let "int++"
			done

		let "count++"
		let "turn--"

			if [ "$turn" -eq 0 ]; then
 				let "turn=4"
			fi
		done
		let "cc+=20"
		convert -size "638x331!" -fill white -draw "$blackpointa" c.jpg c.jpg
	done

