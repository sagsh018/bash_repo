#!/bin/bash

# above line is known as shebang made of 1) #-sharp
#   + 2) ! - Bang = #! shaband
# Followed by the interpreter /bin/bash
# Another thing to note here is that when we excute the 
# script using above line firstly "/bin/bash" shell 
# invironment is executed and then the file name of a 
# script will be passed and then all commands in script
# executed one by one.
# Also note that if we won't pass the line in script and 
# execute it without it then the script will be executed
# within your current shell which are logged into.
# And this is not advisable as the script might require
# different shell environment then your current 
# shell environment.

# This script is going to show various items on screen

# display hello
echo 'Hello' # note that "echo" is a shell built in
# To see more about this use below command on command line
# type -a echo
# This will give info for all instances of echo on 
# system. 
# [vagrant@Testbox01 localusers]$ type -a echo
# echo is a shell builtin
# echo is /usr/bin/echo

# To execute this file we have to first save this file 
# then give excutable permissions to user and then 
# execute it as "./luser-demo01.sh" where "." is for current
# directory and "/" is used for directory saparator.
# so it can also be executed as /vagrant/luser-demo01.sh

# Note that the script file name need to end with .sh.
# and file name also could be anything.

# Remember in case of built in shell commands like we
# have seen above "echo", we can get help using "
# help echo" but in case of user commands like "uptime"
# we can only get help using "man uptime"

# Assinging value to a variable

WORD="string"
# note that in above assignment "WORD" is a variable and 
# there is no space between "=" sign 
# Below are allowed variable in bash script
# WORD1
# _WORD2
# 3WORD ==> this is not allowed.
# A-WORD ==> not allowed
# E@WORD ==> Not allowed

# Displaying value of variable
echo "$WORD"
# Note here we have used double quotation as we want 
# variable to be interpreted and its value to be printed
# So the rule is, if we want echo or any command to print
# exactly same word we are passing, then in that case use 
# single quotation marks
# but if you are passing any variable, then in that case 
# make use of double quotations.
echo '$WORD'
# above command will not display value of WORD instead
# it will display "$WORD" on screen as we haven't used 
# double quoation at time of passing variable.

# combination of variable with hard coded text
echo "This is a : $WORD"

# Displaying the content of variable using another syntax
echo "This is a : ${WORD}"
# This curly braces are used while displaying content 
# of a variable when we want to append text to a variable.
# See below example

# appending text to a variable
echo "${WORD}ing is fun"

# but this will not work
echo "$WORDing is fun"
# here bash won't be able to understand that "ing"
# is not a part of variable and its a text here.

# Note that variables are always in uppercase and this is
# best practice.

# creating another variable
ENDING=ed

# now lets combine both the variable
echo "This is ${WORD}${ENDING}"
# so here when we want to concatinate two variable strings
# we have to use curly braces.

# Now suppose if we want to change value of variable
# ENDING then

ENDING='ing'
echo "This is ${WORD}${ENDING}"
# So here we have changed the value of variable ENDING
# so we can say in bash scripting strings are mutable


