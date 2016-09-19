#!/bin/bash
START=$1
END=$2
RANGE=$(expr $END - $START)
if [ $START -gt $END ] || [ $RANGE -gt 20 ] ; then 
	echo "ERROR: Please enter correct indices."
	exit 1
fi
mkdir -p xkcd_comics
cd xkcd_comics
COUNT=$START
while [ $COUNT -le $END ] ; do	
	location=$(curl -sL http://xkcd.com/$COUNT | grep -oh 'http://imgs.xkcd.com/comics/[^.]*\.[a-z]*')
	wget $location
	let COUNT+=1
done
cd ..
if [ "$ls -A xkcd_comics/" ] ; then
	tar -cvf xkcd_comics.tar xkcd_comics/
fi
	rm -r xkcd_comics/
