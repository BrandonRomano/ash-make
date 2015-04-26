#!/bin/bash

##################################################
# This command is executed when calling either
# 'ash make:exec main' or simply 'ash make'
##################################################
Command__main() {
    Logger__warning "TODO: Implement main command in ash_make.sh"
}

##################################################
# This command is executed when calling
# 'ash make:exec other'
##################################################
Command__other() {
    helper_function
}

##################################################
# This is a helper function, and cannot be
# called directly via the command line
##################################################
helper_function() {
    Logger__log "Helper function called!"
}
