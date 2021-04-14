#!/bin/bash
################################################################################
# About the Author                                                             #
################################################################################
#  Helloo!
#  It looks like you found my list script/cmd for connecting to bandit labs.
#  Just as a disclaimer, this will DEFINITELY lead to spoilers. SO if you haven't 
#  finished Bandit Labs yourself just yet, I recommend that you go back and have 
#  a go at it again.

#  This program is meant for fellow veteran problem solvers & nerds, I've got some 
#  pretty decent plans for what I want this to become, but it's gonna be a while 
#  before I can make them reality.

#  Check out my other stuff: https://github.com/aRustyDev
################################################################################
# Variables                                                                    #
################################################################################
key_file=".ssh/.passwd"
license_file="./docs/license.txt"
version_file="./docs/versions.md"

################################################################################
# Functions                                                                    #
################################################################################
bandit_help () {
   # Display Help
   echo 
   echo "Description:   Open a SSH connection to 'bandit.labs.overthewire.org'"
   echo
   echo "     Syntax:   connect-to-bandit [-g|h|v|V] <Bandit Lvl>"
   echo "  Example 1:   connect-to-bandit 0"
   echo "  Example 2:   connect-to-bandit 20"
   echo
   echo "    options:"
   echo "         -h    Print this Help menu."
   # echo "        -w    Display 'What If?' for <Bandit Lvl>."
   echo "         -v    Print software version."
   echo "         -gpl  Print the verbose GPL license notification."
   echo
}

license_full () {
   # Verbose GPL license notification
   while IFS=, read -r y
   do
   echo $y
   done < $license_file
}

bandit_version () {
   # Print Script Version
   cat $version_file | egrep Current | grep -Po "\d.*\d"
}

bandit_connect () {
   clear
## Looking Up Password
   echo "==Looking up Password for Bandit$lvl=="
   key=$(egrep "bandit$1:" "$key_file" | cut -d ':' -f 2)
   echo 

## Show Passwd & Paste to Clipboard
   echo "==Password Pasted to Clipboard=="
   echo "   Password: ${key}"
   echo "${key}" | clip
   echo 

#  Connect
   echo "==RUNNING CMD=="
   ssh -F ./.ssh/config lvl-$lvl
   # echo "ssh -F ./.ssh/config lvl-$lvl"
}

################################################################################
# Main program                                                                 #
################################################################################
while true; do
    case $1 in
      -h) # display Help
         bandit_help
         exit;;
      -gpl) # Display Full GPL license notification
         license_full
         exit;;
      -v) # Display Full GPL license notification
         bandit_version
         exit;;
      *[0-9]*) #Run Script
         lvl=$(seq -f "%02g" $1 $1)
         bandit_connect $1
         exit;;
      -*)#Anything else 
         echo "$0: Unrecognized option $1" >&2
         bandit_help
         exit 2;;
      *) # Empty
         bandit_help
         break ;;
    esac
done