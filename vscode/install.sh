#！/usr/bin/env bash

extensions=(
    njpwerner.autodocstring
    peterjausovec.vscode-docker
    donjayamanne.githistory
    eamodio.gitlens
    justusadam.language-haskell
    davidanson.vscode-markdownlint
    ms-python.python
    jithurjacob.nbpreviewer
    ms-vscode.cpptools
)

for i in ${extensions[@]}; do
    echo "Installing extension "$i" for vscode..."
    code --install-extension $i
done

# Depending on your platform, the user settings file is located here:
#     Windows %APPDATA%\Code\User\settings.json
#     macOS $HOME/Library/Application Support/Code/User/settings.json
#     Linux $HOME/.config/Code/User/settings.json
