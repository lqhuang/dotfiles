#!/bin/bash
# Install `miniconda3` to "${HOME}/Software/miniconda3" via tuna mirror
set -euo pipefail

CONDA_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda
CONDA_INST_FILE=Miniconda3-py311_23.5.2-0-Linux-x86_64.sh
CONDA_URL="${CONDA_MIRROR}/${CONDA_INST_FILE}"

OUTPUT_DIR="${HOME}/Downloads"
INSTALL_PREFIX="${HOME}/Software"
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${INSTALL_PREFIX}"

echo "Downloading ${CONDA_INST_FILE} from ${CONDA_MIRROR} ..."
curl -fsSL --output-dir "${OUTPUT_DIR}" -O "${CONDA_URL}"

_name_array=( # trans to string array splited by '-'
    $(echo "${CONDA_INST_FILE}" | tr "-" "\n")
)
# Get first value as software path (`Miniconda3` as lowercase)
CONDA_DIR=$(echo ${_name_array[1]} | tr '[:upper:]' '[:lower:]')

echo "Installing ${CONDA_DIR} to ${INSTALL_PREFIX} ..."
bash "${OUTPUT_DIR}/${CONDA_INST_FILE}" -b -p "${INSTALL_PREFIX}/${CONDA_DIR}"
echo "Done installation."
