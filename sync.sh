#!/bin/bash

set -x

export __dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file_to_change in $(cd ..; find ./ -name *.proto | grep -v $(basename ${__dir}))
do
	cp $(find ${__dir} -name $(basename ${file_to_change})) ../${file_to_change}
done
