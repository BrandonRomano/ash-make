#!/bin/bash

Make_make_file_name="ash_make.sh"
Make_make_file_path="$Ash__call_directory/$Make_make_file_name"

##################################################
# This function is just an alias for `ash make:exec main`
# so users can simply run `ash make`
#
# @param $@: All parameters to the main make command
##################################################
Make__callable_main() {
    Make__callable_exec "main" "$@"
}

##################################################
# This callable will execute any command in a
# ash_make.sh file
#
# @param $1: The command to execute in the
#            ash_make.sh file.
# @param ${@:2}: All parameters to the make command
##################################################
Make__callable_exec() {
    # If directory is not already initialized
    if [[ ! -f $Make_make_file_path ]]; then
        Logger__error "No ash_make.sh file found, run make:init to get started"
        return
    fi

    # Loading in the ash_make temporary file
    local tmp_make_file="$Make_make_file_path.tmp"
    sed 's/Command__/Make__command_/g' < $Make_make_file_path > "$tmp_make_file"
    . "$tmp_make_file"
    rm "$tmp_make_file"

    # Executing the command
    Make__command_$1 "${@:2}"
}

##################################################
# Initializes the current directory with a
# ash_make.sh file with a base scaffolding
##################################################
Make__callable_init() {
    # If directory is not already initialized
    if [[ ! -f $Make_make_file_path ]]; then
        cp "$Ash__active_module_directory/extras/default_ash_make.sh" "$Make_make_file_path"
        Logger__success "Make file has been created at $Make_make_file_path"
    else
        Logger__error "This directory is already initialized!"
    fi
}
