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

