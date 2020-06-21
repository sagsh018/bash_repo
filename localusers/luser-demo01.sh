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
echo 'Hello'