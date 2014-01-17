#!/bin/bash
#Test Shell Script for Archiving Machines
#Copyright Kia Lam 2013

#Basic Parameters
COMP_NAME=`networksetup -getcomputername`
COMP_INFO=`system_profiler SPHardwareDataType`
ou="CN=Computers,Dc=gspsf,DC=com"
domain=gspsf.com


#Declaring my intentions
echo "Welcome to the GSP awesome archiving utility"
#Getting the machine information
system_profiler SPHardwareDataType
#echo $COMP_INFO
#Ask for admin's username
#read -p "Enter your username: " username
#echo $username

#Ask for admin's password
#read -s -p "Enter password: " password
#echo $password

#Unbind machine from Active Directory
echo "Unbiding from AD"$'\n'
#dsconfigad -f -r -a $COMP_NAME -domain $domain -u $username -p "$password" -ou "$ou"
#dsconfigad -f -r -u $username -p "$password"

#Get the computer name and change it to "SHELF-computer-name"
echo "Renaming "$COMP_NAME$'\n'
networksetup -setcomputername SHELF-$COMP_NAME
newName=`networksetup -getcomputername`
echo "Renamed to "$newName$'\n'
#echo "$newCOMP"
#Finally, we run a jamf recon to tell Casper the computer has been archived
#echo "Running jamf recon"
#sudo jamf recon
