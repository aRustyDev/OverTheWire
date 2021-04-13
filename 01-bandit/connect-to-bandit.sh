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
#license_file="./docs/license"

################################################################################
# Functions                                                                    #
################################################################################
Connect()
{
   clear
## Looking Up Password
   echo "==Looking up Password for Bandit$lvl=="
   key=$(egrep "bandit$1:" "$key_file" | cut -d ':' -f 2)
   echo 

## Show Passwd & Paste to Clipboard
   echo "==Password Pasted to Clipboard=="
   echo "Password: ${key}"
   echo "${key}" | clip
   echo 

#  Connect
   echo "==RUNNING CMD=="
   echo "lvl-$lvl"
   ssh -F ./.ssh/config lvl-$lvl
   # echo "ssh -F ./.ssh/config lvl-$lvl"
}

################################################################################
# Main program                                                                 #
################################################################################
lvl=$(seq -f "%02g" $1 $1)
Connect $1