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
echo 1 hap
tar -cvf xkcd_comics.tar tars/
echo 2 hap
rm -r tars
echo 3 hap

	# create a tar file
		# tar -cvf xkcd_comics.tar /tars
	
	# //c.xkcd.com/random/comic/ ???
