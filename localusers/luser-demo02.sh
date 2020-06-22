#!/bin/bash

#########################################################
####This script displays the UID and username of user####
####Executing this script                            ####
####It also displays if user is root user or not     ####
#########################################################

# Displays UID
echo "Your UID is : ${UID}"
# Note that we have two built in variable for uid
# 1) UID - That gives the user ID of a user
# 2) EUID - That gives Effective UID of a user
# UID and EUID are different only in case where set UID bit
# is set on a file and whoever is going to execute that
# script, the script will be executed as a owner of a file
# so in that case EUID will be different and will be the 
# user ID of that file owner and not uid of a user execut-
# ing that script. 
# note that the built in variable we are using above is 
# read only and if we try to modify it as below
# UID=1000
# its going to through error    

# we can also make use of below statement to get UID
USER_ID=$(id -u)
echo "Your UID is : ${USER_ID}"

# Also note that we can use "man bash" to check out all 
# the built in shell variable in linux.

# Displays Username
echo "Your username is : ${USER}"
# another way
USER_NAME=$(id -un)
echo "Your user name is : ${USER_NAME}"
# another way
USER_NAME2=$(whoami)
echo "your user name is : ${USER_NAME2}"
# "whoami" is a program and not built in type. to check 
# run "type -a whoami"
# as this is not built in type, user man to find info

# Another way
USER_NAME3=`whoami`
echo "your user name is : ${USER_NAME3}"
# So here we have used tick instead of paranthesis to
# declare a variable haing value of whoami.
# This is old way of scripting

# Displays if user is root user or not
if [[ "${USER_ID}" -eq 0 ]]
then
    echo "User id root user"
else
    echo "User non root user"
fi
# note the spaces between if keyword and square brackets
# also note that the variables inside if conditions
# should be enclosed in double quotes.

# we can also write the entire if block in a same line
# by using ";" as a line separator

if [[ "${UID}" -eq 0 ]]; then    echo"root user"; fi

# here "[[" are shell in built and whatever expression we
# pass in them they evaluates wither to 0 or 1
# based on test built in 
# type -a [[
# type -a test -- This can give all the tests we can do 
# on files, string, arithmatic etc.

