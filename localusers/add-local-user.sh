#!/bin/bash

############################################################################
## This is a script which is going to help Desk to add new user who joins ##
## organisation and org'n wants to test new linux based application       ##
############################################################################


# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
    echo "Please execute this script as a superuser..!!"
    exit 1
fi

# Get the username (login).
read -p 'Please enter the user name you wish to create : ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Please enter full name of a person : ' COMMENT

# Get the password.
read -p 'Please enter the initial password you wish to set : ' PASSWORD

# Create the user with the password.
useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then        
    echo "${USER_NAME} not created successfuly"
    exit 1
fi
echo "${USER_NAME} created successfuly"

# Set the password.
echo "${PASSWORD}" | passwd --stdin "$USER_NAME"

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then        
    echo "${USER_NAME}'s password not set successfuly"
    exit 1
fi
echo "${USER_NAME}'s password set successful"

# Force password change on first login.
passwd -e "${USER_NAME}"

# Display the username, password, and the host where the user was created.
echo '##################################################'
echo '##Below is the information about the new account##'
echo '##################################################'
echo "User name : ${USER_NAME}"
echo "password : ${PASSWORD}"
HOSTNAME=$(hostname)
echo "Hostname : ${HOSTNAME}"

exit 0
