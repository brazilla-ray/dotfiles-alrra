#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Used only by browsers.sh
# add_key() {
#
#     wget -qO - "$1" | sudo apt-key add - &> /dev/null
#     #     │└─ write output to file
#     #     └─ don't show output
#
# }

# Used only by browsers.sh
# add_ppa() {
#     sudo add-apt-repository -y ppa:"$1" &> /dev/null
# }

# Used only by browsers.sh
# add_to_source_list() {
#     sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
# }

# Used only by cleanup.sh
autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed.

    execute \
        "sudo yum autoremove -q -y"

}

# Used by: build-essentials.sh, browsers.sh, compression_tools.sh,
# git.sh, image_tools.sh, misc.sh, misc_tools.sh.

install_package() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo yum install -q -y $PACKAGE" "$PACKAGE_READABLE_NAME"
        #         suppress output ─┘  │
        #      assume "yes " as the \ │
        #      answer to all prompts──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

# Used by browsers.sh and this script(install_package).
package_is_installed() {
    rpm -q "$1" &> /dev/null
}

# Used by browsers.sh and main.sh. Alter for yum.
upgrade() {

    # Install the newest versions of all packages installed
    # (will also remove packages made obsolete by any other
    # packages.)

    execute \
        "sudo yum upgrade -q -y"

}

# Used by main.sh. Alter for yum.
# upgrade() {
#
#     # Install the newest versions of all packages installed.
#
#     execute \
#         "export DEBIAN_FRONTEND=\"noninteractive\" \
#             && sudo apt-get -o Dpkg::Options::=\"--force-confnew\" upgrade -qqy" \
#         "APT (upgrade)"
#
# }
