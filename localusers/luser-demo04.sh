#!/bin/bash

#################################################################
##This script is going to create an account on a local system  ##
##You will be prompted for username and password               ##
#################################################################

############ ASk for a user name ############
# here we are going to make use of a shell built method read() to take input from user.
# [vagrant@Testbox01 localusers]$ type -a read
# read is a shell builtin
# read is /usr/bin/read
# we can get info on read using "help read" and it tells read method read  a line from standard input and split it into 
# fields. 
# Now there are three types of inputs and outputs here in bash
# a) standard input, b) standard output & c) standard error. by default standard input comes in from keyboard but not 
# neccesarily every time and standard output and standard error are displayed to the screen.
# another thing to note here is that read is going to take a input in a way that line is split into fields as with the 
# word splitting, and the first word is assigned to first name and second word assigned to second name and so on,
# finally with anyleftover words assigned to the last name. below is the example
# [vagrant@Testbox01 localusers]$ read -p 'type something : ' VAR1 VAR2 VAR3 VAR4
# type something : first second third fourth fifth sixth seventh
# [vagrant@Testbox01 localusers]$ echo $VAR1
# first
# [vagrant@Testbox01 localusers]$ echo $VAR2
# second
# [vagrant@Testbox01 localusers]$ echo $VAR3
# third
# [vagrant@Testbox01 localusers]$ echo $VAR4
# fourth fifth sixth seventh
# -p option in above read command stands for prompt. So lets use this to take user name as input

read -p 'Enter the user name to be created : ' USER_NAME

############## Ask for a real name.#############
read -p 'Enter real name of the person to create a user ID : ' COMMENT

############## Ask for the password #############
read -p "Enter the password that you wish to set for ${USER_NAME} : " PASSWORD

############## create a user ####################
# couple of things to note here 1) it is advisable to create user name of max 8 characters as there are come commands 
# which won't be able to take name of more that 8 characters and they just display 8 characters followed by a + sign 
# for rest of the characters. so its not going to break anything but its comes under good practice to define user name
# not more than 8 char. 2) while doing "su - <user>", "-" make sure that new user also gets a similar working shell 
# envirinment to work with.
# Another thing user names are case sensitive and by convention, all user names should be in lower case.
# special characters are not alloed in user name and they cannot start with number but yes they can have numbers in 
# between and last.
# another point to note here is that useradd with -m option makes it mendatory to create a home directory.
# so if that is not mentioned than user's home directory will not be created provided if its not mentioned in the 
# /etc/login.defs file. So if in this file "CREATE_HOME=No" and if we mentioned -m option in useradd command then 
# home directory will be created otherwise not. similarly if in /etc/login.defs CREATE_HOME=yes then even if we don't
# mention the -m option then also home directory will be created by default. So its better to always rely on -m option
# in useradd command becasue with that you won't have to depend on configuration file as these configurations may
# differ in different systems
# So now lets add the useradd command here.
useradd -c "${COMMENT}" -m "${USER_NAME}"

############ set a password for a user ############
# So here as we know that password reset is a user interactive process so we have to find out some method to make it 
# non interatcive or programatic in nature, we can find answer in "help passwd"
# -stdin
#           Read passwords from stdin
# so with this way we can read password via standard input, which can be pipe (|-operator)
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

# force password change on first login
passwd -e "${USER_NAME}"
# so this option e is going to make password for user ID expire and force the user to reset the password the first 
# he logs in.

# Now you can execute and check it your self...!!!!