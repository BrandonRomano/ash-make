# Ash-Make

Ash-Make is a [Ash](https://github.com/BrandonRomano/ash) module that allows users to create files similar to classic Makefiles but are written like traditional script files.  Ash-Make files can also leverage powerful dependency management from the Ash core.

## Getting started

You're going to have to install [Ash](https://github.com/BrandonRomano/ash) to use this module, as it is tightly coupled to the Ash core.

After you have Ash installed, run either one of these two commands depending on your git clone preference:

- `ash self:install git@github.com:BrandonRomano/ash-make.git`
- `ash self:install https://github.com/BrandonRomano/ash-make`

You can optionally add `--global` to the end of these commands to install them globally.

After that, you should now be good to use Ash-Make.

## How to use Ash-Make

### Initializing a Directory

If this is your first time using Ash-Make, run `ash make:init` in your application's directory.  This will create an `ash_make.sh` file that's already been stubbed out to get you started.

If you've already used Ash-Make, and don't need a template, you're totally free to just create an `ash_make.sh` file.

## The ash_make.sh File

After running `ash make:init` you'll find a file that looks like this:


```sh
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
```

This file contains both commands, and normal helper functions.

## Commands

Commands are prefixed with `Command__` (two underscores).  These are the functions that can be executed directly via Ash-Make.

For example, if you would like to execute `Command__other`, you would run `ash make:exec other`.

The same is true for `Command__main`, although `ash make:exec main` is simply aliased to `ash make`.

It's also worth noting that these commands are simple bash functions, and can be called via other commands/helper functions.

## Helper functions

Helper functions are simply any function in the `ash_make.sh` file that are not prefixed by `Command__`.

Just like commands, these are also simple bash functions, and can be called via other commands/helper functions.

## License

[MIT](license.txt)
