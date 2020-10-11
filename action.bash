#!/bin/bash
set -e

tool="${INPUT_TOOL}"
input="$(realpath "${INPUT_INPUT_FILE}")"
output="$(realpath "${INPUT_SARIF_FILE}")"

# actual cppcheck output contains a few items the converter doesn't
# understand
if [ "${tool,,}" = "cppcheck" ]; then
    tmp=$(tempfile)
    python3 "$(dirname ${0})"/clean-cppcheck-xml.py "${input}" >"${tmp}"
    input="$(realpath "${tmp}")"
fi

# must be in the action directory to use the npm packages installed there
cd "$(dirname ${0})"
npx "@microsoft/sarif-multitool" convert "${input}" \
    --tool "${tool}" --output "${output}" --force
