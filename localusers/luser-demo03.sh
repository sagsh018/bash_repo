#!/bin/bash

####################################################################
##Display the UID and user name of the user executing this script ##
##display if the user is a vagrant user or not                    ##
####################################################################

# Task 1 ==> Display the UID.
echo "User ID is : ${UID}"

# Task 2 ==> Display if the UID does not match 1000.
UID_TO_TEST=1000
if [[ "${UID}" -ne "${UID_TO_TEST}" ]]
then    
    echo "Your user ID does not match ${UID_TO_TEST}"
    exit 1
fi
# Note that here we have used exit status command and specified that no need to execute script further as user ID is 
# not equal to 1000 and just exit the script with status of 1(i.e non 0). when the command execute successfuly
# then it by default return exit status of 0 and when it fails then it return some non zero value based on
# what is the reason of that command to fail
# For example if you want to check exit status of command "useradd" then check using its help and you can find out 
# all the exit status of that.
# also check "type -a exit" -- this will show its a shell built in and then check "help exit" -- this will tells that
# you can use exit with any exit status also and it just take last command execution status.
# if you want to explicitely specify the status then you need to write it after exit command as we did in out example.
# comming to this line "if [[ "${UID}" -ne "${UID_TO_TEST}" ]]" here we are using "-ne" which stands for not equal 
# information regarding these can be taken from "help test"

# Task 3 ==> Display the user name.
USER_NAME=$(whoami)
#echo "User name is : ${USER_NAME}"

# Task 4 ==> Test if the command succeeded.
if [[ "${?}" -ne 0 ]]
then    
    echo 'your whoami aommand does not executed successfully'
    exit 1
fi
echo "You user ID is : ${USER_NAME}"
# So here we are using one special variable ${?}. this is used to hold the status of last command executed.
# so this is going to hold 0 if last executed command i.e. "whoami" in our case is successfully executed. otherwise
# its going to hold some non zero value
# Demonstration of ${?} on command line
# [vagrant@Testbox01 localusers]$ id -ua
# 1000
# [vagrant@Testbox01 localusers]$ echo "${?}"
# 0
# [vagrant@Testbox01 localusers]$ id -unx
# id: invalid option -- 'x'
# Try 'id --help' for more information.
# [vagrant@Testbox01 localusers]$ echo "${?}"
# 1
# [vagrant@Testbox01 localusers]$
# So we can see that if command execute successfully then ${?} holds 0 otherwise it holds non zero value.

# Task 5 ==> You can use test string conditional.
USER_NAME_TO_TEST=vagrant
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then    
    echo "Your user name matches ${USER_NAME_TO_TEST}"
fi
# Now notice here we have used "=" in if statement to check the exact match of string. be careful as "=" has two usage 
# 1) to assign value and 2) to match the exact value. Notice that sometimes we also make use of "==" when we are doing 
# pattern matching. but here we are doing exact match so we are just using "=" as it is suficient here.
# [vagrant@Testbox01 localusers]$ sudo ./luser-demo03.sh
# User ID is : 0
# Your user ID does not match 1000
# [vagrant@Testbox01 localusers]$ echo "${?}"
# 1
# So here we ran our script using sudo as a root user and not as vagrant so our script didn't match user id 0 and
# hence exited as we mention in the script with exit code 1. and  when we checked the value od ${?} it gives 1
# so our script working fine.

# Task 6 ==> Test for != (not equal) for the string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST}" ]]
then
    echo "Your user name does not match ${USER_NAME_TO_TEST}"
fi
# So here we are again matching exact string but using "!=" i.e. not equal.

exit 0
# Here we are explicitely telling to exit scipt with exit code of 0. if we won't mention then exit status will hold 
# based on status of last executed command.
# [vagrant@Testbox01 localusers]$ ./luser-demo03.sh
# User ID is : 1000
# You user ID is : vagrant
# Your user name matches vagrant
# [vagrant@Testbox01 localusers]$ echo "${?}"
# 0
# [vagrant@Testbox01 localusers]$
# so we have executed and checked the exit status and it is 0 which we explicitely mentioned at the end of script.