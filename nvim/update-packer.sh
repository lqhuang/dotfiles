#!/bin/bash

set -eu o pipefail

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# nvim --headless +PackerUpdate +PackerCompile +qa
