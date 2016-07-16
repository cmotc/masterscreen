#! /bin/sh
if [ -z "$1" ]; then
	if [ "$1" = "remove" ]; then
		sudo rm /usr/bin/masterscreen
	elif [ "$1" = "install" ]; then
		sudo cp masterscreen /usr/bin/
		sudo chmod a+x /usr/bin/masterscreen
	fi
fi
