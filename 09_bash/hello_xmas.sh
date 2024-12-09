#!/bin/bash
set -euo pipefail    

#    /\
#   /  \
#   /  \
#  /  o \
#  /    \
# / u    \
# --------
#    ||
#    ||

space="                                                                                                    "
divider="----------------------------------------------------------------------------------------------------"

ornaments() {
  local n="${1}"
  output=""
  for ((i=0; i<n; i++)); do
    if [ $RANDOM -lt "$((2**15/10))" ]; then
      output="${output}o"
    else
      output="${output} "
    fi
  done
  echo "${output}"
}


draw_tree() {
  local n="${1}"

  for ((i=0; i<n; i++)); do
    echo "${space:0:$((n-i))}/$(ornaments "$((i*2))")\\"
    echo "${space:0:$((n-i-1))}/$(ornaments "$(((i+1)*2))")\\"
  done

  echo "${divider:0:$((n*2 +2))}"

  echo "${space:0:$((n))}||"
  echo "${space:0:$((n))}||"
}

draw_tree 8
