#！/usr/bin/env bash

print_usage() {
  echo "Usage: vscode-dotscript.sh COMMAND"
  echo "Commands:"
  echo "    install    Install specific extensions from PWD/extensions.txt"
  echo "    dump       Dump current extensions list of VSCode to PWD/extensions.txt"
  # if has an invalid option, exit with 64
  # exit 64
}

LISTNAME=extensions.txt
LISTFILE=$(dirname `realpath $0`)/$LISTNAME

dump() {
    local system=$(uname -s)
    local extdir=${HOME}/.vscode/extensions
    local curr_extensions=()

    for ext_version in $(ls $extdir); do
        # Strip '-version' string
        # TODO: this could be done in one line with `awk`
        local num_dashes=$(echo ${ext_version} | tr -d '\n' | grep -o '-' | wc -l)
        # num_dashes=$(echo ${ext_version} | awk -F'-' 'NF{print NF-1}')
        # num_dashes=$(echo ${ext_version} | awk '{print gsub("-", "&")}')
        local ext_name=$(echo ${ext_version} | cut -d'-' -f-${num_dashes})
        curr_extensions+=($ext_name)
    done

    if [[ ! -f $LISTFILE || -w $LISTFILE ]]; then
        printf "%s\n" ${curr_extensions[@]} > $LISTFILE
        # echo ${curr_extensions[@]} | tr ' ' '\n' > LISTFILE
    else
        echo "Error: Failed to write file."
        echo "Please check existence or write permission of $LISTNAME file"
    fi

    return 0
}

install() {
    # extensions=(
    #     davidanson.vscode-markdownlint
    #     donjayamanne.githistory
    #     eamodio.gitlens
    #     jithurjacob.nbpreviewer
    #     justusadam.language-haskell
    #     ms-python.python
    #     ms-vscode.cpptools
    #     njpwerner.autodocstring
    #     peterjausovec.vscode-docker
    # )
    if [[ -f $LISTFILE && -w $LISTFILE ]]; then
        local extensions=$(cat $LISTFILE)
    else
        echo "Error: Uable to read $LISTNAME."
        echo "Please check existence or read permission of $LISTNAME file."
    fi

    for i in ${extensions[@]}; do
        echo "Installing extension "$i" for vscode..."
        code --install-extension $i
    done

    return 0
}

## main
subcommand=$1

case $subcommand in
    "" | "-h" | "--help")
        print_usage
        ;;
    "install")
        install
        ;;
    "dump")
        dump
        ;;
    *)
        echo "vscode-dotscript.sh: illegal option -- ${1:1:1}"
        print_usage
        ;;
esac
