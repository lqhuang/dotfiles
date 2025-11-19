# add Rancher Desktop
if [[ -d "${HOME}/.rd" ]]; then
  export PATH="${HOME}/.rd/bin:$PATH"
fi

# add Pulumi to the PATH
if [[ -d "${HOME}/.pulumi" ]]; then
  export PATH="${PATH}:${HOME}/.pulumi/bin"
fi
