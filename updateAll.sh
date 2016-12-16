#!/bin/bash

#really long and overly complicated way of finding what directory the script is in, used for generality just in case but probably dont need it
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo $DIR

for D in */; do
	cd "$DIR/$D"
	#print the target with bold, underline, and color 204
	echo -e "\e[0;1;4;38;5;204min directory $D"
	#make sure that url.txt both exists and has contents (mostly to just filter out the template folder and any msc folders in the dir)
	if [ -e url.txt ] && [ -s url.txt ]
	then
		echo -e "\e[38;5;34mfound url.txt and it wasnt empty, running update\e[0m"
		./update.sh
	else
		echo -e "\e[38;5;196murl.txt not found or was empty"
	fi
	#reset formatting just in case
	echo -e "\e[0m"
done