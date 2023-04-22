#!/bin/bash
set -e

tool="${INPUT_TOOL}"
input="$(realpath "${INPUT_INPUT_FILE}")"
output="$(realpath "${INPUT_SARIF_FILE}")"

# must be in the action directory to use the npm packages installed there
cd "$(dirname ${0})"
npx "@microsoft/sarif-multitool" convert "${input}" \
    --tool "${tool}" --output "${output}" --log ForceOverwrite
