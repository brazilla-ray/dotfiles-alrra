#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

upgrade

./development_tools.sh
./../nvm.sh

#./browsers.sh
#./compression_tools.sh
./git.sh
# ./image_tools.sh
#./misc.sh
./misc_tools.sh
#./../npm.sh
./tmux.sh
./../vim.sh

./cleanup.sh
