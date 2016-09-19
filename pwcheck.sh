#!/bin/bash
PASSWORD=`cat $1`
SCORE=0

# Check password length
if [ ${#PASSWORD} -lt 6 ] ||  [ ${#PASSWORD} -gt 32 ] ; then
	echo "Error: Password length invalid."
	exit 1
else	
	let SCORE+=${#PASSWORD}
fi

# Check for special characters
if egrep -q '[#\$\+%@]' $1 ; then
	let SCORE=SCORE+5
fi

# Check for numbers
if egrep -q '[0-9]' $1 ; then
	let SCORE=SCORE+5
fi

# Check for letters
if egrep -q '[a-zA-Z]' $1 ; then
	let SCORE=SCORE+5
fi

# Check for consecutive alphanumeric repetition 
if egrep -q "([A-Za-z0-9])\1{1}" $1 ; then
	let SCORE=SCORE-10
fi

# Check for 3 consecutive lowercase characters
if egrep -q '[a-z][a-z][a-z]' $1 ; then
	let SCORE=SCORE-3
fi

# Check for 3 consecutive uppercase characters
if egrep -q '[A-Z][A-Z][A-Z]' $1 ; then
	let SCORE=SCORE-3
fi

# Check for 3 consecutice numbers
if egrep -q '[0-9][0-9][0-9]' $1 ; then
	let SCORE=SCORE-3
fi

echo "Password Score: $SCORE"
