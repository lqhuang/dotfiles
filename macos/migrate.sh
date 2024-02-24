#!/bin/bash
# a simple script to migrate my personal data to another mac
# without configuration files and cache files

# Define the IP address and directory of the target host
TARGET_HOST=lanqings-mac-mini.local
TARGET_DIR="${HOME}"

# rsync the home directory to the target host
rsync -ahP \
    --exclude='**/node_modules' --exclude='**/target' --exclude='**/build' \
    --exclude='**/.venv' --exclude='**/.conda-venv' \
    --exclude='**/__pycache__' --exclude='**/.mypy_cache' --exclude='**/.pytest_cache' \
    --exclude='**/.DS_Store' \
    --exclude='Applications' --exclude='Library' --exclude='Movies' --exclude="OrbStack" \
    --exclude='Postman' --exclude='Public' --exclude='Music' --exclude="Software" \
    --exclude=".Trash" --exclude=".bash_sessions" \
    --exclude=".bash_sessions" \
    --exclude=".bloop" \
    --exclude=".cache" \
    --exclude=".cargo" \
    --exclude=".conda" \
    --exclude=".docker" \
    --exclude=".dotty_history" \
    --exclude=".g8" \
    --exclude=".ivy2" \
    --exclude=".labelmerc" \
    --exclude=".lesshst" \
    --exclude=".local" \
    --exclude=".logseq" \
    --exclude=".m2" \
    --exclude=".matplotlib" \
    --exclude=".mongodb" \
    --exclude=".node" \
    --exclude=".node_repl_history" \
    --exclude=".npm" \
    --exclude=".ocat" \
    --exclude=".oh-my-zsh" \
    --exclude=".orbstack" \
    --exclude=".pnpm-state" \
    --exclude=".pyenv" \
    --exclude=".python_history" \
    --exclude=".rustup" \
    --exclude=".sbt" \
    --exclude=".sdkman" \
    --exclude=".terminfo" \
    --exclude=".vim" \
    --exclude=".viminfo" \
    --exclude=".vnc" \
    --exclude=".vscode" \
    --exclude=".vscode-server" \
    --exclude=".wakatime" \
    --exclude=".wakatime.bdb" \
    --exclude=".wakatime.cfg" \
    --exclude=".warp" \
    --exclude=".yarnrc" \
    --exclude=".zcompdump*" \
    --exclude=".zprofile" \
    --exclude=".zsh_sessions" \
    --exclude=".zshenv" \
    "${HOME}/" "${TARGET_HOST}:${TARGET_DIR}/"
