#!/bin/bash
set -e

tool="${INPUT_TOOL}"
input="$(realpath "${INPUT_INPUT_FILE}")"
output="$(realpath "${INPUT_SARIF_FILE}")"

if [ "${tool,,}" = "cppcheck" ]; then
    tmp=$(tempfile)
    echo "${tmp}"
    python3 clean-cppcheck-xml.py "${input}" >"${tmp}"
    cat "${tmp}"
    input="$(realpath "${tmp}")"
fi

# must be in the action directory to use the npm packages installed there
cd /action
npx "@microsoft/sarif-multitool" convert "${input}" \
    --tool "${tool}" --output "${output}" --force
