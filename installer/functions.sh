# Printing
function print {
    printf "%s\n" "$1$2$end"
}
function title {
    print
    print $yel "$1"
}
function section {
    print 
    print $mag "$1"
}
function info {
    print $grn "$1"
}

# Variables
function set_environment_variable {
    export $1=$2
    info "- $1: $2"
}

# Software
function needs_installation {
    # check if command exists and fail otherwise
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        return 0
    else
       return 1
    fi
}

function try_install_software {
    if needs_installation $1; then
        info "- $1: Installing..."
        sudo apt install $1 -y -qq
        return 1
    else
        info "- $1: Already installed"
        return 0
    fi
}

# File management
function link_file {
    rm -rf $2
    ln -s $1 $2
}
function copy_file {
    rm -rf $2
    cp -r $1 $2
}