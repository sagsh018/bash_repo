# So in this lesson we are going to learn few different ways to generate random data including how to automate the 
# process to generate the randome password. So this we we could reduce input from user of the password even more
# and moe the autmation better it is.

#!/bin/bash

############################################################
########### Script to generate random password #############
############################################################

# Now if we check our bash shell and find out if we have any way of generating random things using any kind of bash
# inbuild variable
# on the command prompt type "man bash"
# and on the man page search for the keyword random, you will find a build in variable for bash shell named as RANDOM
# RANDOM ==> Each time this variable is referenced, a random integer between 0 and 32767 is generated. So now if we 
# Test it on the command prompt using below command
# echo "${RANDOM}" ==> This is going to give some different random integer between above mentioned range every time we 
# we will run this on command line.

# So now lets start by generating a random number as a password
PASSWORD="${RANDOM}"
echo "${RANDOM}"
# So if we execute this script again and again it is going to generate a random number everytime.

# Note : We can execute the most recent command starting with perticular letter on command line by using below short cut
# !v : Now this is going to execute the last successful command starting with v

# Now lets increase a security more and generate a password with the help of three RANDOM variable instead of one
PASSWORD="${RANDOM}${RANDOM}${RANDO}"
echo "${PASSWORD}"

# So this gives us two randomly generated password the first one is have one RANDOM number and second one is having 
# 3 RANDOM numbers.

# Now lets move and think about another type of random data in a system that can be used in order to generate password
# and that could be time and date which continuously changes with the time of system.
# So lets check out the date command and find out what all option does it have along with it
# tun this on command line "man date" and in the man page search for FORMAT and there will be entire list of options 
# that gives out different outputs of days and dates and months
# some of the examples are %%, %a, %A, %b, etc. The FORMAT we want is "%s": This gives us the format of date as seconds 
# since 1970-01-01 00:00:00 UTC. This format is actually called as EPIC or EPIC time and this is going to generate 
# new count of seconds every time we reference this format of date as below command
# date +%s

# So lets go ahead and generate our password with the help of this date/time command 
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Now this third password is going to be generated with the help of date command everytime we run this script

# Now to increase the security of the password even more we can use another format of date called as nano %N
# This provides us the 9 digits and that a lot of data to guess and difficult to actually break on it.
# Lets use nano seconds along with the epic time to generate the password

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# Now we will move further to increase the security by using Hash function and cryptographic functions in order to 
# increase the security more.
 # To Be Contd...

