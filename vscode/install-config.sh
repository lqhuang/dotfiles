#!/bin/sh

CURR_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

SYSTEM=$(uname -s)

echo ${CURR_DIR}
echo $SYSTEM

case ${SYSTEM} in
    Darwin)
        VSCODE_SETTING_DIR="${HOME}/Library/Application Support/Code/User"
        break
        ;;
    Linux)
        VSCODE_SETTING_DIR="${HOME}/.config/Code/User"
        break
        ;;
    *)
        echo "Sorry, I don't understand"
        ;;
esac


for each_file in "settings.json" "keybindings.json" "tasks.json"; do
    echo ${CURR_DIR}/${each_file}
    echo ${VSCODE_SETTING_DIR}/${each_file}
    if [[ -e ${each_file} ]]; do
        echo "Warning: file already exists. create a backup now..."
        mv ${each_file} .bak
    fi

    # Note: "" is necessary, it may contains space character in target path
    ln -s "${CURR_DIR}/${each_file}" "${VSCODE_SETTING_DIR}/${each_file}"
done