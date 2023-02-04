#!/bin/bash

# https://github.com/himanshub16/ProxyMan
# https://wiki.archlinux.org/title/Proxy_server

# check if stdout is a terminal
if test -t 1; then
    # see if it supports colors
    ncolors=$(tput colors)

    if test -n "${ncolors}" && test ${ncolors} -ge 8; then
        bold="$(tput bold)"
        underline="$(tput smul)"
        standout="$(tput smso)"
        normal="$(tput sgr0)"
        black="$(tput setaf 0)"
        red="$(tput setaf 1)"
        green="$(tput setaf 2)"
        yellow="$(tput setaf 3)"
        blue="$(tput setaf 4)"
        magenta="$(tput setaf 5)"
        cyan="$(tput setaf 6)"
        white="$(tput setaf 7)"
        # export star="🌟"
        star="*"
    fi
fi

## Shell env
function _set_env_porxy() {
    echo -e "Setting proxy env variables..."

    if [ ! -e "$no_proxy" ]; then
        export no_proxy=".local,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
        export NO_PROXY=${no_proxy}
    fi

    local proxy=$1
    export http_proxy=$proxy
    export https_proxy=$proxy
    export rsync_proxy=$proxy
    export HTTP_PROXY=$proxy
    export HTTPS_PROXY=$proxy
    export RSYNC_PROXY=$proxy

    _list_env_proxy
}

function _unset_env_proxy() {
    unset http_proxy https_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY RSYNC_PROXY
    echo -e "Proxy environment variables removed."

    _list_env_proxy
}

function _list_env_proxy() {
    # echo "List current Shell proxy environments"
    # echo
    echo "${bold}Shell proxy settings: ${normal}"

    for proxytype in "http" "https" "rsync" "no"; do
        local proxy_name=${proxytype}_proxy
        echo -e "${proxytype}_proxy=${!proxy_name}"
    done
    for PROTOTYPE in "HTTP" "HTTPS"  "RSYNC" "NO"; do
        echo -e "${PROTOTYPE}_PROXY=$(printenv ${PROTOTYPE}_PROXY)"
    done
}

## Main / Entrypoint
function main() {
    case "$1" in
        "set"      ) _set_env_porxy "$2"
                     ;;
        "unset"    ) _unset_env_proxy
                     ;;
        "list"     ) _list_env_proxy
                     ;;
        * | "help" ) echo -e "$HELP_TEXT"
                     ;;
    esac
}

main "$@"
# echo
echo "Done"
