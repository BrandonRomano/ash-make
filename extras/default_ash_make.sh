#!/bin/bash

##################################################
# This command is executed when calling either
# 'ash make:exec main' or simply 'ash make'
##################################################
Make__command_main() {
    Logger__log "ash_makefile main"
}

##################################################
# This command is executed when calling
# 'ash make:exec other'
##################################################
Make__command_other() {
    helper_function
}

##################################################
# This is a helper function, and cannot be
# called directly via the command line
##################################################
helper_function() {
    Logger__log "Helper function, called from 'other' command"
}
