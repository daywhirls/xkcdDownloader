#!/bin/bash
START=$1
END=$2
RANGE=$(expr $END - $START)
if [ $START -gt $END ] || [ $RANGE -gt 20 ] ; then 
	echo "ERROR: Please enter correct indices."
	exit 1
fi
mkdir -p tars
cd tars
COUNT=$START
while [ $COUNT -le $END ] ; do	
	location=$(curl -sL http://xkcd.com/$COUNT | grep -oh 'http://imgs.xkcd.com/comics/[^.]*\.[a-z]*')
	wget $location
	let COUNT+=1
done
cd ..
if [ "$ls -A tars/" ] ; then
	tar -cvf xkcd_comics.tar tars/
fi
	rm -r tars
