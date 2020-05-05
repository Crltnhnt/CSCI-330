#! /bin/bash
echo "Welcome to the CLEANER program!"
echo ""

while [ 1 ]; do
	if [ "$#" -ne 3 ]; then
	  	echo "Enter 1 to delete by filename."
	  	echo "Enter 2 to delete by a string within the file."
	  	echo "Enter 3 or quit to exit this program."
	  	echo ""
	fi

	read option

	if [ "$option" -eq "1" ]; then
	  	echo "Enter in the name of the file to delete: "
	  	read filedelete
	  	found=$(find "$filedelete")
	  	if [ "$found" = "$filedelete" ]; then
	  		echo "$(pwd)/$found was FOUND. Still want to delete it? (y/n)"
	  		read input
	  		if [ "$input" = "y" ]; then
	  			$(rm "$filedelete")
				echo "$(pwd)/$found has been removed."
	  		elif [ "$input" = "n" ]; then
				echo "$(pwd)/$found has NOT been removed."
	  		fi
	  	else
			echo "No files found."
		fi
	elif [ "$option" -eq "2" ]; then
		echo "Enter the string to delete files that contain it: "
		read string
		i=$(grep -H -R "$string" | cut -d: -f1)
		if [ "$i" != "" ]; then
	  		echo "$(pwd)/$i was FOUND. Still want to delete it? (y/n)"
			read input
			if [ "$input" = "y" ]; then
				$(rm "$i")
				echo "$(pwd)/$i has been removed."
			else
				echo "$(pwd)/$i has NOT been removed."
			fi
		else
			echo "No files found."
		fi
	else
		exit
	fi
	  	echo ""

done

